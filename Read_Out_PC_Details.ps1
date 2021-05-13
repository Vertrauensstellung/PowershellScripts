### Read out pc specs ###
Write-Host Prozessor -ForegroundColor Green
Write-Host Festplatte -ForegroundColor Green
(Get-WmiObject -Class:Win32_ComputerSystem).Manufacturer
(Get-WmiObject -Class:Win32_ComputerSystem).SystemFamily
(Get-WmiObject -Class:Win32_ComputerSystem).Model
Write-Host Arbeitsspeicher -ForegroundColor Green
(Get-WmiObject -Class:Win32_ComputerSystem).TotalPhysicalMemory
(Get-WmiObject -Class:Win32_BIOS).SerialNumber