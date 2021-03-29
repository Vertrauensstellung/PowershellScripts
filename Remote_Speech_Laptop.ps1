### Hostname to variable ###
$Computer = "hostname"
### Create Remote PSSession (Remote PS needs to be enabled) ###
New-PSSession -ComputerName $Computer
### Invoke command remote ###
Invoke-Command -ComputerName $Computer -ScriptBlock {Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.Speak("Remote command. Can you here me?")}