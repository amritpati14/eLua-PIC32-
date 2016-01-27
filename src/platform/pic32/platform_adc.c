//!\addtogroup PLATFORM
//!@{
//##################################################################################################
//
// .
//
//##################################################################################################
// Include Files
//==================================================================================================
// Includes definitions for C99 set width types.
#include <stdint.h>
// Includes C99 definitions for booleans
#include <stdbool.h>

#include <assert.h>

// PIC32 includes
#include <p32xxxx.h>
#include <plib.h>

// Project includes.
#include "genstd.h"
#include "platform.h"
#include "elua_adc.h"

#include "platform_conf.h"


//##################################################################################################
// Local MACRO Definitions
//==================================================================================================
#define ADC_INT_FLAG                (0x0002)

//##################################################################################################
// Local Type Definitions
//==================================================================================================
// define setup parameters for OpenADC10
// Turn module on | ouput in integer | trigger mode auto | enable autosample
//#define PARAM1  (ADC_MODULE_ON | ADC_FORMAT_INTG)
#define PARAM1  (ADC_CLK_AUTO | ADC_AUTO_SAMPLING_ON | ADC_SAMP_ON)

// define setup parameters for OpenADC10
// ADC ref external    | disable offset test    | disable scan mode | perform 2 samples | use dual buffers | use alternate mode
#define PARAM2  (ADC_VREF_AVDD_AVSS | ADC_OFFSET_CAL_DISABLE | ADC_SCAN_ON | ADC_SAMPLES_PER_INT_1 | ADC_BUF_16 | ADC_ALT_INPUT_OFF)

// define setup parameters for OpenADC10
//                   use ADC internal clock | set sample time
#define PARAM3  (ADC_CONV_CLK_PB | ADC_SAMPLE_TIME_31 | ADC_CONV_CLK_9Tcy2)

// define setup parameters for OpenADC10
// do not assign channels to scan
#define PARAM4    (0)

// define setup parameters for OpenADC10
// set AN4 and AN5 as analog inputs
#define PARAM5    (SKIP_SCAN_ALL)


//##################################################################################################
// Local Function Prototypes
//==================================================================================================

//##################################################################################################
// Module Variables
//==================================================================================================


//##################################################################################################
// Functional Implentation
//==================================================================================================
// .
#ifdef BUILD_ADC
int platform_adc_check_timer_id( unsigned id, unsigned timer_id )
{
  return 0; // This platform does not support direct timer triggering
}

void platform_adc_stop( unsigned id )
{
  elua_adc_ch_state *s = adc_get_ch_state( id );
  elua_adc_dev_state *d = adc_get_dev_state( 0 );

  s->op_pending = 0;
  INACTIVATE_CHANNEL( d, id );
  AD1CSSLCLR = (1 << id);
  AD1PCFGSET = (1 << id);

  // If there are no more active channels, stop the sequencer
  if( d->ch_active == 0 )
    d->running = 0;
}

void __ISR(_ADC_VECTOR, ipl3) ADCInterruptHandler(void)
{
  // Clear the ADC's interrupt flag.
  IFS1CLR = ADC_INT_FLAG;

  elua_adc_dev_state *d = adc_get_dev_state( 0 );
  elua_adc_ch_state *s;
  
  if ( AD1CON1bits.DONE )
  {
    d->seq_ctr = 0;
    while( d->seq_ctr < d->seq_len )
    {
      s = d->ch_state[ d->seq_ctr ];
      d->sample_buf[ d->seq_ctr ] = ( u16 )ReadADC10(0);
      s->value_fresh = 1;

      // Fill in smoothing buffer until warmed up
      if ( s->logsmoothlen > 0 && s->smooth_ready == 0)
        adc_smooth_data( s->id );
#if defined( BUF_ENABLE_ADC )
      else if ( s->reqsamples > 1 )
      {
        buf_write( BUF_ID_ADC, s->id, ( t_buf_data* )s->value_ptr );
        s->value_fresh = 0;
      }
#endif
      // If we have the number of requested samples, stop sampling
      if ( adc_samples_available( s->id ) >= s->reqsamples && s->freerunning == 0 )
        platform_adc_stop( s->id );

      d->seq_ctr++;
    }
    d->seq_ctr = 0;
  }

  if( d->running == 1 )
    adc_update_dev_sequence( 0 );

  if ( d->clocked == 0 && d->running == 1 )
  {
      // start conversion
      AD1CON1SET = _AD1CON1_ASAM_MASK;
      AD1CON1SET = _AD1CON1_SAMP_MASK;
  }

  if(!d->running)
  {
      CloseADC10();
  }
}

void platform_setup_adcs()
{
  unsigned id;

  for( id = 0; id < NUM_ADC; id ++ )
    adc_init_ch_state( id );
  
  CloseADC10();   // Ensure the ADC is off before setting the configuration
  OpenADC10(PARAM1, PARAM2, PARAM3, PARAM4, PARAM5);
  ConfigIntADC10(ADC_INT_ON | ADC_INT_PRI_3 | ADC_INT_SUB_PRI_1);

  platform_adc_set_clock( 0, 0 );
}

// NOTE: On this platform, there is only one ADC, clock settings apply to the whole device
u32 platform_adc_set_clock( unsigned id, u32 frequency )
{
  elua_adc_dev_state *d = adc_get_dev_state( 0 );

  // No clocked conversions supported
  d->clocked = 0;

  return 0;
}

// Prepare Hardware Channel
int platform_adc_update_sequence( )
{
  elua_adc_dev_state *d = adc_get_dev_state( 0 );

  CloseADC10();   // Ensure the ADC is off before setting the configuration

  AD1CSSL = 0;
  AD1PCFG = 0xffffffff;

  platform_setup_adcs();

  d->seq_ctr = 0;
  while( d->seq_ctr < d->seq_len )
  {
    AD1CSSLSET = (1 << d->ch_state[ d->seq_ctr ]->id);
    AD1PCFGCLR = (1 << d->ch_state[ d->seq_ctr ]->id);
    d->seq_ctr++;
  }
  d->seq_ctr = 0;

  EnableADC10();

  // start conversion
  AD1CON1SET = _AD1CON1_ASAM_MASK;
  AD1CON1SET = _AD1CON1_SAMP_MASK;
  
  return PLATFORM_OK;
}

int platform_adc_start_sequence()
{
    elua_adc_dev_state *d = adc_get_dev_state( 0 );

    // Only force update and initiate if we weren't already running
    // changes will get picked up during next interrupt cycle
    if ( d->running != 1 )
    {
      // Bail if we somehow were trying to set up clocked conversion
      if( d->clocked == 1 )
        return PLATFORM_ERR;

      d->running = 1;
      adc_update_dev_sequence( 0 );
    }

    return PLATFORM_OK;
}
#endif // ifdef BUILD_ADC
//!@}