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
REM These usually can be found in:
REM HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\ and then the SID\Product folders.
REM HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\
REM HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall
REM There may be multiple uninstall strings for the same application, add all of them here. As the dell applications are updated over time, the applicationID can change.
REM Once you find the "UninstallString", you'll need to add the proper flags so that the uninstaller runs silently, usually that is either "/quiet", "/s", "/silent", or "2> nul"
REM Once you have the "UninstallString" + the flag, add it below.

REM Dell Command | Update for Windows 10
echo "Uninstalling Dell Command | Update for Windows 10..."
MsiExec.exe /X{5669AB71-1302-4412-8DA1-CB69CD7B7324} /quiet
MsiExec.exe /X{4CCADC13-F3AE-454F-B724-33F6D4E52022} /quiet
MsiExec.exe /X{EC542D5D-B608-4145-A8F7-749C02BE6D94} /quiet
MsiExec.exe /X{41D2D254-D869-4CD8-B440-5DF49083C4BA} /quiet

REM Dell Update
echo "Uninstalling Dell Update..."
MsiExec.exe /I{D8AE5F9D-647C-49B4-A666-1C20B44EC0E1} /quiet

REM Dell Update for Windows 10
echo "Uninstalling Dell Update for Windows 10..."
MsiExec.exe /X{70E9F8CC-A23E-4C25-B292-C86C1821587C} /quiet

REM Dell Digital Delivery Services
echo "Uninstalling Dell Digital Delivery Services..."
MsiExec.exe /X{CC5730C7-C867-43BD-94DA-00BB3836906F} /quiet
MsiExec.exe /I{66E2407E-9001-483E-B2AA-7AEF97567143} /quiet
MsiExec.exe /X{81C48559-E2EB-4F18-9854-51331B9DB552} /quiet
MsiExec.exe /X{3722784A-D530-4C82-BB78-4DF3E1A4CAD9} /quiet
MsiExec.exe /I{693A23FB-F28B-4F7A-A720-4C1263F97F43} /quiet
MsiExec.exe /X{560DFD4A-23E2-45DD-A223-A4B3FA356913} /quiet

REM Dell Optimizer Service
echo "Uninstalling Dell Optimizer Service..."
"C:\Program Files (x86)\InstallShield Installation Information\{286A9ADE-A581-43E8-AA85-6F5D58C7DC88}\DellOptimizer.exe" -remove -runfromtemp -silent 2> nul

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
MsiExec.exe /I{61A1B864-0DAF-45A4-8184-5A0D347803B1} /quiet
MsiExec.exe /I{795931D8-2EBF-4969-A678-4219B161F676} /quiet
"C:\ProgramData\Package Cache\{555298fa-14a9-48f2-a7a0-9602f31785da}\DellSupportAssistRemediationServiceInstaller.exe" /uninstall /quiet 2> nul
MsiExec.exe /I{6B991B44-B938-4902-BDF3-186CBDC62AD3} /quiet
"C:\ProgramData\Package Cache\{34685541-a19e-4537-97c9-082238790346}\DellSupportAssistRemediationServiceInstaller.exe" /uninstall /quiet 2> nul
MsiExec.exe /I{61A1B864-0DAF-45A4-8184-5A0D347803B1} /quiet
"C:\ProgramData\Package Cache\{346eb8e9-af99-485f-b39d-89717cb78f11}\DellSupportAssistRemediationServiceInstaller.exe" /uninstall /quiet 2> nul
MsiExec.exe /I{E21419F5-2AA6-439C-B2C1-840083A05BC5} /quiet
"C:\ProgramData\Package Cache\{db72dcd5-bf99-4888-b104-cb605b82ec8a}\DellSupportAssistRemediationServiceInstaller.exe" /uninstall /quiet 2> nul


