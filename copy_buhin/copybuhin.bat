@echo off
setlocal enableextensions enabledelayedexpansion
for /f "tokens=*" %%a in (main_path.txt) do (
		::get domain path
		for /f "tokens=*" %%p in (domain_path.txt) do (
			::List all folders
			set /a count = 0
			for /f "tokens=*" %%G in ('dir /b /s /a:d "%%a*"') do  (
				set /a count += 1
				if !count! NEQ 1 (
					if exist %%G%%p (
					    ::copy all file in "copy_file" folder to subdomain folder
						for /f "tokens=*" %%f in ('dir /b /s /a "copy_file"') do  (
							xcopy copy_file\%%~nxf %%G%%p /y
						) 
					) else (
							echo domain path not exist
					)
				)
			)
		) 
)
endlocal
pause