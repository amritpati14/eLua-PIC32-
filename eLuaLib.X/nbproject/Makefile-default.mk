#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=a
DEBUGGABLE_SUFFIX=
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/eLuaLib.X.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=a
DEBUGGABLE_SUFFIX=
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/eLuaLib.X.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/683842823/platform.o ${OBJECTDIR}/_ext/683842823/platform_pio.o ${OBJECTDIR}/_ext/683842823/platform_timer.o ${OBJECTDIR}/_ext/683842823/platform_adc.o ${OBJECTDIR}/_ext/683842823/platform_can.o ${OBJECTDIR}/_ext/683842823/platform_i2c.o ${OBJECTDIR}/_ext/683842823/platform_pwm.o ${OBJECTDIR}/_ext/683842823/platform_spi.o ${OBJECTDIR}/_ext/683842823/platform_uart.o ${OBJECTDIR}/_ext/946520205/pio.o ${OBJECTDIR}/_ext/1360937237/common.o ${OBJECTDIR}/_ext/1360937237/common_tmr.o ${OBJECTDIR}/_ext/1360937237/common_uart.o ${OBJECTDIR}/_ext/1360937237/elua_int.o ${OBJECTDIR}/_ext/1360937237/linenoise.o ${OBJECTDIR}/_ext/946520205/bit.o ${OBJECTDIR}/_ext/946520205/lpack.o ${OBJECTDIR}/_ext/946520205/cpu.o ${OBJECTDIR}/_ext/946520205/pd.o ${OBJECTDIR}/_ext/946520205/tmr.o ${OBJECTDIR}/_ext/946520205/uart.o ${OBJECTDIR}/_ext/946520205/spi.o ${OBJECTDIR}/_ext/946520205/i2c.o ${OBJECTDIR}/_ext/946520205/adc.o ${OBJECTDIR}/_ext/1360937237/elua_adc.o ${OBJECTDIR}/_ext/946520205/pwm.o ${OBJECTDIR}/_ext/946520205/can.o ${OBJECTDIR}/_ext/1360937237/buf.o ${OBJECTDIR}/_ext/659861502/lapi.o ${OBJECTDIR}/_ext/659861502/lauxlib.o ${OBJECTDIR}/_ext/659861502/lbaselib.o ${OBJECTDIR}/_ext/659861502/lcode.o ${OBJECTDIR}/_ext/659861502/ldblib.o ${OBJECTDIR}/_ext/659861502/ldebug.o ${OBJECTDIR}/_ext/659861502/ldo.o ${OBJECTDIR}/_ext/659861502/ldump.o ${OBJECTDIR}/_ext/659861502/legc.o ${OBJECTDIR}/_ext/659861502/lfunc.o ${OBJECTDIR}/_ext/659861502/lgc.o ${OBJECTDIR}/_ext/659861502/linit.o ${OBJECTDIR}/_ext/659861502/liolib.o ${OBJECTDIR}/_ext/659861502/llex.o ${OBJECTDIR}/_ext/659861502/lmathlib.o ${OBJECTDIR}/_ext/659861502/lmem.o ${OBJECTDIR}/_ext/659861502/loadlib.o ${OBJECTDIR}/_ext/659861502/lobject.o ${OBJECTDIR}/_ext/659861502/lopcodes.o ${OBJECTDIR}/_ext/659861502/loslib.o ${OBJECTDIR}/_ext/659861502/lparser.o ${OBJECTDIR}/_ext/659861502/lrotable.o ${OBJECTDIR}/_ext/659861502/lstate.o ${OBJECTDIR}/_ext/659861502/lstring.o ${OBJECTDIR}/_ext/659861502/lstrlib.o ${OBJECTDIR}/_ext/659861502/ltable.o ${OBJECTDIR}/_ext/659861502/ltablib.o ${OBJECTDIR}/_ext/659861502/ltm.o ${OBJECTDIR}/_ext/659861502/lundump.o ${OBJECTDIR}/_ext/659861502/lvm.o ${OBJECTDIR}/_ext/659861502/lzio.o ${OBJECTDIR}/_ext/659861502/print.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/683842823/platform.o.d ${OBJECTDIR}/_ext/683842823/platform_pio.o.d ${OBJECTDIR}/_ext/683842823/platform_timer.o.d ${OBJECTDIR}/_ext/683842823/platform_adc.o.d ${OBJECTDIR}/_ext/683842823/platform_can.o.d ${OBJECTDIR}/_ext/683842823/platform_i2c.o.d ${OBJECTDIR}/_ext/683842823/platform_pwm.o.d ${OBJECTDIR}/_ext/683842823/platform_spi.o.d ${OBJECTDIR}/_ext/683842823/platform_uart.o.d ${OBJECTDIR}/_ext/946520205/pio.o.d ${OBJECTDIR}/_ext/1360937237/common.o.d ${OBJECTDIR}/_ext/1360937237/common_tmr.o.d ${OBJECTDIR}/_ext/1360937237/common_uart.o.d ${OBJECTDIR}/_ext/1360937237/elua_int.o.d ${OBJECTDIR}/_ext/1360937237/linenoise.o.d ${OBJECTDIR}/_ext/946520205/bit.o.d ${OBJECTDIR}/_ext/946520205/lpack.o.d ${OBJECTDIR}/_ext/946520205/cpu.o.d ${OBJECTDIR}/_ext/946520205/pd.o.d ${OBJECTDIR}/_ext/946520205/tmr.o.d ${OBJECTDIR}/_ext/946520205/uart.o.d ${OBJECTDIR}/_ext/946520205/spi.o.d ${OBJECTDIR}/_ext/946520205/i2c.o.d ${OBJECTDIR}/_ext/946520205/adc.o.d ${OBJECTDIR}/_ext/1360937237/elua_adc.o.d ${OBJECTDIR}/_ext/946520205/pwm.o.d ${OBJECTDIR}/_ext/946520205/can.o.d ${OBJECTDIR}/_ext/1360937237/buf.o.d ${OBJECTDIR}/_ext/659861502/lapi.o.d ${OBJECTDIR}/_ext/659861502/lauxlib.o.d ${OBJECTDIR}/_ext/659861502/lbaselib.o.d ${OBJECTDIR}/_ext/659861502/lcode.o.d ${OBJECTDIR}/_ext/659861502/ldblib.o.d ${OBJECTDIR}/_ext/659861502/ldebug.o.d ${OBJECTDIR}/_ext/659861502/ldo.o.d ${OBJECTDIR}/_ext/659861502/ldump.o.d ${OBJECTDIR}/_ext/659861502/legc.o.d ${OBJECTDIR}/_ext/659861502/lfunc.o.d ${OBJECTDIR}/_ext/659861502/lgc.o.d ${OBJECTDIR}/_ext/659861502/linit.o.d ${OBJECTDIR}/_ext/659861502/liolib.o.d ${OBJECTDIR}/_ext/659861502/llex.o.d ${OBJECTDIR}/_ext/659861502/lmathlib.o.d ${OBJECTDIR}/_ext/659861502/lmem.o.d ${OBJECTDIR}/_ext/659861502/loadlib.o.d ${OBJECTDIR}/_ext/659861502/lobject.o.d ${OBJECTDIR}/_ext/659861502/lopcodes.o.d ${OBJECTDIR}/_ext/659861502/loslib.o.d ${OBJECTDIR}/_ext/659861502/lparser.o.d ${OBJECTDIR}/_ext/659861502/lrotable.o.d ${OBJECTDIR}/_ext/659861502/lstate.o.d ${OBJECTDIR}/_ext/659861502/lstring.o.d ${OBJECTDIR}/_ext/659861502/lstrlib.o.d ${OBJECTDIR}/_ext/659861502/ltable.o.d ${OBJECTDIR}/_ext/659861502/ltablib.o.d ${OBJECTDIR}/_ext/659861502/ltm.o.d ${OBJECTDIR}/_ext/659861502/lundump.o.d ${OBJECTDIR}/_ext/659861502/lvm.o.d ${OBJECTDIR}/_ext/659861502/lzio.o.d ${OBJECTDIR}/_ext/659861502/print.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/683842823/platform.o ${OBJECTDIR}/_ext/683842823/platform_pio.o ${OBJECTDIR}/_ext/683842823/platform_timer.o ${OBJECTDIR}/_ext/683842823/platform_adc.o ${OBJECTDIR}/_ext/683842823/platform_can.o ${OBJECTDIR}/_ext/683842823/platform_i2c.o ${OBJECTDIR}/_ext/683842823/platform_pwm.o ${OBJECTDIR}/_ext/683842823/platform_spi.o ${OBJECTDIR}/_ext/683842823/platform_uart.o ${OBJECTDIR}/_ext/946520205/pio.o ${OBJECTDIR}/_ext/1360937237/common.o ${OBJECTDIR}/_ext/1360937237/common_tmr.o ${OBJECTDIR}/_ext/1360937237/common_uart.o ${OBJECTDIR}/_ext/1360937237/elua_int.o ${OBJECTDIR}/_ext/1360937237/linenoise.o ${OBJECTDIR}/_ext/946520205/bit.o ${OBJECTDIR}/_ext/946520205/lpack.o ${OBJECTDIR}/_ext/946520205/cpu.o ${OBJECTDIR}/_ext/946520205/pd.o ${OBJECTDIR}/_ext/946520205/tmr.o ${OBJECTDIR}/_ext/946520205/uart.o ${OBJECTDIR}/_ext/946520205/spi.o ${OBJECTDIR}/_ext/946520205/i2c.o ${OBJECTDIR}/_ext/946520205/adc.o ${OBJECTDIR}/_ext/1360937237/elua_adc.o ${OBJECTDIR}/_ext/946520205/pwm.o ${OBJECTDIR}/_ext/946520205/can.o ${OBJECTDIR}/_ext/1360937237/buf.o ${OBJECTDIR}/_ext/659861502/lapi.o ${OBJECTDIR}/_ext/659861502/lauxlib.o ${OBJECTDIR}/_ext/659861502/lbaselib.o ${OBJECTDIR}/_ext/659861502/lcode.o ${OBJECTDIR}/_ext/659861502/ldblib.o ${OBJECTDIR}/_ext/659861502/ldebug.o ${OBJECTDIR}/_ext/659861502/ldo.o ${OBJECTDIR}/_ext/659861502/ldump.o ${OBJECTDIR}/_ext/659861502/legc.o ${OBJECTDIR}/_ext/659861502/lfunc.o ${OBJECTDIR}/_ext/659861502/lgc.o ${OBJECTDIR}/_ext/659861502/linit.o ${OBJECTDIR}/_ext/659861502/liolib.o ${OBJECTDIR}/_ext/659861502/llex.o ${OBJECTDIR}/_ext/659861502/lmathlib.o ${OBJECTDIR}/_ext/659861502/lmem.o ${OBJECTDIR}/_ext/659861502/loadlib.o ${OBJECTDIR}/_ext/659861502/lobject.o ${OBJECTDIR}/_ext/659861502/lopcodes.o ${OBJECTDIR}/_ext/659861502/loslib.o ${OBJECTDIR}/_ext/659861502/lparser.o ${OBJECTDIR}/_ext/659861502/lrotable.o ${OBJECTDIR}/_ext/659861502/lstate.o ${OBJECTDIR}/_ext/659861502/lstring.o ${OBJECTDIR}/_ext/659861502/lstrlib.o ${OBJECTDIR}/_ext/659861502/ltable.o ${OBJECTDIR}/_ext/659861502/ltablib.o ${OBJECTDIR}/_ext/659861502/ltm.o ${OBJECTDIR}/_ext/659861502/lundump.o ${OBJECTDIR}/_ext/659861502/lvm.o ${OBJECTDIR}/_ext/659861502/lzio.o ${OBJECTDIR}/_ext/659861502/print.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/eLuaLib.X.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/683842823/platform.o: ../src/platform/pic32/platform.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/platform.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/platform.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/platform.o.d" -o ${OBJECTDIR}/_ext/683842823/platform.o ../src/platform/pic32/platform.c   -legacy-libc
	
