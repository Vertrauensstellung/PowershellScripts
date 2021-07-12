### iexplorer.exe 2012 R2 Fix ###
New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\' -Name FEATURE_ENABLE_PRINT_INFO_DISCLOSURE_FIX  –Force
Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ENABLE_PRINT_INFO_DISCLOSURE_FIX" | New-ItemProperty -Name iexplore.exe -Value 1

New-Item -Path 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\' -Name FEATURE_ENABLE_PRINT_INFO_DISCLOSURE_FIX  –Force
Get-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ENABLE_PRINT_INFO_DISCLOSURE_FIX" | New-ItemProperty -Name iexplore.exe -Value 1