$servernamelist = 'C:\Users\homer\Desktop\Patches\liste.csv'
$sourcelocation = 'C:\Users\homer\Desktop\Patches\'
$destinationlocation = 'C:\Users\homer\Desktop\Patches\'
$updatefilename = 'Windows8.1-KB3104002-x64.cab'
$logfile = 'log.txt'
$loglocation = $destinationlocation + $logfile
$FullFilePath = $sourcelocation + $updatefilename
$serverfiles = Get-Content -Path $servernamelist
ForEach ($server in $serverfiles) {
$session = New-PSSession -ComputerName $server
Copy-Item $sourcelocation -Destination $destinationlocation -Recurse -Force -ToSession $Session
    Invoke-Command -Session $session {
    Start-Transcript -Path $loglocation -NoClobber
    dism.exe /online /add-package /packagepath:$FullFilePath /quiet /norestart
    Remove-Item -LiteralPath $destinationlocation -Force -Recurse
    Stop-Transcript
}
}