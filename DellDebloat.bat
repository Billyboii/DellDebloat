@echo off
REM REQUEST ADMIN PRIVLEGES----------------------------------------------------------------------------------------------
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------


REM UNINSTALL SCRIPT-----------------------------------------------------------------------------------------------------
REM If you are looking to add applications to this list, search the registry for the string that is listed in the Programs and Features menu until you find the "UninstallString"
REM There may be multiple uninstall strings for the same application, add all of them here. As the dell applications are updated over time, the applicationID can change.
REM Once you find the "UninstallString", you'll need to add the proper flags so that the uninstaller runs silently, usually that is either "/quiet", "/s", "/silent", or "2> nul"
REM Once you have the "UninstallString" + the flag, add it below.

REM Dell Command | Update for Windows 10
echo "Uninstalling Dell Command | Update for Windows 10..."
MsiExec.exe /X{5669AB71-1302-4412-8DA1-CB69CD7B7324} /quiet
MsiExec.exe /X{4CCADC13-F3AE-454F-B724-33F6D4E52022} /quiet

REM Dell Digital Delivery Services
echo "Uninstalling Dell Digital Delivery Services..."
MsiExec.exe /X{CC5730C7-C867-43BD-94DA-00BB3836906F} /quiet
MsiExec.exe /I{66E2407E-9001-483E-B2AA-7AEF97567143} /quiet
MsiExec.exe /X{81C48559-E2EB-4F18-9854-51331B9DB552} /quiet
MsiExec.exe /X{3722784A-D530-4C82-BB78-4DF3E1A4CAD9} /quiet

REM Dell Optimizer Service
echo "Uninstalling Dell Optimizer Service..."
"C:\Program Files (x86)\InstallShield Installation Information\{286A9ADE-A581-43E8-AA85-6F5D58C7DC88}\DellOptimizer.exe" -remove -runfromtemp -silent

REM Dell Update - SupportAssist Update Plugin
echo "Uninstalling Dell Update - SupportAssist Update Plugin..."
"C:\ProgramData\Package Cache\{819b927b-a8d8-46a9-9512-0326900f80e3}\DellUpdateSupportAssistPlugin.exe" /uninstall /quiet 2> nul
MsiExec.exe /I{AADBB088-81DE-4EC8-B176-D98669BE09D4} /quiet
"C:\ProgramData\Package Cache\{31581d2d-a9e8-4f15-aa85-d6f9473b619e}\DellUpdateSupportAssistPlugin.exe" /uninstall /quiet 2> nul
MsiExec.exe /I{EDE60887-F1EA-4304-A3E9-806D29EEE3FB} /quiet
"C:\ProgramData\Package Cache\{9aec637d-a647-4f3b-998e-425f40e7dd50}\DellUpdateSupportAssistPlugin.exe" /uninstall /quiet 2> nul
MsiExec.exe /I{C559D0AB-2D9E-4B59-B2B8-0C2061B3F9BC} /quiet
"C:\ProgramData\Package Cache\{3a267e2b-0948-4f12-a103-e2ac0461179d}\DellUpdateSupportAssistPlugin.exe" /uninstall /quiet 2> nul
MsiExec.exe /I{8B6D8EEE-9EE4-4FA3-9EC6-87BE5D130CB6} /quiet
"C:\ProgramData\Package Cache\{eb4d8dd7-ae4c-442d-8d21-8bfb73c03748}\DellUpdateSupportAssistPlugin.exe" /uninstall /quiet 2> nul

