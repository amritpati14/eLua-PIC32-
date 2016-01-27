This folder contains an eLua port for the PIC32 processor. The original portions of the code are supplied under their original license agreements. The license information for the original code can be found at http://www.eluaproject.net/overview/license. For all the changes and additions made, where they do not fall under the original license agreement, are supplied under the MIT license (which can be found here http://opensource.org/licenses/mit-license.html).
The changes and additions made to the original eLua code refers to, but is not limited to, the PIC32 specific code and the addition of a Visual Studios project for generating a Win32 executable of the eLua compiler.

The changes made for the PIC32 port has not been fully tested!  Rudimentary testing was performed when the changes were being made. But no formal comprehensive testing has been performed.

The original code this port was made from has been included in with the source. The original code can be found in the zip file "elua-master.zip".

A Visual Studios 2013 project has been included in with the source. The Visual Studios 2013 project can be used to compile a win32 version of the eLua compiler. The eLua compiler can be used to compile eLua scripts into byte code which can then be loaded into the PIC32. The command line used to compile the script "ScriptFile.lua" into byte code "ScriptFile.lc" is as follows:-
eLuaCompiler -o ScriptFile.lc ScriptFile.lua


Three MPLAB.X projects (eLuaLib.X, eLuaTerminal.X and eLuaStandAlone.X) have been included in with the source.

eLuaLib.X: is a library which can be used to supply all of the supported eLua features. This library is used by the eLuaTerminal.X and eLuaStandAlone.X projects to provide the eLua functionality.

eLuaTerminal.X: is a standalone project that provides the eLua functionality over a serial terminal. Communication/control of the eLua terminal is provided over a serial port (UART2 on the PIC32 by default).

eLuaStandAlone.X: is a small demo project that illustrates how the eLua functionality and scripts can be embedded into a PIC32 project. The eLua scripts are imported into the firmware image at build time. To select which eLua script is loaded into the firmware, the correct script must be listed with the ".incbin" command (asm (".incbin \"ScriptFile.lc\"");). The script that is loaded can be either a normal text script or the compiled byte code. Using byte code has the benefit of not having to be compiled on the PIC32 and also not using additional RAM to store the byte code in RAM. When using straight text scripts, the luaL_loadbuffer function must be passed the length of the string that makes up the script. When using byte code, the luaL_loadbuffer function can be passed the size of memory that has been reserved to hold the scripts in the firmware image. To tune the location and size of the memory used to store the script, changes must be made to the procdefs.ld linker file. The custom section "script_mem" controls the storage of the script:-
MEMORY
{
/*
  kseg0_program_mem    (rx)  : ORIGIN = 0x9D000000, LENGTH = 0x80000
*/
  kseg0_program_mem    (rx)  : ORIGIN = 0x9D000000, LENGTH = 0x7f000
  script_mem           (rx)   : ORIGIN = 0x9D07f000, LENGTH = 0x01000
...
If the location of the script changes then the pointer to the script must be updated:-
static char *script = (char *)0x9D07f000;
The project illustrates how to call into eLua scripts from c code, and also how to call into c code from eLua scripts.

I do not believe the ADC code is working how the original developer intended. I ported the code from a different processors port (can't remember which one). I believe the behavior on my port matches the behavior on the original port. The ADC code will perform and report conversions, however I don't believe the code to perform multiple conversions is working properly. Since the base functionality is present, I do not intend to debug this issue.

I hope this is of use to other people!
