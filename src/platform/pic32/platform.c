//!\addtogroup STDIO_CONFIG
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

// PIC32 includes
#include <p32xxxx.h>
#include <plib.h>

// Project includes.
#include "genstd.h"
#include "platform.h"

#include "platform_conf.h"


//##################################################################################################
// Local MACRO Definitions
//==================================================================================================
#pragma config FPLLMUL = MUL_20, FPLLIDIV = DIV_2, FPLLODIV = DIV_1, FWDTEN = OFF
#pragma config POSCMOD = HS, FNOSC = PRIPLL, FPBDIV = DIV_1

//##################################################################################################
// Local Type Definitions
//==================================================================================================

//##################################################################################################
// Local Function Prototypes
//==================================================================================================

//##################################################################################################
// Module Variables
//==================================================================================================
static p_std_send_char std_send_char_func;
static p_std_get_char std_get_char_func;
int std_prev_char = -1;

//##################################################################################################
// Functional Implentation
//==================================================================================================
// .
int platform_init()
{
    timers_init();

    // Make all analog pins digital until they are required to be analog inputs.
    AD1PCFG = 0xffff;
    platform_setup_adcs();

    cmn_platform_init();

    CANIntHandler();

    return (0);
}

int platform_cpu_get_global_interrupts()
{
//  return Is_global_interrupt_enabled();//ToDo
    return (0);
}

// Set send/recv functions
void std_set_send_func( p_std_send_char pfunc )
{
  std_send_char_func = pfunc;
}

void std_set_get_func( p_std_get_char pfunc )
{
  std_get_char_func = pfunc;
}

int platform_cpu_set_global_interrupts( int status )
{
    PSPRestoreInterrupts(status);
    return 1;
}

// PSPDisableInterrupts disables all interrupts.
// For more descriptive comments, see header file.
inline IntState_t PSPDisableInterrupts(void)
{
    uint32_t status = 0;

    // Disable interrupts and read the previous interrupt status at the same
    // time.
    asm volatile("di    %0" : "=r"(status));

    return ((uint32_t)status);
}

// PSPRestoreInterrupts sets the interrupt level to a user specified level.
inline void PSPRestoreInterrupts(IntState_t intLevel)
{
    // Enable/Disable interrupts based on the intLevel setting.
    if(intLevel)
    {
        asm volatile("ei");
    }
    else
    {
        asm volatile("di");
    }
}

// PSPEnableInterrupts enables global interrupts.
// For more descriptive comments, see header file.
inline void PSPEnableInterrupts(void)
{
    uint32_t status = 0;

    // Enable interrupts.
    asm volatile("ei    %0" : "=r"(status));
}

// ConfigInterrupts enable/disable multi vector mode depending on the
// multiVecInt setting.
// Single vector mode, all interrupts go to the same interrupt handler.
// Multi vector mode, each interrupt has its own vector.
// For more descriptive comments, see fn prototype in the static fn prototype
// section.
void ConfigInterrupts(bool multiVecInt)
{
    uint32_t val;

    // set the CP0 cause IV bit high
    asm volatile("mfc0   %0,$13" : "=r"(val));
    val |= 0x00800000;
    asm volatile("mtc0   %0,$13" : "+r"(val));

    // Enable/disable multi vector mode depending on the multiVecInt setting.
    // Single vector mode, all interrupts go to the same interrupt handler.
    // Multi vector mode, each interrupt has its own vector.
    if(multiVecInt)
    {
        INTCONSET = _INTCON_MVEC_MASK;
    }
    else
    {
        INTCONCLR = _INTCON_MVEC_MASK;
    }
}

//!@}