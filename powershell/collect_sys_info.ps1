
echo "`n`n Desktop Info:  `n`n"
Get-CimInstance -ClassName Win32_Desktop
echo "`n`n"
echo "Bios Info: "
echo "`n`n"
get-ciminstance -ClassName Win32_Bios
echo "`n`n"
