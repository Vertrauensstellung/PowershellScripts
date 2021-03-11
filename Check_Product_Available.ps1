### Link to the product ###
$url = 'https://www.amazon.de/dp/B084DWG2VQ'
### Invoke-WebRequest ###
$webresponse = Invoke-WebRequest -Uri $url
### Get classname from "inspect" in browser ###
$classname = 'a-size-medium a-color-success'
### Get output but only select innertext ###
$innertext = $webresponse.ParsedHtml.body.getElementsByClassName($classname) | Select-Object -expand innertext
if($innertext -eq 'Auf Lager. ') {
   [System.Windows.Forms.MessageBox]::Show("Auf Lager","Produktverfügbarkeit",0)
}else {
   [System.Windows.Forms.MessageBox]::Show("Nicht auf Lager","Produktverfügbarkeit",0)
}