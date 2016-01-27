//!\addtogroup PLATFORM
//!@{
//##################################################################################################
//
// Using Timer 1 as the system timer, leaving the remaining timers as eLua timers. The core timer
// will not be used as the system timer. The core timer only has a compare interrupt, with a
// scripting laguage controlling the interrupts the compare value may not be updated in time for the
// next interval. While it is possible to circumvent this issue, it could get a little messy. Using
// Timer 1 as the system timer leaves all the Type B timers available for implementing 32bit timers
// if desired. Also Timer 1 is not used for pwm generation, so this will have limited impact on
// available resources.
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

void cmn_virtual_timer_cb(void);
void cmn_systimer_periodic(void);
timer_data_type cmn_systimer_get(void);
void cmn_systimer_set_base_freq( u32 freq_hz );
void cmn_systimer_set_interrupt_freq( u32 freq_hz );

//##################################################################################################
// Local MACRO Definitions
//==================================================================================================
//! T16_INTERNAL_CLK is used to select the internal system clock to drive the
//! 16bit timer.
#define T16_INTERNAL_CLK            (0x00)
//! T16_EXTERNAL_CLK is used to select an external clock to drive the 16bit
//! timer.
#define T16_EXTERNAL_CLK            (0x01)


#define MAX_NUM_TIMER16             (5)

#define  _1MHZ                      (1000000)

#define NUM_OF_PRESCALARS           (8)

#define PRIORITY_MASK               (0x0007)

#define  T16_CON_ON                 (0x8000)
#define  T16_CON_PRESCALAR_OFFSET   (4)
#define  T16_CON_PRESCALAR_MASK     (0x0007)
#define  T16_CON_EXTERNAL_CLK       (0x0002)
#define  T16_CON_INTERNAL_CLK       (0x0000)

#define TIMER1_INT_FLAG             (0x00000010)
#define TIMER1_INT_PRI_OFFSET       (2)
#define TIMER1_INT_PRI2_OFFSET      (0)

#define TIMER2_INT_FLAG             (0x00000100)
#define TIMER2_INT_PRI_OFFSET       (2)
#define TIMER2_INT_PRI2_OFFSET      (0)

#define TIMER3_INT_FLAG             (0x00001000)
#define TIMER3_INT_PRI_OFFSET       (2)
#define TIMER3_INT_PRI2_OFFSET      (0)

#define TIMER4_INT_FLAG             (0x00010000)
#define TIMER4_INT_PRI_OFFSET       (2)
#define TIMER4_INT_PRI2_OFFSET      (0)

#define TIMER5_INT_FLAG             (0x00100000)
#define TIMER5_INT_PRI_OFFSET       (2)
#define TIMER5_INT_PRI2_OFFSET      (0)


#define SYSTEM_TIMER                (Timer_1)
#define SYSTEM_TIMER_FREQ           (10000000ull)
#define SYSTEM_TIMER_PERIOD         (10000)
#define TIMER_INT_PRIORITY          (3)

#define TIMER_MAX_COUNT             (UINT16_MAX)

#define TIMER_DEFAULT_FREQ          (10000000ull)

//##################################################################################################
// Local Type Definitions
//==================================================================================================
//! UART_Registers_t describes the generic SFR register mapping for the UART
//! ports.
typedef struct Timer16_Registers
{
    //! TxCON: Timer Control Register
    volatile uint32_t TxCON;
    //! Atomic Bit Manipulation (Clear) Write-only Registers for TxCON.
    volatile uint32_t TxCONCLR;
    //! Atomic Bit Manipulation (Set) Write-only Registers for TxCON.
    volatile uint32_t TxCONSET;
    //! Atomic Bit Manipulation (Invert) Write-only Registers for TxCON.
    volatile uint32_t TxCONINV;

    //! TMRx: Timer Register
    volatile uint32_t TMRx;
    //! Atomic Bit Manipulation (Clear) Write-only Registers for TMRx.
    volatile uint32_t TMRxCLR;
    //! Atomic Bit Manipulation (Set) Write-only Registers for TMRx.
    volatile uint32_t TMRxSET;
    //! Atomic Bit Manipulation (Invert) Write-only Registers for TMRx.
    volatile uint32_t TMRxINV;

    //! PRx: Period Register
    volatile uint32_t PRx;
    //! Atomic Bit Manipulation (Clear) Write-only Registers for PRx.
    volatile uint32_t PRxCLR;
    //! Atomic Bit Manipulation (Set) Write-only Registers for PRx.
    volatile uint32_t PRxSET;
    //! Atomic Bit Manipulation (Invert) Write-only Registers for PRx.
    volatile uint32_t PRxINV;
} Timer16_Registers_t;

