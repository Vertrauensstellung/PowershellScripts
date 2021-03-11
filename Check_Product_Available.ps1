### Link to the product ###
$url = 'https://www.amazon.de/dp/B084DWG2VQ'
### Invoke-WebRequest ###
$webresponse = Invoke-WebRequest -Uri $url
### Get classname from "inspect" in browser ###
$classname = 'a-size-medium a-color-success'
### Get the output but only select innertext ###
$innertext = $webresponse.ParsedHtml.body.getElementsByClassName($classname) | Select-Object -expand innertext
if($innertext -eq 'Auf Lager. ') {
   Write-Host "Auf Lager "
}else {
   Write-Host "Nicht auf Lager"
}