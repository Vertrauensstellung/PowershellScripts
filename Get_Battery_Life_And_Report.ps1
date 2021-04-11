function Measure-BatteryCapacity {
    [CmdletBinding()]
    param (
        [parameter(DontShow = $true)]
        $batteries = (Get-WmiObject -Class "BatteryStatus" -Namespace "ROOT\WMI"),

        [parameter(DontShow = $true)]
        $winProductName = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name ProductName).ProductName,

        [parameter(DontShow = $true)]
        $lowestAllowableBattCap = "68",

        [parameter(DontShow = $true)]
        $currentBattery = 0,

        [parameter(DontShow = $true)]
        $replaceBatteryCount = 0
    )
    
    begin {
        ### Set Initial Battery Replacement Status ###
        $ReplaceBattery = $false 
    }
    
    process {
        ### If there is a battery,check each battery ###
        if ((Get-WmiObject -Class Win32_Battery).count -ne 0){
            foreach ($battery in $batteries) {
                $designedCapacity = (Get-WmiObject -Class "BatteryStaticData" -Namespace "ROOT\WMI").DesignedCapacity[$currentBattery]
                $fullCharge = (Get-WmiObject -Class "BatteryFullChargedCapacity" -Namespace "ROOT\WMI").FullChargedCapacity[$currentBattery]
                $batteryDeviceID = (Get-WmiObject -Class Win32_Battery).Name
                $batteryDeviceID = $batteryDeviceID.split(" ")[$currentBattery]

                ### Make sure battery is not over 100% ###
                $currentBatteryCapacity = ($FullCharge / $DesignedCapacity) * 100
                if ($currentBatteryCapacity -gt 100) {
                    $currentBatteryCapacity = 100
                }
                ### Round battery percentage ###
                $currentBatteryCapacity = [decimal]::round($currentBatteryCapacity)

                ### Compare current capacity to lowest allowable ###
                if ([int]$currentBatteryCapacity -le [int]$lowestAllowableBattCap) {
                    Write-Host "Battery[$CurrentBattery][Serial:$batteryDeviceID] capacity is at $($currentBatteryCapacity)%." -ForegroundColor Red
                    $replaceBatteryCount++
                    $replaceBattery = $true
                }
                
                ### Change current battery to next ###
                $currentBattery++        
            }
        }
    }
    
    end {
        ### Windows OS/replace battery count Switch ###
        if ($replaceBattery){
            switch -Wildcard ($replaceBatteryCount,$winProductName) {
                "1" {Write-Host "A New battery may be needed" -ForegroundColor Red ; continue}
                "2" {Write-Host "New battery(s) may be needed" -ForegroundColor Red ; continue}
                "*10*" {POWERCFG -batteryreport -output "$home\desktop\battery-report.html" ; break}
                "*7*" {POWERCFG -ENERGY -OUTPUT "$home\desktop\battery-report.html" ; break}
                default {"Unknown Operating System"}
            }
        }else {
            Write-Host "All batterie(s) are within allowable percentage" -ForegroundColor Green
        }
    }
}
### Start function ###
Measure-BatteryCapacity
### Output batteryreport to Appdata-Roaming ###
powercfg /batteryreport /output "$env:APPDATA\$env:ComputerName-$env:UserName-battery.html"