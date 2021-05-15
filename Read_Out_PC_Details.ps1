### Read out pc specs ###
Write-Host PC-Info -ForegroundColor Green
(Get-WmiObject -Class:Win32_ComputerSystem).Manufacturer
(Get-WmiObject -Class:Win32_ComputerSystem).SystemFamily
(Get-WmiObject -Class:Win32_ComputerSystem).Model
(Get-WmiObject -Class:Win32_BIOS).SerialNumber
Write-Host CPU -ForegroundColor Green
(Get-WmiObject -Class Win32_Processor).Name
Write-Host Drive -ForegroundColor Green
(Get-WmiObject -class win32_logicaldisk).Size / 1GB
(Get-WmiObject -class win32_logicaldisk).VolumeSerialNumber
Write-Host RAM -ForegroundColor Green
(Get-WmiObject -Class:Win32_ComputerSystem).TotalPhysicalMemory / 1GB