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
// GPIO Ports.
//! PortIDs_t contains an ID for each of the GPIO ports supported on the
//! processor.
typedef enum PortIDs
{
    PortA = 0, PortB = 1, PortC = 2, PortD = 3, PortE = 4, PortF = 5, PortG = 6,
} PortIDs_t;

#define GPIO_PIN0   (0x0001)
#define GPIO_PIN1   (0x0002)
#define GPIO_PIN2   (0x0004)
#define GPIO_PIN3   (0x0008)
#define GPIO_PIN4   (0x0010)
#define GPIO_PIN5   (0x0020)
#define GPIO_PIN6   (0x0040)
#define GPIO_PIN7   (0x0080)
#define GPIO_PIN8   (0x0100)
#define GPIO_PIN9   (0x0200)
#define GPIO_PIN10  (0x0400)
#define GPIO_PIN11  (0x0800)
#define GPIO_PIN12  (0x1000)
#define GPIO_PIN13  (0x2000)
#define GPIO_PIN14  (0x4000)
#define GPIO_PIN15  (0x8000)

#define PORT_PINS   (0xffff)

//! GPIO_Config_t are options each GPIO can be configured to. I.e. digital
//! input, digital output and open drain outputs. Note pull ups are not given as
//! an option. Pull ups are only supported on the change notification pins, and
//! the pull up selection does not map to a port and pin number combination.
typedef enum GPIO_Config
{
    INPUT, OUTPUT, OUTPUT_OPENDRAIN,
} GPIO_Config_t;

//! Port_Registers_t is a mapping of corresponding PORT registers.
typedef struct Port_Registers
{
    //! TRIS registers configure the data direction flow through port I/O
    //! pin(s). The TRIS register bits determine whether a PORT I/O pin is an
    //! input or an output.
    //! TRIS bit set to 1 indicates an input, TRIS bit set to 0 indicates an
    //! output.
    volatile uint32_t TRIS;
    //! TRIS_CLR clears corresponding bits in the TRIS register.
    volatile uint32_t TRIS_CLR;
    //! TRIS_SET sets corresponding bits in the TRIS register.
    volatile uint32_t TRIS_SET;
    //! TRIS_INV inverts corresponding bits in the TRIS register.
    volatile uint32_t TRIS_INV;

    // PORT registers allow I/O pins to be addressed (read).
    volatile uint32_t PORT;
    //! PORT_CLR clears corresponding bits in the PORT register.
    volatile uint32_t PORT_CLR;
    //! PORT_SET sets corresponding bits in the PORT register.
    volatile uint32_t PORT_SET;
    //! PORT_INV inverts corresponding bits in the PORT register.
    volatile uint32_t PORT_INV;

    // LAT registers (PORT data latch) hold data written to port I/O pin(s).
    volatile uint32_t LAT;
    //! LAT_CLR clears corresponding bits in the LAT register.
    volatile uint32_t LAT_CLR;
    //! LAT_SET sets corresponding bits in the LAT register.
    volatile uint32_t LAT_SET;
    //! LAT_INV inverts corresponding bits in the LAT register.
    volatile uint32_t LAT_INV;

    //! ODC configures an output to be either a normal digital output or an
    //! open-drain output. Each I/O is capable of being configured to either
    //! output modes.
    volatile uint32_t ODC;
    //! ODC_CLR clears corresponding bits in the ODC register.
    volatile uint32_t ODC_CLR;
    //! ODC_SET sets corresponding bits in the ODC register.
    volatile uint32_t ODC_SET;
    //! ODC_INV inverts corresponding bits in the ODC register.
    volatile uint32_t ODC_INV;
} Port_Registers_t;

//##################################################################################################
// Local Function Prototypes
//==================================================================================================

//##################################################################################################
// Module Variables
//==================================================================================================
static Port_Registers_t * const Port_BaseAddrs[] =
{
    (Port_Registers_t * const)_PORTA_BASE_ADDRESS,   // PortA
    (Port_Registers_t * const)_PORTB_BASE_ADDRESS,   // PortB
    (Port_Registers_t * const)_PORTC_BASE_ADDRESS,   // PortC
    (Port_Registers_t * const)_PORTD_BASE_ADDRESS,   // PortD
    (Port_Registers_t * const)_PORTE_BASE_ADDRESS,   // PortE
    (Port_Registers_t * const)_PORTF_BASE_ADDRESS,   // PortF
    (Port_Registers_t * const)_PORTG_BASE_ADDRESS,   // PortG
};

