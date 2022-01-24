:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::Bash Restart File
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@ECHO OFF

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::NOTE: Testing, Line Below SHows that Reboot Was Successful
ECHO Sunday_Reboot_Reucessful!>Sunday_Reboot_Sucess.txt
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::Start Loop
:loop
::Pop-Up
::Let User Know About Restart
ECHO --- --- --- --- --- ---
ECHO     NOTE
ECHO --- --- --- --- --- ---
ECHO Saturday 12 PM Computer Restart Scheduled in 30 minutes
ECHO (Please Restart Every Saturday to Prevent Hardware Problems!)

::Clear Previou sAnswer
SET "ans=foo"
ECHO.
ECHO --- --- --- --- --- ---
ECHO     OPTIONS
ECHO --- --- --- --- --- ---
ECHO 1 - Cancel This Week's Restart
ECHO 2 - Continue With Restart
ECHO.
SET /P ans=   Enter 1 or 2: 

::Go to Function Based on Response
if %ans% == 1 GOTO cancel
if %ans% == 2 GOTO cont

::Else is Re-enter Response
GOTO reenter
GOTO loop

::Function for Cancelling
:cancel
::Abort Restart
shutdown.exe /a

::Announce to User Restart is Cancelled
test&cls
ECHO --- --- --- --- --- ---
ECHO     REPLY
ECHO --- --- --- --- --- ---
ECHO Restart Postponed Until Next Saturday
ECHO.
pause
exit
:end

::Function for Restarting
:cont
test&cls
ECHO --- --- --- --- --- ---
ECHO     REPLY
ECHO --- --- --- --- --- ---
ECHO Restarting...
TIMEOUT 1800
::Initiate Restart 
shutdown.exe /r /t 1800
::Close Window
exit
:end

::Function for Re-entering Response
:reenter

::Announce to User About Re-entering Answer
test&cls
ECHO --- --- --- --- --- ---
ECHO     REPLY
ECHO --- --- --- --- --- ---
ECHO Please Enter 1 or 2
ECHO.

::Return to Loop
GOTO loop
:end
