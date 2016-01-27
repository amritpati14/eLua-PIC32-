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
u32 platform_i2c_setup( unsigned id, u32 speed )
{
    u32 result;

    I2CConfigure (id, I2C_ENABLE_SLAVE_CLOCK_STRETCHING);
    result = I2CSetFrequency (id, SYS_FREQ, speed );
    I2CEnable(id, true);
    return (result);
}

void platform_i2c_send_start( unsigned id )
{
    I2CStart(id);
}

void platform_i2c_send_stop( unsigned id )
{
    I2CStop(id);
}

int platform_i2c_send_address( unsigned id, u16 address, int direction )
{
    // Low-level returns nack (0=acked); we return ack (1=acked).
    return platform_i2c_send_byte(id, ((address << 1) | direction ));
}

int platform_i2c_send_byte( unsigned id, u8 data )
{
    u32 result = 0;

    // Low-level returns nack (0=acked); we return ack (1=acked).
    if(I2CSendByte(id, data) != I2C_MASTER_BUS_COLLISION)
    {
        while(!I2CTransmissionHasCompleted(id));
        result = I2CByteWasAcknowledged(id);
    }
    return (result);
}

int platform_i2c_recv_byte( unsigned id, int ack )
{
    u32 result = -1;
  
    if(I2CReceiverEnable(id, true) != I2C_RECEIVE_OVERFLOW)
    {
        while(!I2CReceivedDataIsAvailable(id));
        I2CAcknowledgeByte(id, true);
        while(!I2CAcknowledgeHasCompleted(id));
        result = I2CGetByte(id);
    }
    return (result);
}

//!@}
