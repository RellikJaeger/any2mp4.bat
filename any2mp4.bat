@echo off
if [%1] neq [] (
	set input=%1
	:: if [%2] neq [] (
	for /f "delims=" %%i in ("%input%") do (
		set file_drive=%%~di
		set file_path=%%~pi
		set file_name=%%~ni
		set file_extension=%%~xi
	)
	set output="%file_name%.mp4"
	:: set output=%2
	set flag=0
	goto Encoding
)

:x
cls
:: title Any video format to MP4 Converter by Rellik Jaeger
:: color 02
echo.
echo   [Any video format to MP4 Converter by Rellik Jaeger]
echo.
set /p input=- Input: 
if %errorlevel% neq 0 (
	echo.
	echo   ERROR: Input not found!
	echo.
	goto ERROR
)
for /f "delims=" %%i in ("%input%") do (
set file_drive=%%~di
set file_path=%%~pi
set file_name=%%~ni
set file_extension=%%~xi
)
echo.
:: set /p output=- Output: 
set output="%file_name%.mp4"
if %errorlevel% neq 0 (
	echo.
	echo   ERROR: Output not found!
	echo.
	goto ERROR
)
set flag=1
:Encoding
echo.
echo   Converting...
echo.
ffmpeg -y -i %input% -c copy -copyts %output%>nul

if %errorlevel% neq 0 (
	ffmpeg -y -i "%input%" -c copy -copyts "%output%">nul
	if %errorlevel% neq 0 (
		echo.
		echo   ERROR!
		echo.
		goto ERROR
	)
)

cls
if %flag%==0 goto QUIT
goto x

:ERROR
pause
goto QUIT

:QUIT
:: title C:\Windows\system32\cmd.exe
:: color 0f
cls
exit /b 1


  :: Rellik Jaeger

