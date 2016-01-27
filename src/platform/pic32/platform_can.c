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
//! CAN_DEFAULT_BAUD defines the default CAN bus BAUD rate.
#define CAN_DEFAULT_BAUD        (1000000)

#define MAX_DATA_LEN            (8)

#define SID_LEN                 (11)
#define SID_MASK                ((1 << SID_LEN) - 1)
#define EID_LEN                 (18)
#define EID_MASK                ((1 << EID_LEN) - 1)


//##################################################################################################
// Local Type Definitions
//==================================================================================================
typedef struct CanConfig
{
    uint32_t TXChannelId;
    uint32_t RXChannelId;
    uint8_t *RXBuf;
} CanConfig_t;

//##################################################################################################
// Local Function Prototypes
//==================================================================================================
void can_init(unsigned id);

//##################################################################################################
// Module Variables
//==================================================================================================
static uint8_t CAN1MessageFifoArea[1 * 8 * 16];
static uint8_t CAN2MessageFifoArea[1 * 8 * 16];

const static CanConfig_t busConfign[] =
{
    {CAN_CHANNEL0, CAN_CHANNEL1, CAN1MessageFifoArea},
    {CAN_CHANNEL2, CAN_CHANNEL3, CAN2MessageFifoArea},
};

//##################################################################################################
// Functional Implentation
//==================================================================================================
// .
void CANIntHandler(void)
{
    can_init(CAN1);
    can_init(CAN2);
}

void can_init(unsigned id)
{
	CAN_BIT_CONFIG canBitConfig;

    assert(CAN_NUMBER_OF_MODULES > id);

	/* This function will intialize
	 * CAN1 module. */

	/* Step 1: Switch the CAN module
	 * ON and switch it to Configuration
	 * mode. Wait till the switch is
	 * complete */
	CANEnableModule(id,TRUE);

	CANSetOperatingMode(id, CAN_CONFIGURATION);
	while(CANGetOperatingMode(id) != CAN_CONFIGURATION);

	/* Step 2: Configure the CAN Module Clock. The
	 * CAN_BIT_CONFIG data structure is used
	 * for this purpose. The propagation segment,
	 * phase segment 1 and phase segment 2
	 * are configured to have 3TQ. The
     * CANSetSpeed function sets the baud.*/
	canBitConfig.phaseSeg2Tq            = CAN_BIT_3TQ;
	canBitConfig.phaseSeg1Tq            = CAN_BIT_3TQ;
	canBitConfig.propagationSegTq       = CAN_BIT_3TQ;
	canBitConfig.phaseSeg2TimeSelect    = TRUE;
	canBitConfig.sample3Time            = TRUE;
    canBitConfig.syncJumpWidth          = CAN_BIT_2TQ;

    CANSetSpeed(id,&canBitConfig, SYS_FREQ, CAN_DEFAULT_BAUD);

	/* Step 3: Assign the buffer area to the
     * CAN module.
     */
	CANAssignMemoryBuffer(id, busConfign[id].RXBuf, (sizeof(uint8_t) * (1 * 8 * 16)));

	/* Step 4: Configure channel 0 for TX and size of
     * 8 message buffers with RTR disabled and low medium
     * priority. Configure channel 1 for RX and size
     * of 8 message buffers and receive the full message.
     */
    CANConfigureChannelForTx(id, busConfign[id].TXChannelId, 8, CAN_TX_RTR_DISABLED, CAN_LOW_MEDIUM_PRIORITY);
    CANConfigureChannelForRx(id, busConfign[id].RXChannelId, 8, CAN_RX_FULL_RECEIVE);

	/* Step 5: Configure filters and mask. Configure
     * filter 0 to accept SID messages with ID 0x201.
     * Configure filter mask 0 to compare all the ID
     * bits and to filter by the ID type specified in
     * the filter configuration. Messages accepted by
     * filter 0 should be stored in channel 1. */

//    CANConfigureFilter      (id, CAN_FILTER0, 0x201, CAN_SID);
//    CANConfigureFilterMask  (id, CAN_FILTER_MASK0, 0x7FF, CAN_SID, CAN_FILTER_MASK_IDE_TYPE);
    CANConfigureFilter      (id, CAN_FILTER0, 0, CAN_SID);
    CANConfigureFilterMask  (id, CAN_FILTER_MASK0, 0, CAN_SID, CAN_FILTER_MASK_ANY_TYPE);
    CANLinkFilterToChannel  (id, CAN_FILTER0, CAN_FILTER_MASK0, busConfign[id].RXChannelId);
    CANEnableFilter         (id, CAN_FILTER0, TRUE);

    CANConfigureFilter      (id, CAN_FILTER1, 0, CAN_EID);
    CANConfigureFilterMask  (id, CAN_FILTER_MASK1, 0, CAN_EID, CAN_FILTER_MASK_ANY_TYPE);
    CANLinkFilterToChannel  (id, CAN_FILTER1, CAN_FILTER_MASK1, busConfign[id].RXChannelId);
    CANEnableFilter         (id, CAN_FILTER1, TRUE);

//	/* Step 6: Enable interrupt and events. Enable the receive
//     * channel not empty event (channel event) and the receive
//     * channel event (module event).
//     * The interrrupt peripheral library is used to enable
//     * the CAN interrupt to the CPU. */
//    CANEnableChannelEvent(id, busConfign[id].RXChannelId, CAN_RX_CHANNEL_NOT_EMPTY, TRUE);
//    CANEnableModuleEvent (id, CAN_RX_EVENT, TRUE);

//    /* These functions are from interrupt peripheral
//     * library. */
//    INTSetVectorPriority(INT_CAN_1_VECTOR, INT_PRIORITY_LEVEL_4);
//    INTSetVectorSubPriority(INT_CAN_1_VECTOR, INT_SUB_PRIORITY_LEVEL_0);
//    INTEnable(INT_CAN1, INT_ENABLED);

	/* Step 7: Switch the CAN mode
	 * to normal mode. */
	CANSetOperatingMode(id, CAN_NORMAL_OPERATION);
	while(CANGetOperatingMode(id) != CAN_NORMAL_OPERATION);
}

