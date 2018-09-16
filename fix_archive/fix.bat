@echo off
setlocal enableextensions enabledelayedexpansion
for /f "tokens=*" %%a in (main_path.txt) do (
		SET /a count = 0
		::List all folders
		for /f "tokens=*" %%G in ('dir /b /s /a:d "%%a*"') do  (
			set /a count += 1
			if !count! NEQ 1 (
				::copy fix file 1 to destination G  %%G\xxx\xx\xxx
				xcopy fix_file\fix1.txt %%G /y   
				::copy fix file 2 to destination G  %%G\xxx\xx\xxx
				xcopy fix_file\fix2.txt %%G /y  
				::copy fix file 3 to destination G  %%G\xxx\xx\xxx
				xcopy fix_file\fix3.txt %%G /y   
			)
		) 
)
endlocal
pause