${OBJECTDIR}/_ext/683842823/platform_pio.o: ../src/platform/pic32/platform_pio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/platform_pio.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/platform_pio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/platform_pio.o.d" -o ${OBJECTDIR}/_ext/683842823/platform_pio.o ../src/platform/pic32/platform_pio.c   -legacy-libc
	
${OBJECTDIR}/_ext/683842823/platform_timer.o: ../src/platform/pic32/platform_timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/platform_timer.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/platform_timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/platform_timer.o.d" -o ${OBJECTDIR}/_ext/683842823/platform_timer.o ../src/platform/pic32/platform_timer.c   -legacy-libc
	
${OBJECTDIR}/_ext/683842823/platform_adc.o: ../src/platform/pic32/platform_adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/platform_adc.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/platform_adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/platform_adc.o.d" -o ${OBJECTDIR}/_ext/683842823/platform_adc.o ../src/platform/pic32/platform_adc.c   -legacy-libc
	
${OBJECTDIR}/_ext/683842823/platform_can.o: ../src/platform/pic32/platform_can.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/platform_can.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/platform_can.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/platform_can.o.d" -o ${OBJECTDIR}/_ext/683842823/platform_can.o ../src/platform/pic32/platform_can.c   -legacy-libc
	
${OBJECTDIR}/_ext/683842823/platform_i2c.o: ../src/platform/pic32/platform_i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/platform_i2c.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/platform_i2c.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/platform_i2c.o.d" -o ${OBJECTDIR}/_ext/683842823/platform_i2c.o ../src/platform/pic32/platform_i2c.c   -legacy-libc
	
