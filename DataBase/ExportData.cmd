@echo off
cd /d %~dp0
REM:https://github.com/microsoft/mssql-scripter/blob/dev/doc/installation_guide.md
REM:https://github.com/microsoft/mssql-scripter/blob/dev/doc/usage_guide.md

@echo *****************************************
@echo ******** Welcome to use ZKEACMS *********
@echo *****************************************
@echo Documents
@echo http://www.zkea.net/zkeacms/document
@echo -----------------------------------------------------------------------------
@echo Will generate all data scripts for ZKEACMS database
@echo -----------------------------------------------------------------------------
@echo Press Enter to use the default setting
@echo Working directory:%cd%
set /P server=1.Sql Server address (local):
if "%server%"=="" set server=(local)
set /P dataBase=2.Database name (ZKEACMS_Core):
if "%dataBase%"=="" set dataBase=ZKEACMS_Core
set /P dbUserId=3.User name (sa):
if "%dbUserId%"=="" set dbUserId=sa
set /P dbPassword=4.Password (sa):
if "%dbPassword%"=="" set dbPassword=sa

@echo Data
mssql-scripter -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% --target-server-version 2008 --exclude-use-database --exclude-headers --file-per-object --data-only --include-objects dbo. --file-path ./InitialData