//! Timer16_IntContext is a structure that contains all the necessary
//! information required to configure, control and monitor a given timers
//! interrupt.
typedef struct Timer16_IntContext
{
    // All timers use the IEC0 and IFS0 registers so no need to have a IECx and
    // IFSx saved in the context structure.
    uint32_t IntFlag;
    volatile uint32_t *IPC_Register;
    uint8_t PriorityPos;
    uint8_t _2ndryPriorityPos;
} Timer16_IntContext_t;


//##################################################################################################
// Local Function Prototypes
//==================================================================================================

//==============================================================================
//! Timer16InitFreq initializes a requested 16 bit hardware timer to a user
//! requested configuration.
//!
//! \param timerID identifies which 16 bit hardware timer to control.
//! \param tickFreq is the frequency of the timer tick.
//! \param periphFreq is the peripheral clock frequency.
//! \param mode is used to select timer functionality, such as clock source.
//! \param enableInt indicates whether to enable the interrupt related to the
//!     requested timer.
//! \param intPriority sets the correspondint interrupts priority level.
//!
//! \return Does not return any parameters.
//==============================================================================
void Timer16Init(uint8_t timerID,
                        uint16_t periodCnt,
                    uint32_t tickFreq,
                    uint32_t periphFreq,
                    uint8_t mode,
                    bool enableInt,
                    uint8_t intPriority);

//==============================================================================
//! Timer16EnableInt enables/disables the interrupt related to the requested
//! timer.
//!
//! \param timerID identifies which 16 bit hardware timer to control.
//! \param enableInt indicates whether to enable the interrupt related to the
//!     requested timer.
//!
//! \return Does not return any parameters.
//==============================================================================
void Timer16EnableInt(uint8_t timerID, bool enableInt);

//==============================================================================
//! Timer16Get gets the value of the timer.
//!
//! \param timerID identifies which 32 bit hardware timer to control.
//!
//! \return Returns the current value of the timer.
//==============================================================================
uint16_t Timer16Get(uint8_t timerID);

//==============================================================================
//! Timer16UpdateCarrier updates the timers timing parameters.
//!
//! \param timerID identifies which 32 bit hardware timer to control.
//! \param tickFreq is the frequency of the timer tick.
//! \param periphFreq is the peripheral clock frequency.
//!
//! \return Does not return any parameters.
//==============================================================================
void Timer16UpdateCarrier(uint8_t timerID, uint16_t periodCnt, uint32_t tickFreq, uint32_t periphFreq);

void SysTick_Handler( void );

static u32 platform_timer_get_clock( unsigned id );


//##################################################################################################
// Module Variables
//==================================================================================================
//! timer16BaseAddrs contains pointers to the base address of each UART ports
//! SFR bank.
static Timer16_Registers_t * const timer16BaseAddrs[MAX_NUM_TIMER16] =
{
    (Timer16_Registers_t * const)_TMR1_BASE_ADDRESS,
    (Timer16_Registers_t * const)_TMR2_BASE_ADDRESS,
    (Timer16_Registers_t * const)_TMR3_BASE_ADDRESS,
    (Timer16_Registers_t * const)_TMR4_BASE_ADDRESS,
    (Timer16_Registers_t * const)_TMR5_BASE_ADDRESS,
};