${OBJECTDIR}/_ext/683842823/platform_pwm.o: ../src/platform/pic32/platform_pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/platform_pwm.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/platform_pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/platform_pwm.o.d" -o ${OBJECTDIR}/_ext/683842823/platform_pwm.o ../src/platform/pic32/platform_pwm.c   -legacy-libc
	
${OBJECTDIR}/_ext/683842823/platform_spi.o: ../src/platform/pic32/platform_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/platform_spi.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/platform_spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/platform_spi.o.d" -o ${OBJECTDIR}/_ext/683842823/platform_spi.o ../src/platform/pic32/platform_spi.c   -legacy-libc
	
${OBJECTDIR}/_ext/683842823/platform_uart.o: ../src/platform/pic32/platform_uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/platform_uart.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/platform_uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/platform_uart.o.d" -o ${OBJECTDIR}/_ext/683842823/platform_uart.o ../src/platform/pic32/platform_uart.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/pio.o: ../src/modules/pio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/pio.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/pio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/pio.o.d" -o ${OBJECTDIR}/_ext/946520205/pio.o ../src/modules/pio.c   -legacy-libc
	
${OBJECTDIR}/_ext/1360937237/common.o: ../src/common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	@${RM} ${OBJECTDIR}/_ext/1360937237/common.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/common.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/common.o.d" -o ${OBJECTDIR}/_ext/1360937237/common.o ../src/common.c   -legacy-libc
	
