@echo off

rem
rem 当前脚本所在目录为exeRunDir
rem
set exeRunDir=%~d0%~p0

set JAVA_HOME=%exeRunDir%\jre1.8.0_92

set CLASS_PATH=%CLASS_PATH%;%exeRunDir%\xapps\gtcloud-extra-tools\gtcloud-extra-tools.jar
set CLASS_PATH=%CLASS_PATH%;%exeRunDir%\xapps\gtcloud-extra-tools\slf4j-api-1.7.25.jar
set CLASS_PATH=%CLASS_PATH%;%exeRunDir%\xapps\gtcloud-extra-tools\logback-classic-1.2.3.jar
set CLASS_PATH=%CLASS_PATH%;%exeRunDir%\xapps\gtcloud-extra-tools\logback-core-1.2.3.jar

shift
%JAVA_HOME%\bin\java.exe ^
    -DGTCLOUD_APP_BASE=%exeRunDir% ^
    -DGTCLOUD_ETC_DIR=%exeRunDir%\webetc ^
    -DGTCLOUD_INTERACTIVE_CMD=certgen ^
    -Xms512m -Xmx2048m ^
    -classpath %CLASS_PATH% ^
    gtcloud.extratools.ServerCertGenerator %*
