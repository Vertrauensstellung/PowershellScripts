### Stop Windows Update Service ###
net stop wuauserv
### Stop Explorer.exe ###
taskkill /f /im explorer.exe
### Change directory into Windows-Updates ###
cd C:\Windows\SoftwareDistribution
### Force delete everything ###
Remove-Item * -Force
### Restart to take effect ###
Restart-Computer -Force