${OBJECTDIR}/_ext/1360937237/common_tmr.o: ../src/common_tmr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	@${RM} ${OBJECTDIR}/_ext/1360937237/common_tmr.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/common_tmr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/common_tmr.o.d" -o ${OBJECTDIR}/_ext/1360937237/common_tmr.o ../src/common_tmr.c   -legacy-libc
	
${OBJECTDIR}/_ext/1360937237/common_uart.o: ../src/common_uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	@${RM} ${OBJECTDIR}/_ext/1360937237/common_uart.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/common_uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/common_uart.o.d" -o ${OBJECTDIR}/_ext/1360937237/common_uart.o ../src/common_uart.c   -legacy-libc
	
${OBJECTDIR}/_ext/1360937237/elua_int.o: ../src/elua_int.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	@${RM} ${OBJECTDIR}/_ext/1360937237/elua_int.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/elua_int.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/elua_int.o.d" -o ${OBJECTDIR}/_ext/1360937237/elua_int.o ../src/elua_int.c   -legacy-libc
	
${OBJECTDIR}/_ext/1360937237/linenoise.o: ../src/linenoise.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	@${RM} ${OBJECTDIR}/_ext/1360937237/linenoise.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/linenoise.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/linenoise.o.d" -o ${OBJECTDIR}/_ext/1360937237/linenoise.o ../src/linenoise.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/bit.o: ../src/modules/bit.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/bit.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/bit.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/bit.o.d" -o ${OBJECTDIR}/_ext/946520205/bit.o ../src/modules/bit.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/lpack.o: ../src/modules/lpack.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/lpack.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/lpack.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/lpack.o.d" -o ${OBJECTDIR}/_ext/946520205/lpack.o ../src/modules/lpack.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/cpu.o: ../src/modules/cpu.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/cpu.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/cpu.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/cpu.o.d" -o ${OBJECTDIR}/_ext/946520205/cpu.o ../src/modules/cpu.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/pd.o: ../src/modules/pd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/pd.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/pd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/pd.o.d" -o ${OBJECTDIR}/_ext/946520205/pd.o ../src/modules/pd.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/tmr.o: ../src/modules/tmr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/tmr.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/tmr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/tmr.o.d" -o ${OBJECTDIR}/_ext/946520205/tmr.o ../src/modules/tmr.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/uart.o: ../src/modules/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/uart.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/uart.o.d" -o ${OBJECTDIR}/_ext/946520205/uart.o ../src/modules/uart.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/spi.o: ../src/modules/spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/spi.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/spi.o.d" -o ${OBJECTDIR}/_ext/946520205/spi.o ../src/modules/spi.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/i2c.o: ../src/modules/i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/i2c.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/i2c.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/i2c.o.d" -o ${OBJECTDIR}/_ext/946520205/i2c.o ../src/modules/i2c.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/adc.o: ../src/modules/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/adc.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/adc.o.d" -o ${OBJECTDIR}/_ext/946520205/adc.o ../src/modules/adc.c   -legacy-libc
	
${OBJECTDIR}/_ext/1360937237/elua_adc.o: ../src/elua_adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	@${RM} ${OBJECTDIR}/_ext/1360937237/elua_adc.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/elua_adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/elua_adc.o.d" -o ${OBJECTDIR}/_ext/1360937237/elua_adc.o ../src/elua_adc.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/pwm.o: ../src/modules/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/pwm.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/pwm.o.d" -o ${OBJECTDIR}/_ext/946520205/pwm.o ../src/modules/pwm.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/can.o: ../src/modules/can.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/can.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/can.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/can.o.d" -o ${OBJECTDIR}/_ext/946520205/can.o ../src/modules/can.c   -legacy-libc
	
