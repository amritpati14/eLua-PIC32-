//!\addtogroup Main Main File
//!@{
//##############################################################################
//file Main.c
// .
//
//##############################################################################
//##############################################################################
// Include Files
//==============================================================================
// Includes definitions for C99 set width types.
#include <stdint.h>
#include <stdbool.h>

// PIC32 includes
#include <p32xxxx.h>
#include <plib.h>

// Project includes.
#include "platform_conf.h"

#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

//##############################################################################
// Local MACRO Definitions
//==============================================================================
// SYSTEMConfig Flags
#define SYS_CFG_WAIT_STATES     0x00000001 //SYSTEMConfig wait states
#define SYS_CFG_PB_BUS          0x00000002 //SYSTEMConfig pb bus
#define SYS_CFG_PCACHE          0x00000004 //SYSTEMConfig cache
#define SYS_CFG_ALL             0xFFFFFFFF //SYSTEMConfig All

//##############################################################################
// Local Type Definitions
//==============================================================================

//##############################################################################
// Local Function Prototypes
//==============================================================================

//##############################################################################
// Module Variables
//==============================================================================
// St the start location of the custom section in the linker file.
static char *script = (char *)0x9D07f000;

//##############################################################################
// Functional Implentation
//==============================================================================
//==============================================================================
//! "C" main function.
//!
//! The main fucntion provides the Monitors high level functionality.
//!
//! \return Does not return.
//==============================================================================
int cCall(lua_State *L)
{
    int x;
    int y;
    uint8_t numReturnParams = 0;

    y = (int)lua_tonumber(L, -1);
    lua_pop(L, 1);
    x = (int)lua_tonumber(L, -1);
    lua_pop(L, 1);

    // Places the return values on to the stack
    lua_pushinteger(L, x + y);
    numReturnParams++;

    return (numReturnParams);
}

int32_t main(void)
{
    int compileErr;
    int executionErr;
    volatile int value;

    SYSTEMConfig(SYS_FREQ, SYS_CFG_ALL);
    ConfigInterrupts(true);

    platform_init();

    // Initialise the Lua state
    lua_State *L = luaL_newstate();

    // Load the Lua libraries
    luaL_openlibs(L);

    lua_pushcfunction(L, cCall);
    lua_setglobal(L, "cCall");

    // Use strlen(script) when using uncompiled scripts.
    //compileErr = luaL_loadbuffer(L, script, strlen(script), "Script");
    // Use section size from linker file when using byte code scripts.
    compileErr = luaL_loadbuffer(L, script, 0x01000, "Script");
	executionErr = lua_pcall(L, 0, 0, 0);

    if(!compileErr && !executionErr)
    {
        for(;;)
        {
            lua_getglobal(L, "HeapUsage");
            executionErr = lua_pcall(L, 0, 1, 0);
            if(!executionErr)
            {
                value = (int)lua_tonumber(L, -1);
                lua_pop(L, 1);
            }
            
            lua_getglobal(L, "CallToC");
            lua_pushnumber(L, 11);
            lua_pushnumber(L, 22);
            
            executionErr = lua_pcall(L, 2, 0, 0);
            if(!executionErr)
            {
                value = (int)lua_tonumber(L, -1);
            }
        }
    }
    return (0);
}

asm (".section .script_region,\"ax\",@progbits ");
asm (".incbin \"ScriptFile.lc\"");
const char __attribute__((section(".script_region"),space(prog))) eof = '\0';

//!@}