REM Dell SupportAssist Remediation
echo "Uninstalling Dell SupportAssist Remediation..."
"C:\ProgramData\Package Cache\{3c7a4bc1-7c12-40a9-be55-a4a2c1b415bd}\DellSupportAssistRemediationServiceInstaller.exe" /uninstall /quiet 2> nul
MsiExec.exe /I{8FA6BC9C-CF6A-45E7-92BD-1585DFAFB32C} /quiet
"C:\ProgramData\Package Cache\{5f9ca6e9-c7d9-49c9-88fa-196d35d8eb82}\DellSupportAssistRemediationServiceInstaller.exe" /uninstall /quiet 2> nul
MsiExec.exe /I{2B2C47D2-F037-4C03-B599-07D7AFE8DD54} /quiet
"C:\ProgramData\Package Cache\{8ce1a5ae-856e-4b8e-a0e8-27dd7a209276}\DellSupportAssistRemediationServiceInstaller.exe" /uninstall /quiet 2> nul
MsiExec.exe /I{1906C253-4035-4CA5-A501-075E691CCEC9} /quiet
"C:\ProgramData\Package Cache\{96846915-505c-49a2-8aa0-63f90927de87}\DellSupportAssistRemediationServiceInstaller.exe" /uninstall /quiet 2> nul
MsiExec.exe /I{C4EF62FF-E6B9-4CE8-A514-1DDA49CB0C47} /quiet
"C:\ProgramData\Package Cache\{075ec656-5bd3-49b7-b0ee-07275a577c52}\DellSupportAssistRemediationServiceInstaller.exe" /uninstall /quiet 2> nul
MsiExec.exe /I{795931D8-2EBF-4969-A678-4219B161F676} /quiet
"C:\ProgramData\Package Cache\{a0d5bbde-c013-48ba-b98a-ca0ff5cf36a6}\DellSupportAssistRemediationServiceInstaller.exe" /uninstall /quiet 2> nul
MsiExec.exe /I{10B1BCF9-4996-4270-A12D-1B1BFEEF979C} /quiet


REM Dell SupportAssist
echo "Uninstalling Dell SupportAssist..."
"C:\Program Files\Dell\SupportAssistAgent\bin\SupportAssistUninstaller.exe" /S 2> nul
"C:\ProgramData\Package Cache\{555298fa-14a9-48f2-a7a0-9602f31785da}\DellSupportAssistRemediationServiceInstaller.exe" /uninstall /quiet 2> nul
"C:\ProgramData\Package Cache\{ec40a028-983b-4213-af2c-77ed6f6fe1d5}\DellUpdateSupportAssistPlugin.exe" /uninstall /quiet 2> nul
MsiExec.exe /X{3A0ECCB6-1034-440E-8672-C4E14CCB7689} /quiet
MsiExec.exe /X{5106801D-CA18-4173-85B9-D74C33358F7F} /quiet


REM Dell SupportAssist OS Recovery Plugin for Dell Update
echo "Uninstalling Dell SupportAssist OS Recovery Plugin for Dell Update..."
MsiExec.exe /I{900D0BCD-0B86-4DAA-B639-89BE70449569} /quiet
"C:\ProgramData\Package Cache\{e178914d-07c9-4d17-bd20-287c78ecc0f1}\DellUpdateSupportAssistPlugin.exe" /uninstall /quiet 2> nul
MsiExec.exe /I{6DD27BB4-C350-414B-BC25-D33246605FB2} /quiet


REM Dell Power Manager Service
echo "Uninstalling Dell Power Manager Service..."
MsiExec.exe /X{18469ED8-8C36-4CF7-BD43-0FC9B1931AF8} /quiet

REM Dell Update for Windows 10
echo "Uninstalling Dell Update for Windows 10..."
MsiExec.exe /X{70E9F8CC-A23E-4C25-B292-C86C1821587C} /quiet

REM Microsoft Office 365 - en-us
echo "Uninstalling Microsoft Office 365 - en-us..."
"C:\Program Files\Common Files\Microsoft Shared\ClickToRun\OfficeClickToRun.exe" scenario=install scenariosubtype=ARP sourcetype=None productstoremove=O365HomePremRetail.16_en-us_x-none culture=en-us version.16=16.0 DisplayLevel=False 2>nul

REM Microsoft Office 365 - es-es
echo "Uninstalling Microsoft Office 365 - es-es..."
"C:\Program Files\Common Files\Microsoft Shared\ClickToRun\OfficeClickToRun.exe" scenario=install scenariosubtype=ARP sourcetype=None productstoremove=O365HomePremRetail.16_es-es_x-none culture=es-es version.16=16.0 DisplayLevel=False 2>nul

REM Microsoft Office 365 - fr-fr
echo "Uninstalling Microsoft Office 365 - fr-fr..."
"C:\Program Files\Common Files\Microsoft Shared\ClickToRun\OfficeClickToRun.exe" scenario=install scenariosubtype=ARP sourcetype=None productstoremove=O365HomePremRetail.16_fr-fr_x-none culture=fr-fr version.16=16.0 DisplayLevel=False 2>nul