${OBJECTDIR}/_ext/1360937237/buf.o: ../src/buf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	@${RM} ${OBJECTDIR}/_ext/1360937237/buf.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/buf.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/buf.o.d" -o ${OBJECTDIR}/_ext/1360937237/buf.o ../src/buf.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lapi.o: ../src/lua/lapi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lapi.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lapi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lapi.o.d" -o ${OBJECTDIR}/_ext/659861502/lapi.o ../src/lua/lapi.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lauxlib.o: ../src/lua/lauxlib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lauxlib.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lauxlib.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lauxlib.o.d" -o ${OBJECTDIR}/_ext/659861502/lauxlib.o ../src/lua/lauxlib.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lbaselib.o: ../src/lua/lbaselib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lbaselib.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lbaselib.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lbaselib.o.d" -o ${OBJECTDIR}/_ext/659861502/lbaselib.o ../src/lua/lbaselib.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lcode.o: ../src/lua/lcode.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lcode.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lcode.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lcode.o.d" -o ${OBJECTDIR}/_ext/659861502/lcode.o ../src/lua/lcode.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/ldblib.o: ../src/lua/ldblib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/ldblib.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/ldblib.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/ldblib.o.d" -o ${OBJECTDIR}/_ext/659861502/ldblib.o ../src/lua/ldblib.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/ldebug.o: ../src/lua/ldebug.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/ldebug.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/ldebug.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/ldebug.o.d" -o ${OBJECTDIR}/_ext/659861502/ldebug.o ../src/lua/ldebug.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/ldo.o: ../src/lua/ldo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/ldo.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/ldo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/ldo.o.d" -o ${OBJECTDIR}/_ext/659861502/ldo.o ../src/lua/ldo.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/ldump.o: ../src/lua/ldump.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/ldump.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/ldump.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/ldump.o.d" -o ${OBJECTDIR}/_ext/659861502/ldump.o ../src/lua/ldump.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/legc.o: ../src/lua/legc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/legc.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/legc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/legc.o.d" -o ${OBJECTDIR}/_ext/659861502/legc.o ../src/lua/legc.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lfunc.o: ../src/lua/lfunc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lfunc.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lfunc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lfunc.o.d" -o ${OBJECTDIR}/_ext/659861502/lfunc.o ../src/lua/lfunc.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lgc.o: ../src/lua/lgc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lgc.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lgc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lgc.o.d" -o ${OBJECTDIR}/_ext/659861502/lgc.o ../src/lua/lgc.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/linit.o: ../src/lua/linit.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/linit.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/linit.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/linit.o.d" -o ${OBJECTDIR}/_ext/659861502/linit.o ../src/lua/linit.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/liolib.o: ../src/lua/liolib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/liolib.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/liolib.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/liolib.o.d" -o ${OBJECTDIR}/_ext/659861502/liolib.o ../src/lua/liolib.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/llex.o: ../src/lua/llex.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/llex.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/llex.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/llex.o.d" -o ${OBJECTDIR}/_ext/659861502/llex.o ../src/lua/llex.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lmathlib.o: ../src/lua/lmathlib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lmathlib.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lmathlib.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lmathlib.o.d" -o ${OBJECTDIR}/_ext/659861502/lmathlib.o ../src/lua/lmathlib.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lmem.o: ../src/lua/lmem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lmem.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lmem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lmem.o.d" -o ${OBJECTDIR}/_ext/659861502/lmem.o ../src/lua/lmem.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/loadlib.o: ../src/lua/loadlib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/loadlib.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/loadlib.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/loadlib.o.d" -o ${OBJECTDIR}/_ext/659861502/loadlib.o ../src/lua/loadlib.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lobject.o: ../src/lua/lobject.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lobject.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lobject.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lobject.o.d" -o ${OBJECTDIR}/_ext/659861502/lobject.o ../src/lua/lobject.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lopcodes.o: ../src/lua/lopcodes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lopcodes.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lopcodes.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lopcodes.o.d" -o ${OBJECTDIR}/_ext/659861502/lopcodes.o ../src/lua/lopcodes.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/loslib.o: ../src/lua/loslib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/loslib.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/loslib.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/loslib.o.d" -o ${OBJECTDIR}/_ext/659861502/loslib.o ../src/lua/loslib.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lparser.o: ../src/lua/lparser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lparser.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lparser.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lparser.o.d" -o ${OBJECTDIR}/_ext/659861502/lparser.o ../src/lua/lparser.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lrotable.o: ../src/lua/lrotable.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lrotable.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lrotable.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lrotable.o.d" -o ${OBJECTDIR}/_ext/659861502/lrotable.o ../src/lua/lrotable.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lstate.o: ../src/lua/lstate.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lstate.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lstate.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lstate.o.d" -o ${OBJECTDIR}/_ext/659861502/lstate.o ../src/lua/lstate.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lstring.o: ../src/lua/lstring.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lstring.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lstring.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lstring.o.d" -o ${OBJECTDIR}/_ext/659861502/lstring.o ../src/lua/lstring.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lstrlib.o: ../src/lua/lstrlib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lstrlib.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lstrlib.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lstrlib.o.d" -o ${OBJECTDIR}/_ext/659861502/lstrlib.o ../src/lua/lstrlib.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/ltable.o: ../src/lua/ltable.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/ltable.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/ltable.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/ltable.o.d" -o ${OBJECTDIR}/_ext/659861502/ltable.o ../src/lua/ltable.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/ltablib.o: ../src/lua/ltablib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/ltablib.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/ltablib.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/ltablib.o.d" -o ${OBJECTDIR}/_ext/659861502/ltablib.o ../src/lua/ltablib.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/ltm.o: ../src/lua/ltm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/ltm.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/ltm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/ltm.o.d" -o ${OBJECTDIR}/_ext/659861502/ltm.o ../src/lua/ltm.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lundump.o: ../src/lua/lundump.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lundump.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lundump.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lundump.o.d" -o ${OBJECTDIR}/_ext/659861502/lundump.o ../src/lua/lundump.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lvm.o: ../src/lua/lvm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lvm.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lvm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lvm.o.d" -o ${OBJECTDIR}/_ext/659861502/lvm.o ../src/lua/lvm.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lzio.o: ../src/lua/lzio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lzio.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lzio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lzio.o.d" -o ${OBJECTDIR}/_ext/659861502/lzio.o ../src/lua/lzio.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/print.o: ../src/lua/print.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/print.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/print.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/print.o.d" -o ${OBJECTDIR}/_ext/659861502/print.o ../src/lua/print.c   -legacy-libc
	