//! clkDivisors specifies all the valid divisor values for Timer16 timers.
//! The two different timer types have different prescalers.
static const uint16_t timer16Divisors[MAX_NUM_TIMER16][NUM_OF_PRESCALARS] =
{
    {1, 8, 64, 256,  0,  0,  0,   0},
    {1, 2,  4,   8, 16, 32, 64, 256},
    {1, 2,  4,   8, 16, 32, 64, 256},
    {1, 2,  4,   8, 16, 32, 64, 256},
    {1, 2,  4,   8, 16, 32, 64, 256},
};

//! timer16Ints is a lookup table the contains the interrupt contexts for all
//! the 16bit timers.
static const Timer16_IntContext_t timer16Ints[MAX_NUM_TIMER16] =
{
    {TIMER1_INT_FLAG, &IPC1, TIMER1_INT_PRI_OFFSET, TIMER1_INT_PRI2_OFFSET},
    {TIMER2_INT_FLAG, &IPC2, TIMER2_INT_PRI_OFFSET, TIMER2_INT_PRI2_OFFSET},
    {TIMER3_INT_FLAG, &IPC3, TIMER3_INT_PRI_OFFSET, TIMER3_INT_PRI2_OFFSET},
    {TIMER4_INT_FLAG, &IPC4, TIMER4_INT_PRI_OFFSET, TIMER4_INT_PRI2_OFFSET},
    {TIMER5_INT_FLAG, &IPC5, TIMER5_INT_PRI_OFFSET, TIMER5_INT_PRI2_OFFSET},
};


//##################################################################################################
// Functional Implentation
//==================================================================================================
void __ISR(_TIMER_1_VECTOR, ipl3) Timer1InterruptHandler(void)
{
    IFS0CLR = TIMER1_INT_FLAG;
    SysTick_Handler();
}

void __ISR(_TIMER_2_VECTOR, ipl3) Timer2InterruptHandler(void)
{
    IFS0CLR = TIMER2_INT_FLAG;
}

void __ISR(_TIMER_3_VECTOR, ipl3) Timer3InterruptHandler(void)
{
    IFS0CLR = TIMER3_INT_FLAG;
}

void __ISR(_TIMER_4_VECTOR, ipl3) Timer4InterruptHandler(void)
{
    IFS0CLR = TIMER4_INT_FLAG;
}

void __ISR(_TIMER_5_VECTOR, ipl3) Timer5InterruptHandler(void)
{
    IFS0CLR = TIMER5_INT_FLAG;
}

void Timer16Init(uint8_t timerID,
                        uint16_t periodCnt,
                        uint32_t clkFreq,
                        uint32_t periphFreq,
                        uint8_t mode,
                        bool enableInt,
                        uint8_t intPriority)
{
    Timer16_Registers_t * const timerRegs = timer16BaseAddrs[timerID];
    const Timer16_IntContext_t * intContext = &timer16Ints[timerID];

    assert(MAX_NUM_TIMER16 > timerID);
    assert(NULL != intContext->IPC_Register);

    // Stop timer and clear the control register
    timerRegs->TxCON = 0;
    if(T16_EXTERNAL_CLK & mode)
    {
        timerRegs->TxCONSET = T16_CON_EXTERNAL_CLK;
    }

    // Configure the timers interrupt.
    *intContext->IPC_Register &= ~(PRIORITY_MASK << intContext->PriorityPos);
    *intContext->IPC_Register |= (intPriority << intContext->PriorityPos);
    Timer16EnableInt(timerID, enableInt);

    Timer16UpdateCarrier(timerID, periodCnt, clkFreq, periphFreq);
    timerRegs->TxCONSET = T16_CON_ON;
}

// Timer16EnableInt enables/disables the interrupt related to the requested
// timer.
// For more descriptive comments, see header file.
void Timer16EnableInt(uint8_t timerID, bool enableInt)
{
    const Timer16_IntContext_t * intContext = &timer16Ints[timerID];

    assert(MAX_NUM_TIMER16 > timerID);
    assert(NULL != intContext->IPC_Register);

    // All timers use the IEC0 and IFS0 registers.
    IFS0CLR = intContext->IntFlag;
    IEC0CLR = intContext->IntFlag;
    if(enableInt)
    {
        // All timers use the IEC0 and IFS0 registers.
        IEC0SET = intContext->IntFlag;
    }
}