REM Dell SupportAssist
echo "Uninstalling Dell SupportAssist..."
"C:\Program Files\Dell\SupportAssistAgent\bin\SupportAssistUninstaller.exe" /S 2> nul
"C:\ProgramData\Package Cache\{555298fa-14a9-48f2-a7a0-9602f31785da}\DellSupportAssistRemediationServiceInstaller.exe" /uninstall /quiet 2> nul
"C:\ProgramData\Package Cache\{ec40a028-983b-4213-af2c-77ed6f6fe1d5}\DellUpdateSupportAssistPlugin.exe" /uninstall /quiet 2> nul
MsiExec.exe /X{3A0ECCB6-1034-440E-8672-C4E14CCB7689} /quiet
MsiExec.exe /X{5106801D-CA18-4173-85B9-D74C33358F7F} /quiet
MsiExec.exe /X{9EF0AEB0-9AD2-40E6-8667-D7520C508941} /quiet
MsiExec.exe /X{71A59A4C-9348-4CA2-B98C-E422E14C9D31} /quiet
MsiExec.exe /I{E21419F5-2AA6-439C-B2C1-840083A05BC5} /quiet

REM Dell SupportAssist OS Recovery Plugin for Dell Update
echo "Uninstalling Dell SupportAssist OS Recovery Plugin for Dell Update..."
MsiExec.exe /I{900D0BCD-0B86-4DAA-B639-89BE70449569} /quiet
"C:\ProgramData\Package Cache\{e178914d-07c9-4d17-bd20-287c78ecc0f1}\DellUpdateSupportAssistPlugin.exe" /uninstall /quiet 2> nul
MsiExec.exe /I{6DD27BB4-C350-414B-BC25-D33246605FB2} /quiet
MsiExec.exe /I{900D0BCD-0B86-4DAA-B639-89BE70449569} /quiet
"C:\ProgramData\Package Cache\{ec40a028-983b-4213-af2c-77ed6f6fe1d5}\DellUpdateSupportAssistPlugin.exe" /uninstall /quiet 2> nul
MsiExec.exe /I{A713BCAE-ED3C-43BA-834A-8D1E8773FF2C} /quiet
"C:\ProgramData\Package Cache\{b07a0d04-06d6-445c-ae24-7ae9991f11aa}\DellUpdateSupportAssistPlugin.exe" /uninstall /quiet 2> nul


REM Dell Power Manager Service
echo "Uninstalling Dell Power Manager Service..."
MsiExec.exe /X{18469ED8-8C36-4CF7-BD43-0FC9B1931AF8} /quiet

REM Dell Foundation Services
echo "Uninstalling Dell Foundation Services..."
MsiExec.exe /X{BDB50421-E961-42F3-B803-6DAC6F173834} /quiet

REM Dell Protected Workspace
echo "Uninstalled Dell Protected Workspace..."
MsiExec.exe /X{E2CAA395-66B3-4772-85E3-6134DBAB244E} /quiet

REM Microsoft 365 - en-us
echo "Uninstalling Microsoft Office 365 - en-us..."
"C:\Program Files\Common Files\Microsoft Shared\ClickToRun\OfficeClickToRun.exe" scenario=install scenariosubtype=ARP sourcetype=None productstoremove=O365HomePremRetail.16_en-us_x-none culture=en-us version.16=16.0 DisplayLevel=False 2>nul

REM Microsoft 365 - es-es
echo "Uninstalling Microsoft Office 365 - es-es..."
"C:\Program Files\Common Files\Microsoft Shared\ClickToRun\OfficeClickToRun.exe" scenario=install scenariosubtype=ARP sourcetype=None productstoremove=O365HomePremRetail.16_es-es_x-none culture=es-es version.16=16.0 DisplayLevel=False 2>nul

REM Microsoft 365 - fr-fr
echo "Uninstalling Microsoft Office 365 - fr-fr..."
"C:\Program Files\Common Files\Microsoft Shared\ClickToRun\OfficeClickToRun.exe" scenario=install scenariosubtype=ARP sourcetype=None productstoremove=O365HomePremRetail.16_fr-fr_x-none culture=fr-fr version.16=16.0 DisplayLevel=False 2>nul
