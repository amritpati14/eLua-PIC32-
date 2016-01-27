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
#define MAX_BAUD_DIV    (0x000001ff)

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
u32 platform_spi_setup( unsigned id, int mode, u32 clock, unsigned cpol, unsigned cpha, unsigned databits )
{
    SpiOpenFlags spiFlags;
    unsigned int srcClkDiv;
    uint32_t spiFreq;
    bool gotBAUD = false;
    u32 result = 1;

    // For some reason the SPI IDs are starting at one which is different from the other peripheral
    // libraries.
    id += 1;

    spiFlags = SPI_OPEN_ON;
    spiFlags |= (mode)? SPI_OPEN_MSTEN : SPI_OPEN_SSEN;
    spiFlags |= (cpol)? SPI_OPEN_CKP_HIGH: 0;
    spiFlags |= (cpha)? SPI_OPEN_CKE_REV: 0;
    switch(databits)
    {
    case 16:
        spiFlags |= SPI_OPEN_MODE16;
        break;

    case 32:
        spiFlags |= SPI_OPEN_MODE32;
        break;

    case 8:
    default:
        spiFlags |= SPI_OPEN_MODE8;
        break;
    }

    srcClkDiv = 1;
    do
    {
        if(srcClkDiv < MAX_BAUD_DIV)
        {
            //spiFreq = SYS_FREQ / (2 * (srcClkDiv + 1)); // Formula from datasheet, library fn. converting divider into correct setting value.
            spiFreq = (SYS_FREQ / srcClkDiv);
            if(spiFreq <= clock)
            {
                gotBAUD = true;
            }
            else
            {
                srcClkDiv++;
            }
        }
        else
        {
            gotBAUD = true;
        }
    }
    while(!gotBAUD);

    SpiChnOpen(id, spiFlags, srcClkDiv);
    return (result);
}

spi_data_type platform_spi_send_recv( unsigned id, spi_data_type data )
{
    spi_data_type rcvdData = -1;

    // For some reason the SPI IDs are starting at one which is different from the other peripheral
    // libraries.
    id += 1;
    
    SpiChnPutC(id, data);
    rcvdData = SpiChnGetC(id);
    return (rcvdData);
}

void platform_spi_select( unsigned id, int is_select )
{
    // Not supporting since SPI tranfers are done on a word basis, better off leaving it to the user
    // to set the pin manually.
}

//!@}
