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
void platform_s_uart_send( unsigned id, u8 data )
{
    if(id != STDIO_UART)
    {
        while(!UARTTransmitterIsReady(id))
        {
            ;
        }
        UARTSendDataByte(id, data);
    }
}

void WaitForChar(unsigned id, timer_data_type timeout)
{
    bool complete = false;

    do
    {
        if(!timeout)
        {
            complete = true;
        }
        else if(timeout != PLATFORM_TIMER_INF_TIMEOUT)
        {
            // NOTE: the calling code is actually handling the time out, so no need currently to
            // handle time out here.
            //complete
            // ToDo: implement timeout.
        }
    }
    while(!UARTReceivedDataIsAvailable(id) && !complete);
}

int platform_s_uart_recv( unsigned id, timer_data_type timeout )
{
    int character = -1;
    if(id != STDIO_UART)
    {
if(timeout)
{
timeout = timeout;
}
        WaitForChar(id, timeout);
        if(UARTReceivedDataIsAvailable(id))
        {
            character = UARTGetDataByte(id);
        }
    }
    return character;
}

int platform_s_uart_set_flow_control( unsigned id, int type )
{
  return PLATFORM_ERR;
}

u32 platform_uart_setup( unsigned id, u32 baud, int databits, int parity, int stopbits )
{
    u32 result = 0;

    if(id != STDIO_UART)
    {
        UART_LINE_CONTROL_MODE mode = 0;

        switch(databits)
        {
        case 9:
            mode |= UART_DATA_SIZE_9_BITS;
            break;

        case 8:
        default:
            mode |= UART_DATA_SIZE_8_BITS;
            break;
        }

        switch(parity)
        {
        case 1:
            mode |= UART_PARITY_ODD;
            break;

        case 0:
            mode |= UART_PARITY_EVEN;
            break;

        case 2:
        default:
            mode |= UART_PARITY_NONE;
            break;
        }

        switch(stopbits)
        {
        case 1:
        case 2:
            mode |= UART_STOP_BITS_2;
            break;

        case 0:
        default:
            mode |= UART_STOP_BITS_1;
            break;
        }

        UARTConfigure(id, UART_ENABLE_PINS_TX_RX_ONLY);
        UARTSetFifoMode(id, UART_INTERRUPT_ON_TX_NOT_FULL | UART_INTERRUPT_ON_RX_NOT_EMPTY);
        UARTSetLineControl(id, mode);
        UARTSetDataRate(id, GetPeripheralClock(), baud);
        UARTEnable(id, UART_ENABLE_FLAGS(UART_PERIPHERAL | UART_RX | UART_TX));

        result = 1;
    }
    
    return (result);
}

//!@}