else
${OBJECTDIR}/_ext/683842823/platform.o: ../src/platform/pic32/platform.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/platform.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/platform.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/platform.o.d" -o ${OBJECTDIR}/_ext/683842823/platform.o ../src/platform/pic32/platform.c   -legacy-libc
	
${OBJECTDIR}/_ext/683842823/platform_pio.o: ../src/platform/pic32/platform_pio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/platform_pio.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/platform_pio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/platform_pio.o.d" -o ${OBJECTDIR}/_ext/683842823/platform_pio.o ../src/platform/pic32/platform_pio.c   -legacy-libc
	
${OBJECTDIR}/_ext/683842823/platform_timer.o: ../src/platform/pic32/platform_timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/platform_timer.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/platform_timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/platform_timer.o.d" -o ${OBJECTDIR}/_ext/683842823/platform_timer.o ../src/platform/pic32/platform_timer.c   -legacy-libc
	
${OBJECTDIR}/_ext/683842823/platform_adc.o: ../src/platform/pic32/platform_adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/platform_adc.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/platform_adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/platform_adc.o.d" -o ${OBJECTDIR}/_ext/683842823/platform_adc.o ../src/platform/pic32/platform_adc.c   -legacy-libc
	
${OBJECTDIR}/_ext/683842823/platform_can.o: ../src/platform/pic32/platform_can.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/platform_can.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/platform_can.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/platform_can.o.d" -o ${OBJECTDIR}/_ext/683842823/platform_can.o ../src/platform/pic32/platform_can.c   -legacy-libc
	
${OBJECTDIR}/_ext/683842823/platform_i2c.o: ../src/platform/pic32/platform_i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/platform_i2c.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/platform_i2c.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/platform_i2c.o.d" -o ${OBJECTDIR}/_ext/683842823/platform_i2c.o ../src/platform/pic32/platform_i2c.c   -legacy-libc
	
${OBJECTDIR}/_ext/683842823/platform_pwm.o: ../src/platform/pic32/platform_pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/platform_pwm.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/platform_pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/platform_pwm.o.d" -o ${OBJECTDIR}/_ext/683842823/platform_pwm.o ../src/platform/pic32/platform_pwm.c   -legacy-libc
	
${OBJECTDIR}/_ext/683842823/platform_spi.o: ../src/platform/pic32/platform_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/platform_spi.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/platform_spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/platform_spi.o.d" -o ${OBJECTDIR}/_ext/683842823/platform_spi.o ../src/platform/pic32/platform_spi.c   -legacy-libc
	
${OBJECTDIR}/_ext/683842823/platform_uart.o: ../src/platform/pic32/platform_uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/platform_uart.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/platform_uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/platform_uart.o.d" -o ${OBJECTDIR}/_ext/683842823/platform_uart.o ../src/platform/pic32/platform_uart.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/pio.o: ../src/modules/pio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/pio.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/pio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/pio.o.d" -o ${OBJECTDIR}/_ext/946520205/pio.o ../src/modules/pio.c   -legacy-libc
	
${OBJECTDIR}/_ext/1360937237/common.o: ../src/common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	@${RM} ${OBJECTDIR}/_ext/1360937237/common.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/common.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/common.o.d" -o ${OBJECTDIR}/_ext/1360937237/common.o ../src/common.c   -legacy-libc
	
${OBJECTDIR}/_ext/1360937237/common_tmr.o: ../src/common_tmr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	@${RM} ${OBJECTDIR}/_ext/1360937237/common_tmr.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/common_tmr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/common_tmr.o.d" -o ${OBJECTDIR}/_ext/1360937237/common_tmr.o ../src/common_tmr.c   -legacy-libc
	
${OBJECTDIR}/_ext/1360937237/common_uart.o: ../src/common_uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	@${RM} ${OBJECTDIR}/_ext/1360937237/common_uart.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/common_uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/common_uart.o.d" -o ${OBJECTDIR}/_ext/1360937237/common_uart.o ../src/common_uart.c   -legacy-libc
	
${OBJECTDIR}/_ext/1360937237/elua_int.o: ../src/elua_int.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	@${RM} ${OBJECTDIR}/_ext/1360937237/elua_int.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/elua_int.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/elua_int.o.d" -o ${OBJECTDIR}/_ext/1360937237/elua_int.o ../src/elua_int.c   -legacy-libc
	
