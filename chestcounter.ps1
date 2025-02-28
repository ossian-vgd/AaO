$clipboardContent = Get-Clipboard

Write-Output $clipboardContent 

$fromVal = ""
$sourceVal = ""
$array = $clipboardContent -split '\r?\n'
$csvfile = "C:\dev\chestcounts.csv"
foreach($item in $array){
#   Write-Output "shane: $item"
   if($item -match "(From: .*$)"){
      $val = $matches[0]
      $val = [regex]::Replace($val,"From: ","",1)
      $val = [regex]::Replace($val,".","",1)
      $val = [regex]::Replace($val,":","",1)
      $fromVal = [regex]::Replace($val," \S*Time.*$","",1)
#      Write-Output "from match:$val"
   }
   if($item -match "(Source: .*$)"){
      $val = $matches[0]
      $val = [regex]::Replace($val,"Source: ","",1)
      $val = [regex]::Replace($val,"Citadel.*","Citadel",1)
      $val = [regex]::Replace($val,"Arena.*","Arena",1)
      $val = [regex]::Replace($val,"Epic Inferno squad.*","Epic Inferno squad",1)
      $val = [regex]::Replace($val,"Clan wealth.*","Clan wealth",1)
      $sourceVal = [regex]::Replace($val,"Crypt.*","Crypt",1)
      $outline = '"'+$fromVal+'","'+$sourceVal+'"'
      Add-Content -Path $csvfile -Value $outline 
#      Write-Output "Source match:$val"
   }
   
}
exit 0
