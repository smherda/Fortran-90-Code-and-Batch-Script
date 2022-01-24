#!/bin/bash

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::Bash Restart File
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@ECHO OFF

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::NOTE: Testing, Line Below SHows that Reboot Was Successful
ECHO Sunday_Reboot_Reucessful!>Sunday_Reboot_Sucess.txt
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::Initiate Restart 
shutdown.exe /r /t 1800

::Start Loop
:loop
::Pop-Up
::Let User Know About Restart
ECHO--- --- --- --- --- ---
ECHO     NOTE
ECHO--- --- --- --- --- ---
ECHO Saturday 12 PM Computer Restart Begins in 30 minutes
ECHO (Please Restart Twice a Month to Prevent Hardware Problems!)

::Clear Previou sAnswer
SET "ans=foo"
ECHO.
ECHO--- --- --- --- --- ---
ECHO     OPTIONS
ECHO--- --- --- --- --- ---
ECHO 1 - Cancel This Week's Restart
ECHO 2 - Close Pop-Up
ECHO.
SET /P ans=   Enter 1 or 2:

::Go to Function Based on Response
if %ans% == 1 GOTO cancel
if %ans% == 2 GOTO close

::Else is Re-enter Response
GOTO reenter
GOTO loop

::Function for Cancelling
:cancel
::Abort Restart
shutdown.exe /a

::Announce to User Restart is Cancelled
test&cls

ECHO--- --- --- --- --- ---
ECHO     REPLY
ECHO--- --- --- --- --- ---
ECHO Please Enter 1 or 2
ECHO.

::Return to Loop
GOTO loop
:end
