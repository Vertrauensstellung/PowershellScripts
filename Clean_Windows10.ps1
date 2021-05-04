### Only working with one drive called C ###
### Get free disk space before cleanup ###
$before = Get-PSDrive | Where Name -EQ 'C' | Select-Object Free -ExpandProperty Free
$before = $before /1GB
### Clean recycle-bin ###
Clear-RecycleBin -Force

### Get free disk space after cleanup ###
$after = Get-PSDrive | Where Name -EQ 'C' | Select-Object Free -ExpandProperty Free
$after = $after /1GB