#define NUM_PORTS (sizeof(Port_BaseAddrs) / sizeof(Port_Registers_t * const))

//##################################################################################################
// Functional Implentation
//==================================================================================================
// .
// PSPConfigPins configures selected pins (pins) on a given port (port) to be
// either inputs or outputs.
// For more descriptive comments, see header file.
void PSPConfigPins(uint8_t port, uint16_t pins, GPIO_Config_t config)
{
    Port_Registers_t * portRegs;

    // Validate the requested port exists, if not we ignore.
    if(NUM_PORTS > port)
    {
        // Configure the data direction of the requested pin.
        portRegs = Port_BaseAddrs[port];
        if(INPUT == config)
        {
            // Driving pins low before setting as inputs for workaround to
            // ERRATA. If pins are high when set to inputs this can delay the
            // pin switching to be a input.
            portRegs->LAT_CLR = pins;
            portRegs->TRIS_SET = pins;
        }
        else
        {
            portRegs->TRIS_CLR = pins;
            // Configure the output drive configuration for the requested
            // output.
            if(OUTPUT_OPENDRAIN == config)
            {
                portRegs->ODC_SET = pins;
            }
            else
            {
                portRegs->ODC_CLR = pins;
            }
        }
    }
}

// PSPSetPins sets the requested pins on a port to a given level.
// For more descriptive comments, see header file.
void PSPSetPins(uint8_t port, uint16_t pins, bool level)
{
    Port_Registers_t * portRegs;

    // Validate the requested port exists, if not we ignore.
    if(NUM_PORTS > port)
    {
        portRegs = Port_BaseAddrs[port];
        // Set the requested pins high or low depending on the value of "level".
        if(level)
        {
            portRegs->LAT_SET = pins;
        }
        else
        {
            portRegs->LAT_CLR = pins;
        }
    }
}

void PSPWritePort(uint8_t port, uint16_t value)
{
    Port_Registers_t * portRegs;

    // Validate the requested port exists, if not we ignore.
    if(NUM_PORTS > port)
    {
        portRegs = Port_BaseAddrs[port];
        portRegs->LAT = value;
    }
}

// PSPReadPort returns the input values of a given port.
// For more descriptive comments, see header file.
uint16_t PSPReadPort(uint8_t port)
{
    uint16_t portVal = 0;

    // Validate the requested port exists, if not ignore.
    if(NUM_PORTS > port)
    {
        // Get the level of the port pins.
        portVal = Port_BaseAddrs[port]->PORT;
    }
    return (portVal);
}

pio_type platform_pio_op( unsigned port, pio_type pinmask, int op )
{
  pio_type retval = 1;

  switch( op )
  {
    case PLATFORM_IO_PORT_SET_VALUE:
        PSPWritePort(port, pinmask);
      break;

    case PLATFORM_IO_PIN_SET:
        PSPSetPins(port, pinmask, true);
      break;

    case PLATFORM_IO_PIN_CLEAR:
        PSPSetPins(port, pinmask, false);
      break;

    case PLATFORM_IO_PORT_DIR_INPUT:
        PSPConfigPins(port, pinmask, INPUT);
      break;

    case PLATFORM_IO_PIN_DIR_INPUT:
    case PLATFORM_IO_PIN_NOPULL:
        PSPConfigPins(port, pinmask, INPUT);
      break;

    case PLATFORM_IO_PORT_DIR_OUTPUT:
        PSPConfigPins(port, pinmask, OUTPUT);
      break;

    case PLATFORM_IO_PIN_DIR_OUTPUT:
        PSPConfigPins(port, pinmask, OUTPUT);
      break;

    case PLATFORM_IO_PORT_GET_VALUE:
      retval = PSPReadPort(port);
      break;

    case PLATFORM_IO_PIN_GET:
      retval = (PSPReadPort(port) & pinmask) ? 1 : 0;
      break;

    case PLATFORM_IO_PIN_PULLUP:
      // Pull ups pins map to the Change Notification pins and don't map nicely to the port pins.
      // Also not every GPIO has a pull up. ToDo: If don't fell lazy implement mapping from port
      // pins into the CN pins to implement pull ups.
      retval = 0;
      break;

    default:
      retval = 0;
      break;
  }
  return retval;
}


//!@}
