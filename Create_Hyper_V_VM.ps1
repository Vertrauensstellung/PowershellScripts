### Create VM with Hyper-V ###
### https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/try-hyper-v-powershell ###
### Insert Variables ###
$vmname = 'Windows001'
$isopath = 'C:\Users\Seal\Downloads\Windows2010.iso'
$cores = 4
### Create VM ###
New-VM -Name $vmname -MemoryStartupBytes 1024MB -Path $Env:USERPROFILE\HyperV\$vmname
### Create VHD ###
New-VHD -Path $Env:USERPROFILE\HyperV\$vmname.vhdx -SizeBytes 60GB -Dynamic
### Add VHD to VM ###
Add-VMHardDiskDrive -VMName $vmname -Path $Env:USERPROFILE\HyperV\$vmname.vhdx
### Set ISO as Startdrive ###
Set-VMDvdDrive -VMName $vmname -ControllerNumber 1 -Path $isopath
### Set Dynamic RAM ###
Set-VMMemory -VMName $vmname -DynamicMemoryEnabled $true -StartupBytes 1024MB -MinimumByte 1024MB
### Set cpu cores ###
Set-VMProcessor $vmname -Count $cores
### Start VM ###
Start-VM –Name $vmname