${OBJECTDIR}/_ext/1360937237/linenoise.o: ../src/linenoise.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	@${RM} ${OBJECTDIR}/_ext/1360937237/linenoise.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/linenoise.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/linenoise.o.d" -o ${OBJECTDIR}/_ext/1360937237/linenoise.o ../src/linenoise.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/bit.o: ../src/modules/bit.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/bit.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/bit.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/bit.o.d" -o ${OBJECTDIR}/_ext/946520205/bit.o ../src/modules/bit.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/lpack.o: ../src/modules/lpack.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/lpack.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/lpack.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/lpack.o.d" -o ${OBJECTDIR}/_ext/946520205/lpack.o ../src/modules/lpack.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/cpu.o: ../src/modules/cpu.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/cpu.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/cpu.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/cpu.o.d" -o ${OBJECTDIR}/_ext/946520205/cpu.o ../src/modules/cpu.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/pd.o: ../src/modules/pd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/pd.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/pd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/pd.o.d" -o ${OBJECTDIR}/_ext/946520205/pd.o ../src/modules/pd.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/tmr.o: ../src/modules/tmr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/tmr.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/tmr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/tmr.o.d" -o ${OBJECTDIR}/_ext/946520205/tmr.o ../src/modules/tmr.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/uart.o: ../src/modules/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/uart.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/uart.o.d" -o ${OBJECTDIR}/_ext/946520205/uart.o ../src/modules/uart.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/spi.o: ../src/modules/spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/spi.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/spi.o.d" -o ${OBJECTDIR}/_ext/946520205/spi.o ../src/modules/spi.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/i2c.o: ../src/modules/i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/i2c.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/i2c.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/i2c.o.d" -o ${OBJECTDIR}/_ext/946520205/i2c.o ../src/modules/i2c.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/adc.o: ../src/modules/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/adc.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/adc.o.d" -o ${OBJECTDIR}/_ext/946520205/adc.o ../src/modules/adc.c   -legacy-libc
	
${OBJECTDIR}/_ext/1360937237/elua_adc.o: ../src/elua_adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	@${RM} ${OBJECTDIR}/_ext/1360937237/elua_adc.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/elua_adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/elua_adc.o.d" -o ${OBJECTDIR}/_ext/1360937237/elua_adc.o ../src/elua_adc.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/pwm.o: ../src/modules/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/pwm.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/pwm.o.d" -o ${OBJECTDIR}/_ext/946520205/pwm.o ../src/modules/pwm.c   -legacy-libc
	
${OBJECTDIR}/_ext/946520205/can.o: ../src/modules/can.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/946520205 
	@${RM} ${OBJECTDIR}/_ext/946520205/can.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/946520205/can.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/946520205/can.o.d" -o ${OBJECTDIR}/_ext/946520205/can.o ../src/modules/can.c   -legacy-libc
	
