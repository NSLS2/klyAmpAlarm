#!../../bin/linux-x86_64/klyAmpAlarm

#- You may have to change klyAmpAlarm to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/klyAmpAlarm.dbd"
klyAmpAlarm_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords "db/dbAmpLarm.db", "P1=LN-RF,P2=LN-RF:1,S2={Cav}Drv,P3=LN-RF:1{Mod},DEV1=LN-RF:1{Mod},DEV2=KLY:1,DEV3=AMP:3,DEV4=Amp:3"
dbLoadRecords "db/dbAmpLarm.db", "P1=LN-RF,P2=LN-RF:2,S2={Cav}Drv,P3=LN-RF:2{Mod},DEV1=LN-RF:2{Mod},DEV2=KLY:2,DEV3=AMP:4,DEV4=Amp:4"
dbLoadRecords "db/dbAmpLarm.db", "P1=LN-RF,P2=LN-RF:3,S2={Cav}Drv,P3=LN-RF:3{Mod},DEV1=LN-RF:3{Mod},DEV2=KLY:3,DEV3=AMP:5,DEV4=Amp:5"

dbLoadRecords("db/iocAdminSoft.db", "IOC=RF-CT{${IOC}}")
dbLoadRecords("db/reccaster.db", "P=RF-CT{${IOC}-RC}")

cd "${TOP}/iocBoot/${IOC}"
callbackSetQueueSize(20000)
iocInit

