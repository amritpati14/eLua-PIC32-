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
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/eLuaTerminal.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/eLuaTerminal.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/683842823/platform.o ${OBJECTDIR}/_ext/683842823/stdioConfig.o ${OBJECTDIR}/_ext/659861502/lua.o ${OBJECTDIR}/exceptions.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/683842823/platform.o.d ${OBJECTDIR}/_ext/683842823/stdioConfig.o.d ${OBJECTDIR}/_ext/659861502/lua.o.d ${OBJECTDIR}/exceptions.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/683842823/platform.o ${OBJECTDIR}/_ext/683842823/stdioConfig.o ${OBJECTDIR}/_ext/659861502/lua.o ${OBJECTDIR}/exceptions.o


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
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/eLuaTerminal.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/platform.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -I"../inc" -I"../src/platform/pic32" -I"../src/lua" -I"../inc/newlib" -I"../src/modules" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/platform.o.d" -o ${OBJECTDIR}/_ext/683842823/platform.o ../src/platform/pic32/platform.c   -legacy-libc
	
${OBJECTDIR}/_ext/683842823/stdioConfig.o: ../src/platform/pic32/stdioConfig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/stdioConfig.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/stdioConfig.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -I"../inc" -I"../src/platform/pic32" -I"../src/lua" -I"../inc/newlib" -I"../src/modules" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/stdioConfig.o.d" -o ${OBJECTDIR}/_ext/683842823/stdioConfig.o ../src/platform/pic32/stdioConfig.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lua.o: ../src/lua/lua.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lua.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lua.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -I"../inc" -I"../src/platform/pic32" -I"../src/lua" -I"../inc/newlib" -I"../src/modules" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lua.o.d" -o ${OBJECTDIR}/_ext/659861502/lua.o ../src/lua/lua.c   -legacy-libc
	
${OBJECTDIR}/exceptions.o: exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/exceptions.o.d 
	@${FIXDEPS} "${OBJECTDIR}/exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -I"../inc" -I"../src/platform/pic32" -I"../src/lua" -I"../inc/newlib" -I"../src/modules" -Wall -MMD -MF "${OBJECTDIR}/exceptions.o.d" -o ${OBJECTDIR}/exceptions.o exceptions.c   -legacy-libc
	
else
${OBJECTDIR}/_ext/683842823/platform.o: ../src/platform/pic32/platform.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/platform.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/platform.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -I"../inc" -I"../src/platform/pic32" -I"../src/lua" -I"../inc/newlib" -I"../src/modules" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/platform.o.d" -o ${OBJECTDIR}/_ext/683842823/platform.o ../src/platform/pic32/platform.c   -legacy-libc
	
${OBJECTDIR}/_ext/683842823/stdioConfig.o: ../src/platform/pic32/stdioConfig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/683842823 
	@${RM} ${OBJECTDIR}/_ext/683842823/stdioConfig.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683842823/stdioConfig.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -I"../inc" -I"../src/platform/pic32" -I"../src/lua" -I"../inc/newlib" -I"../src/modules" -Wall -MMD -MF "${OBJECTDIR}/_ext/683842823/stdioConfig.o.d" -o ${OBJECTDIR}/_ext/683842823/stdioConfig.o ../src/platform/pic32/stdioConfig.c   -legacy-libc
	
${OBJECTDIR}/_ext/659861502/lua.o: ../src/lua/lua.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/659861502 
	@${RM} ${OBJECTDIR}/_ext/659861502/lua.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/659861502/lua.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -I"../inc" -I"../src/platform/pic32" -I"../src/lua" -I"../inc/newlib" -I"../src/modules" -Wall -MMD -MF "${OBJECTDIR}/_ext/659861502/lua.o.d" -o ${OBJECTDIR}/_ext/659861502/lua.o ../src/lua/lua.c   -legacy-libc
	
${OBJECTDIR}/exceptions.o: exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/exceptions.o.d 
	@${FIXDEPS} "${OBJECTDIR}/exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DLUA_CROSS_COMPILER -I"../inc" -I"../src/platform/pic32" -I"../src/lua" -I"../inc/newlib" -I"../src/modules" -Wall -MMD -MF "${OBJECTDIR}/exceptions.o.d" -o ${OBJECTDIR}/exceptions.o exceptions.c   -legacy-libc
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/eLuaTerminal.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../eLuaLib.X/dist/default/debug/eLuaLib.X.a  
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_PIC32MXSK=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/eLuaTerminal.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\eLuaLib.X\dist\default\debug\eLuaLib.X.a     -legacy-libc -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PIC32MXSK=1,--defsym=_min_heap_size=64000,--defsym=_min_stack_size=10000
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/eLuaTerminal.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../eLuaLib.X/dist/default/production/eLuaLib.X.a 
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/eLuaTerminal.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\eLuaLib.X\dist\default\production\eLuaLib.X.a     -legacy-libc -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=64000,--defsym=_min_stack_size=10000
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/eLuaTerminal.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:
	cd /D ../eLuaLib.X && ${MAKE} MAKE_OPTIONS="" -f Makefile CONF=default


# Subprojects
.clean-subprojects:
	cd /D ../eLuaLib.X && rm -rf "build/default" "dist/default"

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