${OBJECTDIR}/_ext/1360937237/buf.o: ../src/buf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	@${RM} ${OBJECTDIR}/_ext/1360937237/buf.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/buf.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/buf.o.d" -o ${OBJECTDIR}/_ext/1360937237/buf.o ../src/buf.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lapi.o: ../src/lua/lapi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lapi.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lapi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lapi.o.d" -o ${OBJECTDIR}/_ext/659861502/lapi.o ../src/lua/lapi.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lauxlib.o: ../src/lua/lauxlib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lauxlib.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lauxlib.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lauxlib.o.d" -o ${OBJECTDIR}/_ext/659861502/lauxlib.o ../src/lua/lauxlib.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lbaselib.o: ../src/lua/lbaselib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lbaselib.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lbaselib.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lbaselib.o.d" -o ${OBJECTDIR}/_ext/659861502/lbaselib.o ../src/lua/lbaselib.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lcode.o: ../src/lua/lcode.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lcode.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lcode.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lcode.o.d" -o ${OBJECTDIR}/_ext/659861502/lcode.o ../src/lua/lcode.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/ldblib.o: ../src/lua/ldblib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/ldblib.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/ldblib.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/ldblib.o.d" -o ${OBJECTDIR}/_ext/659861502/ldblib.o ../src/lua/ldblib.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/ldebug.o: ../src/lua/ldebug.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/ldebug.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/ldebug.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/ldebug.o.d" -o ${OBJECTDIR}/_ext/659861502/ldebug.o ../src/lua/ldebug.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/ldo.o: ../src/lua/ldo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/ldo.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/ldo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/ldo.o.d" -o ${OBJECTDIR}/_ext/659861502/ldo.o ../src/lua/ldo.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/ldump.o: ../src/lua/ldump.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/ldump.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/ldump.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/ldump.o.d" -o ${OBJECTDIR}/_ext/659861502/ldump.o ../src/lua/ldump.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/legc.o: ../src/lua/legc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/legc.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/legc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/legc.o.d" -o ${OBJECTDIR}/_ext/659861502/legc.o ../src/lua/legc.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lfunc.o: ../src/lua/lfunc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lfunc.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lfunc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lfunc.o.d" -o ${OBJECTDIR}/_ext/659861502/lfunc.o ../src/lua/lfunc.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lgc.o: ../src/lua/lgc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lgc.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lgc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lgc.o.d" -o ${OBJECTDIR}/_ext/659861502/lgc.o ../src/lua/lgc.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/linit.o: ../src/lua/linit.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/linit.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/linit.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/linit.o.d" -o ${OBJECTDIR}/_ext/659861502/linit.o ../src/lua/linit.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/liolib.o: ../src/lua/liolib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/liolib.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/liolib.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/liolib.o.d" -o ${OBJECTDIR}/_ext/659861502/liolib.o ../src/lua/liolib.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/llex.o: ../src/lua/llex.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/llex.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/llex.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/llex.o.d" -o ${OBJECTDIR}/_ext/659861502/llex.o ../src/lua/llex.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lmathlib.o: ../src/lua/lmathlib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lmathlib.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lmathlib.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lmathlib.o.d" -o ${OBJECTDIR}/_ext/659861502/lmathlib.o ../src/lua/lmathlib.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lmem.o: ../src/lua/lmem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lmem.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lmem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lmem.o.d" -o ${OBJECTDIR}/_ext/659861502/lmem.o ../src/lua/lmem.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/loadlib.o: ../src/lua/loadlib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/loadlib.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/loadlib.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/loadlib.o.d" -o ${OBJECTDIR}/_ext/659861502/loadlib.o ../src/lua/loadlib.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lobject.o: ../src/lua/lobject.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lobject.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lobject.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lobject.o.d" -o ${OBJECTDIR}/_ext/659861502/lobject.o ../src/lua/lobject.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lopcodes.o: ../src/lua/lopcodes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lopcodes.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lopcodes.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lopcodes.o.d" -o ${OBJECTDIR}/_ext/659861502/lopcodes.o ../src/lua/lopcodes.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/loslib.o: ../src/lua/loslib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/loslib.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/loslib.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/loslib.o.d" -o ${OBJECTDIR}/_ext/659861502/loslib.o ../src/lua/loslib.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lparser.o: ../src/lua/lparser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lparser.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lparser.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lparser.o.d" -o ${OBJECTDIR}/_ext/659861502/lparser.o ../src/lua/lparser.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lrotable.o: ../src/lua/lrotable.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lrotable.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lrotable.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lrotable.o.d" -o ${OBJECTDIR}/_ext/659861502/lrotable.o ../src/lua/lrotable.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lstate.o: ../src/lua/lstate.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lstate.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lstate.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lstate.o.d" -o ${OBJECTDIR}/_ext/659861502/lstate.o ../src/lua/lstate.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lstring.o: ../src/lua/lstring.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lstring.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lstring.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lstring.o.d" -o ${OBJECTDIR}/_ext/659861502/lstring.o ../src/lua/lstring.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lstrlib.o: ../src/lua/lstrlib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lstrlib.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lstrlib.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lstrlib.o.d" -o ${OBJECTDIR}/_ext/659861502/lstrlib.o ../src/lua/lstrlib.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/ltable.o: ../src/lua/ltable.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/ltable.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/ltable.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/ltable.o.d" -o ${OBJECTDIR}/_ext/659861502/ltable.o ../src/lua/ltable.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/ltablib.o: ../src/lua/ltablib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/ltablib.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/ltablib.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/ltablib.o.d" -o ${OBJECTDIR}/_ext/659861502/ltablib.o ../src/lua/ltablib.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/ltm.o: ../src/lua/ltm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/ltm.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/ltm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/ltm.o.d" -o ${OBJECTDIR}/_ext/659861502/ltm.o ../src/lua/ltm.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lundump.o: ../src/lua/lundump.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lundump.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lundump.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lundump.o.d" -o ${OBJECTDIR}/_ext/659861502/lundump.o ../src/lua/lundump.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lvm.o: ../src/lua/lvm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lvm.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lvm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lvm.o.d" -o ${OBJECTDIR}/_ext/659861502/lvm.o ../src/lua/lvm.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lzio.o: ../src/lua/lzio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lzio.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lzio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lzio.o.d" -o ${OBJECTDIR}/_ext/659861502/lzio.o ../src/lua/lzio.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/print.o: ../src/lua/print.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/print.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/print.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -DPLATFORM_MODULES_ENABLE -DLUA_META_ROTABLES -DSTART_OF_KSEG1_RAM=0xA0000000 -I"../inc" -I"../src/lua" -I"../src/modules" -I"../src/platform/pic32" -I"../inc/newlib" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/print.o.d" -o ${OBJECTDIR}/_ext/659861502/print.o ../src/lua/print.c   -legacy-libc
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: archive
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/eLuaLib.X.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_AR} $(MP_EXTRA_AR_PRE) r dist/${CND_CONF}/${IMAGE_TYPE}/eLuaLib.X.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    
else
dist/${CND_CONF}/${IMAGE_TYPE}/eLuaLib.X.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_AR} $(MP_EXTRA_AR_PRE) r dist/${CND_CONF}/${IMAGE_TYPE}/eLuaLib.X.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
