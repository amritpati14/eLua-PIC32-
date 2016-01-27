// Generic platform configuration file

#ifndef __PLATFORM_CONF_H__
#define __PLATFORM_CONF_H__

// Includes definitions for C99 set width types.
#include <stdint.h>
// Includes C99 definitions for booleans
#include <stdbool.h>

#include "auxmods.h"
#include "type.h"
#include "sermux.h"
#include "buf.h"
#include "platform.h"

// Interrupts.
//! IntState_t is used to identify the level of interrupts that are currently
//! enabled.
typedef uint32_t IntState_t;

//==============================================================================
//! PSPDisableInterrupts disables all interrupts.
//!
//! This function disables all interrupts. The PSPDisableInterrupts function
//! also returns state of the interrupt enable, prior to disabling the
//! interrupts. This helps the user to reinstate the interrupts to the setting
//! that existed prior to disabling the interrupt.
//!
//! \return Returns the state of the interrupt enable prior to disabling the
//!     interrupt.
//==============================================================================
inline IntState_t PSPDisableInterrupts(void);

//==============================================================================
//! PSPRestoreInterrupts sets the interrupt level to a user specified level.
//!
//! \param intLevel sets the minimum interrupt priority to enable.
//!
//! This function enables the minimum interrupt priority level requested
//! by the caller. The intState indicates the state the interrupt enable is to
//! be set too.
//!
//! \return Does not return any parameters.
//==============================================================================
inline void PSPRestoreInterrupts(IntState_t intLevel);

//==============================================================================
//! PSPEnableInterrupts enables global interrupts.
//!
//! \return Does not return any parameters.
//==============================================================================
inline void PSPEnableInterrupts(void);

void ConfigInterrupts(bool multiVecInt);

void cmn_platform_init(void);

void platform_setup_adcs(void);

void CANIntHandler(void);

//! Timer16Ports is an enumerated type that creates a unique ID for each timer.
typedef enum TimerPorts
{
   Timer_1 = 0, Timer_2 = 1, Timer_3 = 2, Timer_4 = 3, Timer_5 = 4
} TimerPorts_t;

void Timer16Update(uint8_t timerID, uint32_t tickFreq, uint32_t periphFreq);

uint16_t Timer16GetPeriod(uint8_t timerID);

uint32_t Timer_GetFreq(uint8_t timerID, uint32_t periphFreq);

// *****************************************************************************
// Terminal Configuration
#define STDIO_UART                  (UART2)
#define STDIO_BAUD_RATE             (119200)

#define PLATFORM_HAS_SYSTIMER

// *****************************************************************************
// System Configuration
#define SYS_FREQ                        (80000000L)
#define CPU_FREQUENCY                   (SYS_FREQ)
#define	GetPeripheralClock()		(SYS_FREQ/(1 << OSCCONbits.PBDIV))
#define	GetInstructionClock()		(SYS_FREQ)


#define CON_UART_ID             0
#define CON_UART_SPEED          115200
#define CON_TIMER_ID            1
#define CON_FLOW_TYPE           (0)

#define BUILD_ADC
#define ADC_BIT_RESOLUTION      (10)

// *****************************************************************************
// PIO Configuration
#define PIO_PINS_PER_PORT       (16)
#define NUM_PIO                 (7)
#define NUM_SPI                 (4)
#define NUM_UART                (6)
#define NUM_TIMER               (5)
#define NUM_PHYS_TIMER          (5)
#define NUM_PWM                 (5)
#define NUM_ADC                 (16) // Number of ADC channels, not number of ADC's.
#define NUM_CAN                 (2)
#define NUM_I2C                 (4)

// PIO prefix ('0' for P0, P1, ... or 'A' for PA, PB, ...)
#define PIO_PREFIX            'A'

#define VTMR_NUM_TIMERS       4 // we need 4 virtual timers
#define VTMR_FREQ_HZ          4 // the base clock for the virtual timers is 4Hz



extern unsigned int _heap;
#define HEAP_SIZE               (64000ul)
#define MEM_START_ADDRESS       ((u32)_heap)
#define MEM_END_ADDRESS         ((u32)_heap + HEAP_SIZE)

// *****************************************************************************
// Auxiliary libraries that will be compiled for this platform
#define LUA_PLATFORM_LIBS_ROM\
  _ROM( AUXLIB_ADC, luaopen_adc, adc_map )\
  _ROM( AUXLIB_TMR, luaopen_tmr, tmr_map )\
  _ROM( AUXLIB_PD, luaopen_pd, pd_map)\
  _ROM( AUXLIB_PWM, luaopen_pwm, pwm_map)\
  _ROM( AUXLIB_SPI, luaopen_spi, spi_map )\
  _ROM( AUXLIB_UART, luaopen_uart, uart_map )\
  _ROM( AUXLIB_I2C, luaopen_i2c, i2c_map )\
  _ROM( AUXLIB_CAN, luaopen_can, can_map )\
  _ROM( AUXLIB_CPU, luaopen_cpu, cpu_map)\
  _ROM( AUXLIB_PIO, luaopen_pio, pio_map )\
  _ROM( AUXLIB_PACK, luaopen_pack, pack_map )\
  _ROM( AUXLIB_BIT, luaopen_bit, bit_map )\
  _ROM( LUA_MATHLIBNAME, luaopen_math, math_map )

#define PLATFORM_MODULES_LIBS_ROM LUA_PLATFORM_LIBS_ROM
// *****************************************************************************
// Function Prototypes
void timers_init();

#endif

