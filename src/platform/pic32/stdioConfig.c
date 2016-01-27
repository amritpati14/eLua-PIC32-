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
void stdioInit(void)
{
    UARTConfigure(STDIO_UART, UART_ENABLE_PINS_TX_RX_ONLY);
    UARTSetFifoMode(STDIO_UART, UART_INTERRUPT_ON_TX_NOT_FULL | UART_INTERRUPT_ON_RX_NOT_EMPTY);
    UARTSetLineControl(STDIO_UART, UART_DATA_SIZE_8_BITS | UART_PARITY_NONE | UART_STOP_BITS_1);
    UARTSetDataRate(STDIO_UART, GetPeripheralClock(), STDIO_BAUD_RATE);
    UARTEnable(STDIO_UART, UART_ENABLE_FLAGS(UART_PERIPHERAL | UART_RX | UART_TX));
}

void _mon_putc (char data)
{
    while(!UARTTransmitterIsReady(STDIO_UART))
    {
        ;
    }
    UARTSendDataByte(STDIO_UART, data);
}

int _mon_getc (int canblock)
{
    int character = -1;
    if(canblock)
    {
        while(!UARTReceivedDataIsAvailable(STDIO_UART))
        {
            ;
        }
    }

    if(UARTReceivedDataIsAvailable(STDIO_UART))
    {
        character = UARTGetDataByte(STDIO_UART);
    }

    return (character);
}

// MicroChip library fgets function is not returning when a line feed is received!
char *fgets(char *buf, int maxLen, FILE *file)
{
    char *rcvdPtr;
    int remainingLen;
    bool gotStr;

    if(file == stdin)
    {
        gotStr = false;
        rcvdPtr = buf;
        remainingLen = maxLen;
        while(remainingLen && !gotStr)
        {
            *rcvdPtr = _mon_getc (true);
            if(*rcvdPtr == '\n')
            {
                *rcvdPtr = '\0';
                gotStr = true;
            }
            rcvdPtr++;
            remainingLen--;
        }
    }

    return (buf);
}

//!@}