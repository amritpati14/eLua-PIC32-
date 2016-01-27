// Module for interfacing with platform data

//#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
#include "platform.h"
#include "auxmods.h"
#include "lrotable.h"

#define MACRO_NAME( x ) MACRO_AGAIN( x )
#define MACRO_AGAIN( x ) #x

// Lua: platform = platform()
static int pd_platform( lua_State* L )
{
#ifdef __PIC32MX
  lua_pushstring( L, MACRO_NAME( ELUA_PIC32 ) );
#else
  lua_pushstring( L, MACRO_NAME( ELUA_PLATFORM ) );
#endif
  return 1;
}

// Lua: cpuname = cpu()
static int pd_cpu( lua_State* L )
{
#ifdef __PIC32MX
  lua_pushstring( L, "PIC32" );
#else
  lua_pushstring( L, MACRO_NAME( ELUA_CPU ) ); 
#endif
  return 1;
}

// Lua: boardname = board()
static int pd_board( lua_State* L )
{
#ifdef __PIC32MX
  lua_pushstring( L, "PIC32 Ethernet Starter Kit" );
#else
  lua_pushstring( L, MACRO_NAME( ELUA_BOARD ) );
#endif
  return 1;
}

// Module function map
#define MIN_OPT_LEVEL 2
#include "lrodefs.h"
const LUA_REG_TYPE pd_map[] = 
{
  { LSTRKEY( "platform" ), LFUNCVAL( pd_platform ) }, 
  { LSTRKEY( "cpu" ), LFUNCVAL( pd_cpu ) },
  { LSTRKEY( "board" ), LFUNCVAL( pd_board ) },
  { LNILKEY, LNILVAL }
};

LUALIB_API int luaopen_pd( lua_State* L )
{
  LREGISTER( L, AUXLIB_PD, pd_map );
}