// Timer16Get gets the value of the timer.
// For more descriptive comments, see header file.
uint16_t Timer16Get(uint8_t timerID)
{
    Timer16_Registers_t * const timerRegs = timer16BaseAddrs[timerID];

    assert(MAX_NUM_TIMER16 > timerID);

    return (timerRegs->TMRx);
}

uint16_t Timer16GetPeriod(uint8_t timerID)
{
    Timer16_Registers_t * const timerRegs = timer16BaseAddrs[timerID];

    assert(MAX_NUM_TIMER16 > timerID);

    return (timerRegs->PRx);
}

uint32_t GetFreqErr(uint16_t freqScalar, uint32_t clkFreq, uint32_t periphFreq)
{
    uint32_t scaledFreq;
    uint32_t freqErr = UINT32_MAX;

    if(freqScalar)
    {
        scaledFreq = periphFreq / freqScalar;
        freqErr = (scaledFreq > clkFreq)? (scaledFreq - clkFreq): (clkFreq - scaledFreq);
    }
    return (freqErr);
}

// Timer16UpdateCarrier updates the timers timing parameters.
// For more descriptive comments, see header file.
void Timer16UpdateCarrier(uint8_t timerID, uint16_t periodCnt, uint32_t carrierFreq, uint32_t periphFreq)
{
    IntState_t intState;
    uint8_t idx;
    bool complete;
    uint32_t freqMult;
    uint32_t currFreqErr;
    uint32_t nextFreqErr;
    Timer16_Registers_t * const timerRegs = timer16BaseAddrs[timerID];

    assert(MAX_NUM_TIMER16 > timerID);
    assert(carrierFreq);
    
    // Calculate the timer value and prescalar to give the desired interval.
    idx = 0;
    complete = false;
    freqMult = periphFreq / carrierFreq;
    while(!complete)
    {
        if((freqMult <= timer16Divisors[timerID][idx]) || ((NUM_OF_PRESCALARS - 1) <= idx))
        {
            complete = true;
        }
        else
        {
            currFreqErr = GetFreqErr(timer16Divisors[timerID][idx] , carrierFreq, periphFreq);
            nextFreqErr = GetFreqErr(timer16Divisors[timerID][idx + 1] , carrierFreq, periphFreq);
            if(currFreqErr <= nextFreqErr)
            {
                complete = true;
            }
            else
            {
                idx++;
            }
        }
    }

    // Initialise the timer.
    intState = PSPDisableInterrupts();
    timerRegs->TxCONCLR = T16_CON_ON;
    timerRegs->TxCONCLR = (T16_CON_PRESCALAR_MASK << T16_CON_PRESCALAR_OFFSET);
    timerRegs->TxCONSET = (idx << T16_CON_PRESCALAR_OFFSET);
    timerRegs->TMRx = 0;
    timerRegs->PRx = periodCnt;
    timerRegs->TxCONSET = T16_CON_ON;
    PSPRestoreInterrupts(intState);
}

