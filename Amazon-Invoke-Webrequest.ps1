### Create Array with amazon links ###
$array = @(
"https://www.amazon.de/dp/B08H93ZRK9/"
"https://www.amazon.de/dp/B08B44H982/"
"https://www.amazon.de/dp/B09665SDBK/"
"https://www.amazon.de/dp/B07W7KFFFF/"
)

### Loop every link ###
foreach($link in $array){
### Get WebRequest ###
$request = Invoke-WebRequest -Uri $link
### Get Status ###
$prodstatus = $request.ParsedHtml.getElementById("availability") | Select-Object textContent -ExpandProperty textContent
### Get Name ###
$prodname = $request.ParsedHtml.getElementById("productTitle") | Select-Object textContent -ExpandProperty textContent
### Get Price ###
$prodprice = $request.ParsedHtml.getElementById("priceblock_ourprice") | Select-Object textContent -ExpandProperty textContent
### If depending in stock ###
if ($prodstatus -eq 'Auf Lager. ')
{Write-Host "In Stock for" $prodprice : $prodname $link}
else{Write-Host "Not in Stock": $prodname $link}
}

<#
$pricewoeuro = $prodprice.Substring(0,$prodprice.Length-2)
if($pricewoeuro -lt "300,00"){Write-Host "Nah du"}
#>