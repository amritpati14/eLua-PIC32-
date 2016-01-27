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

#include "platform_conf.h"


//##################################################################################################
// Local MACRO Definitions
//==================================================================================================

//##################################################################################################
// Local Type Definitions
//==================================================================================================
typedef struct OC_Registers
{
    //! OCxCON: Output Compare 'x' Control Register
    volatile uint32_t OCxCON;
    //! Atomic Bit Manipulation (Clear) Write-only Registers for OCxCON.
    volatile uint32_t OCxCONCLR;
    //! Atomic Bit Manipulation (Set) Write-only Registers for OCxCON.
    volatile uint32_t OCxCONSET;
    //! Atomic Bit Manipulation (Invert) Write-only Registers for OCxCON.
    volatile uint32_t OCxCONINV;

    //! OCxR: Output Compare 'x' Compare Register
    volatile uint32_t OCxR;
    //! Atomic Bit Manipulation (Clear) Write-only Registers for OCxR.
    volatile uint32_t OCxRCLR;
    //! Atomic Bit Manipulation (Set) Write-only Registers for OCxR.
    volatile uint32_t OCxRSET;
    //! Atomic Bit Manipulation (Invert) Write-only Registers for OCxR.
    volatile uint32_t OCxRINV;

    //! OCxRS: Output Compare 'x' Secondary Compare Register
    volatile uint32_t OCxRS;
    //! Atomic Bit Manipulation (Clear) Write-only Registers for OCxRS.
    volatile uint32_t OCxRSCLR;
    //! Atomic Bit Manipulation (Set) Write-only Registers for OCxRS.
    volatile uint32_t OCxRSSET;
    //! Atomic Bit Manipulation (Invert) Write-only Registers for OCxRS.
    volatile uint32_t OCxRSINV;
} OC_Registers_t;

#define OC_ON_FLAG              (0x8000)
#define OC_32BIT_FLAG           (0x0020)
#define OC_FAULT_MASK           (0x0010)
#define OC_FAULT_STATE_SETTING  (0x0010)
#define OC_OK_STATE_SETTING     (0)
#define OC_TIMER_SEL_MASK       (0x0008)
#define OC_TIMER3_SEL_SETTING   (0x0008)
#define OC_TIMER2_SEL_SETTING   (0)
#define OC_MODE_MASK            (0x0007)
#define OC_MODE_PWM_W_FAULT     (0x0007)
#define OC_MODE_PWM_WO_FAULT    (0x0006)
#define OC_MODE_CONT_PULSE      (0x0005)
#define OC_MODE_SINGLE_PULSE    (0x0004)
#define OC_MODE_TOGGLE          (0x0003)
#define OC_MODE_HIGH            (0x0002)
#define OC_MODE_LOW             (0x0001)
#define OC_MODE_DISABLE         (0)


//##################################################################################################
// Local Function Prototypes
//==================================================================================================

//##################################################################################################
// Module Variables
//==================================================================================================
static OC_Registers_t * const ocBaseAddrs[NUM_PWM] =
{
    (OC_Registers_t * const)_OCMP1_BASE_ADDRESS,
    (OC_Registers_t * const)_OCMP2_BASE_ADDRESS,
    (OC_Registers_t * const)_OCMP3_BASE_ADDRESS,
    (OC_Registers_t * const)_OCMP4_BASE_ADDRESS,
    (OC_Registers_t * const)_OCMP5_BASE_ADDRESS,
};

//##################################################################################################
// Functional Implentation
//==================================================================================================
// .
u32 platform_pwm_get_clock( unsigned id )
{
    assert(NUM_PWM > id);
    OC_Registers_t * const ocRegs = ocBaseAddrs[id];
    uint8_t timerID;

    timerID = (ocRegs->OCxCON & OC_TIMER3_SEL_SETTING)? Timer_3: Timer_2;
    return (Timer_GetFreq(timerID, SYS_FREQ));
}

// Set the PWM clock
u32 platform_pwm_set_clock( unsigned id, u32 clock )
{
    assert(NUM_PWM > id);
    OC_Registers_t * const ocRegs = ocBaseAddrs[id];
    uint8_t timerID;

    timerID = clock;
    if((Timer_2 != timerID) && (Timer_3 != timerID))
    {
        // Default to Timer2 if an invalid clock is specified.
        timerID = Timer_2;
    }
    
    if(Timer_2 == timerID)
    {
        // Clear the Timer 3 select bit.
        ocRegs->OCxCONCLR = OC_TIMER3_SEL_SETTING;
    }
    else if(Timer_3 == timerID)
    {
        // Set the Timer 3 select bit.
        ocRegs->OCxCONSET = OC_TIMER3_SEL_SETTING;
    }
    return platform_pwm_get_clock( id );
}

u32 platform_pwm_setup( unsigned id, u32 frequency, unsigned duty )
{
    assert(NUM_PWM > id);
    OC_Registers_t * const ocRegs = ocBaseAddrs[id];
    uint32_t ocVal;
    uint8_t timerID;

    timerID = (ocRegs->OCxCON & OC_TIMER3_SEL_SETTING)? Timer_3: Timer_2;
    Timer16Update(timerID, frequency, SYS_FREQ);

    ocVal = Timer16GetPeriod(timerID);
    ocVal = (ocVal * duty) / 100;
    ocRegs->OCxCONCLR = OC_MODE_MASK;
    ocRegs->OCxRS = ocVal;
    ocRegs->OCxCONSET = OC_MODE_PWM_WO_FAULT;
    return platform_pwm_get_clock( id );
}

void platform_pwm_start( unsigned id )
{
    assert(NUM_PWM > id);
    OC_Registers_t * const ocRegs = ocBaseAddrs[id];

    ocRegs->OCxCONSET = OC_ON_FLAG;
}

void platform_pwm_stop( unsigned id )
{
    assert(NUM_PWM > id);
    OC_Registers_t * const ocRegs = ocBaseAddrs[id];

    ocRegs->OCxCONCLR = OC_ON_FLAG;
}
//!@}