// Timer16Update updates the timers timing parameters.
// For more descriptive comments, see header file.
void Timer16Update(uint8_t timerID, uint32_t tickFreq, uint32_t periphFreq)
{
    IntState_t intState;
    uint32_t timerCount;
    uint32_t clkVal;
    uint8_t idx;
    uint8_t prescalar;
    bool complete;
    Timer16_Registers_t * const timerRegs = timer16BaseAddrs[timerID];
    
    assert(MAX_NUM_TIMER16 > timerID);

    // Calculate the timer value and prescalar to give the desired interval.
    timerCount = (periphFreq + (tickFreq / 2)) / tickFreq;
    idx = 0;
    complete = false;
    do
    {
        // Timer A type timers have less clock prescalar options, so ignore any
        // 0 divisor values
        if(timer16Divisors[timerID][idx])
        {
            prescalar = idx;
            clkVal = timerCount / timer16Divisors[timerID][prescalar];
            // Timer resets the timer pulse after the match, so there is one
            // more timer tick than clkVal. Need to allow for the extra clock
            // pulse.
            if(clkVal)
            {
                clkVal -= 1;
            }
        }
        idx++;
        if(NUM_OF_PRESCALARS <= idx)
        {
            complete = true;
        }
        if(UINT16_MAX >= clkVal)
        {
            complete = true;
        }
    } while (!complete);

    // Initialise the timer.
    intState = PSPDisableInterrupts();
    timerRegs->TxCONCLR = T16_CON_ON;
    timerRegs->TxCONCLR = (T16_CON_PRESCALAR_MASK << T16_CON_PRESCALAR_OFFSET);
    timerRegs->TxCONSET = (prescalar << T16_CON_PRESCALAR_OFFSET);
    timerRegs->TMRx = 0;
    if(UINT16_MAX >= clkVal)
    {
        timerRegs->PRx = clkVal;
    }
    else
    {
        timerRegs->PRx = UINT16_MAX;
    }
    timerRegs->TxCONSET = T16_CON_ON;
    PSPRestoreInterrupts(intState);
}

uint32_t Timer_GetFreq(uint8_t timerID, uint32_t periphFreq)
{
    Timer16_Registers_t * const timerRegs = timer16BaseAddrs[timerID];
    uint32_t freq;
    uint8_t prescalarIdx;
    
    assert(MAX_NUM_TIMER16 > timerID);
    
    prescalarIdx = (timerRegs->TxCON & T16_CON_PRESCALAR_MASK) >> T16_CON_PRESCALAR_OFFSET;
    freq = periphFreq / (timer16Divisors[timerID][prescalarIdx] * (timerRegs->PRx + 1));
    return (freq);
}

// .
void timers_init()
{
//    Timer16InitFreq(Timer_1,
//                TIMER_MAX_COUNT,
//                TIMER_DEFAULT_FREQ,
//                SYS_FREQ,
//                (T16_INTERNAL_CLK),
//                false,
//                TIMER_INT_PRIORITY);
    Timer16Init(Timer_2,
                TIMER_MAX_COUNT,
                TIMER_DEFAULT_FREQ,
                SYS_FREQ,
                (T16_INTERNAL_CLK),
                false,
                TIMER_INT_PRIORITY);
    Timer16Init(Timer_3,
                TIMER_MAX_COUNT,
                TIMER_DEFAULT_FREQ,
                SYS_FREQ,
                (T16_INTERNAL_CLK),
                false,
                TIMER_INT_PRIORITY);
    Timer16Init(Timer_4,
                TIMER_MAX_COUNT,
                TIMER_DEFAULT_FREQ,
                SYS_FREQ,
                (T16_INTERNAL_CLK),
                false,
                TIMER_INT_PRIORITY);
    Timer16Init(Timer_5,
                TIMER_MAX_COUNT,
                TIMER_DEFAULT_FREQ,
                SYS_FREQ,
                (T16_INTERNAL_CLK),
                false,
                TIMER_INT_PRIORITY);

    // Initialize the system timer
    cmn_systimer_set_base_freq( platform_timer_get_clock(SYSTEM_TIMER) );
    cmn_systimer_set_interrupt_freq(SYSTEM_TIMER_FREQ);
    Timer16Init(SYSTEM_TIMER,
                SYSTEM_TIMER_PERIOD,
                SYSTEM_TIMER_FREQ,
                SYS_FREQ,
                (T16_INTERNAL_CLK),
                true,
                TIMER_INT_PRIORITY);
}


void SysTick_Handler( void )
{
  // Handle virtual timers
  cmn_virtual_timer_cb();

  // Handle system timer call
  cmn_systimer_periodic();
}

