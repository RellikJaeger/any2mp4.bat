@echo off
powershell -c "Set-ExecutionPolicy RemoteSign -Scope CurrentUser; iwr -useb get.scoop.sh | iex"
pause
