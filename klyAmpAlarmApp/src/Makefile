TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = klyAmpAlarm
# klyAmpAlarm.dbd will be created and installed
DBD += klyAmpAlarm.dbd

# klyAmpAlarm.dbd will be made up from these files:
klyAmpAlarm_DBD += base.dbd

# Include dbd files from all support applications:
klyAmpAlarm_DBD += caPutLog.dbd
klyAmpAlarm_DBD += devIocStats.dbd
klyAmpAlarm_DBD += asSupport.dbd
klyAmpAlarm_DBD += reccaster.dbd

# Add all the support libraries needed by this IOC
klyAmpAlarm_LIBS += caPutLog devIocStats autosave seq pv reccaster pvDatabase qsrv pvaClient pvAccessIOC pvAccess pvAccessCA nt pvData

# klyAmpAlarm_registerRecordDeviceDriver.cpp derives from klyAmpAlarm.dbd
klyAmpAlarm_SRCS += klyAmpAlarm_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
klyAmpAlarm_SRCS_DEFAULT += klyAmpAlarmMain.cpp
klyAmpAlarm_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#klyAmpAlarm_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link QSRV (pvAccess Server) if available
ifdef EPICS_QSRV_MAJOR_VERSION
    klyAmpAlarm_LIBS += qsrv
    klyAmpAlarm_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
    klyAmpAlarm_DBD  += PVAServerRegister.dbd
    klyAmpAlarm_DBD  += qsrv.dbd
endif

# Finally link to the EPICS Base libraries
klyAmpAlarm_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