u64 platform_timer_sys_raw_read()
{
    Timer16_Registers_t * const timerRegs = timer16BaseAddrs[SYSTEM_TIMER];
    assert(MAX_NUM_TIMER16 > SYSTEM_TIMER);
    return (timerRegs->TMRx);
}

void platform_timer_sys_disable_int()
{
    Timer16EnableInt(SYSTEM_TIMER, false);
}

void platform_timer_sys_enable_int()
{
    Timer16EnableInt(SYSTEM_TIMER, true);
}

timer_data_type platform_timer_read_sys()
{
  return cmn_systimer_get();
}


static u32 platform_timer_get_clock( unsigned id )
{
    Timer16_Registers_t * const timerRegs = timer16BaseAddrs[id];
    assert(MAX_NUM_TIMER16 > id);
    uint8_t prescalarSetting = (timerRegs->TxCON >> T16_CON_PRESCALAR_OFFSET) & T16_CON_PRESCALAR_MASK;
    return (SYS_FREQ / timer16Divisors[id][prescalarSetting]);
}

static u32 platform_timer_set_clock( unsigned id, u32 clock )
{
    if((SYSTEM_TIMER != id))
    {
        Timer16UpdateCarrier(id, TIMER_MAX_COUNT, clock, SYS_FREQ);
    }
    return (platform_timer_get_clock(id));
}

void platform_s_timer_delay( unsigned id, timer_data_type delay_us )
{
    Timer16_Registers_t * const timerRegs = timer16BaseAddrs[id];
    timer_data_type usRemaining = delay_us;
    timer_data_type delayedTime;
    timer_data_type timerThres;
    uint16_t lastTmrVal;
    uint16_t currTmrVal;

    // To reduce the effect of rounding, using timerThres to set a minimum delay before decrementing
    // the usRemaining value. This should improve accuracy of the timer. timerThres can't be close
    // to the maximum delay, otherwise we run the risk of the timer wrapping before we have the
    // opportunity of decrementing the usRemaining value.
    timerThres = platform_timer_op( id, PLATFORM_TIMER_OP_GET_MAX_DELAY, 0 ) / 2;

    assert(MAX_NUM_TIMER16 > id);
    
    lastTmrVal = timerRegs->TMRx;
    while(usRemaining)
    {
        currTmrVal = timerRegs->TMRx;
        delayedTime = platform_timer_get_diff_us(id, lastTmrVal, currTmrVal);
        if(delayedTime >= usRemaining)
        {
            usRemaining = 0;
        }
        else if(delayedTime >= timerThres)
        {
            usRemaining -= delayedTime;
            lastTmrVal = currTmrVal;
        }
    }
}

timer_data_type platform_s_timer_op( unsigned id, int op,timer_data_type data )
{
    u32 res = 1;
    volatile unsigned dummy;

    switch( op )
    {
    case PLATFORM_TIMER_OP_START:
        if(id != SYSTEM_TIMER)
        {
            Timer16_Registers_t * const timerRegs = timer16BaseAddrs[id];
            assert(MAX_NUM_TIMER16 > id);
            timerRegs->TMRx = 0;
            for( dummy = 0; dummy < 200; dummy ++ );
        }
        else
        {
            res = 0;
        }
        break;

    case PLATFORM_TIMER_OP_READ:
        {
            Timer16_Registers_t * const timerRegs = timer16BaseAddrs[id];
            assert(MAX_NUM_TIMER16 > id);
            res = timerRegs->TMRx;
        }
        break;

    case PLATFORM_TIMER_OP_SET_CLOCK:
        if(id != SYSTEM_TIMER)
        {
            res = platform_timer_set_clock( id, data );
        }
        else
        {
            res = platform_timer_get_clock( id );
        }
        break;

    case PLATFORM_TIMER_OP_GET_CLOCK:
        res = platform_timer_get_clock( id );
        break;

    case PLATFORM_TIMER_OP_GET_MAX_CNT:
        res = Timer16GetPeriod(id);
        break;

    default:
        res = 0;
        break;
    }
    return res;
}

//!@}