u32 platform_can_setup( unsigned id, u32 clock )
{
	CAN_BIT_CONFIG canBitConfig;

    assert(CAN_NUMBER_OF_MODULES > id);

	CANSetOperatingMode(id, CAN_CONFIGURATION);
	while(CANGetOperatingMode(id) != CAN_CONFIGURATION);

    /* Step 2: Configure the CAN Module Clock. The
	 * CAN_BIT_CONFIG data structure is used
	 * for this purpose. The propagation segment,
	 * phase segment 1 and phase segment 2
	 * are configured to have 3TQ. The
     * CANSetSpeed function sets the baud.*/
	canBitConfig.phaseSeg2Tq            = CAN_BIT_3TQ;
	canBitConfig.phaseSeg1Tq            = CAN_BIT_3TQ;
	canBitConfig.propagationSegTq       = CAN_BIT_3TQ;
	canBitConfig.phaseSeg2TimeSelect    = TRUE;
	canBitConfig.sample3Time            = TRUE;
    canBitConfig.syncJumpWidth          = CAN_BIT_2TQ;

    CANSetSpeed(id,&canBitConfig, SYS_FREQ, clock);

	CANSetOperatingMode(id, CAN_NORMAL_OPERATION);
	while(CANGetOperatingMode(id) != CAN_NORMAL_OPERATION);

    return (clock);
}

int platform_can_send( unsigned id, u32 canid, u8 idtype, u8 len, const u8 *data )
{
    CANTxMessageBuffer * message;

    assert(len || data);
    assert(CAN_NUMBER_OF_MODULES > id);
    
    /* Get a pointer to the next buffer in the channel
     * check if the returned value is null. */
	message = CANGetTxMessageBuffer(id, busConfign[id].TXChannelId);

    if(message != NULL)
    {
        /* Form a Extended ID CAN message.
         * Start by clearing the buffer. */

        message->messageWord[0] = 0;
        message->messageWord[1] = 0;
        message->messageWord[2] = 0;
        message->messageWord[3] = 0;

        message->msgSID.SID	= (SID_MASK & canid);
        message->msgEID.EID	= EID_MASK & (canid >> (SID_LEN - 1));
        message->msgEID.IDE	= (ELUA_CAN_ID_EXT == idtype)? 1: 0;	/* IDE = 1 means Extended ID message.	*/
        message->msgEID.RTR	= 0;			/* Not an RTR message.              	*/

        len = (MAX_DATA_LEN > len)? len: MAX_DATA_LEN;
        message->msgEID.DLC	= len;			/* Send len number bytes of data.				*/
        memmove(&message->data[0], data, len);

        /* This function lets the CAN module
         * know that the message processing is done
         * and message is ready to be processed. */
        CANUpdateChannel(id, busConfign[id].TXChannelId);

        /* Direct the CAN module to flush the
         * TX channel. This will send any pending
         * message in the TX channel. */
        CANFlushTxChannel(id, busConfign[id].TXChannelId);
    }
    return PLATFORM_OK;
}

int platform_can_recv( unsigned id, u32 *canid, u8 *idtype, u8 *len, u8 *data )
{
    CANRxMessageBuffer *message;
    bool gotMsg;
    uint8_t rcvdLen;

    assert(canid);
    assert(idtype);
    assert(len);
    assert(data);
    assert(CAN_NUMBER_OF_MODULES > id);

    gotMsg = false;
    message = CANGetRxMessage(id, busConfign[id].RXChannelId);
    if(NULL != message)
    {
        *canid = (message->msgEID.EID << (SID_LEN - 1));
        *canid |= (SID_MASK & message->msgSID.SID);
        
        *idtype = (message->msgEID.IDE == 1)? ELUA_CAN_ID_EXT: ELUA_CAN_ID_STD;
        
        rcvdLen = message->msgEID.DLC;
        *len = (*len > rcvdLen)? rcvdLen: *len;
        memmove(data, &message->data[0], *len);

        gotMsg = true;
        CANUpdateChannel(id, busConfign[id].RXChannelId);
    }
    return (gotMsg);
}
//!@}
