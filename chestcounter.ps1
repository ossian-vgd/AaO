$clipboardContent = Get-Clipboard

Write-Output $clipboardContent 
$playerLookup = @{}
$playerLookup['brunhilde'] = "brunhilde"
$playerLookup['jeanmarie'] = "jeanmarie"
$playerLookup['Gintelis']  = "Gintelis"
$playerLookup['Tobur the Beekeeper'] = "Tobur the Beekeeper"
$playerLookup['MALO'] = "MALO"
$playerLookup['Tygopuro'] = "Tygopuro"
$playerLookup['Hossam Eid'] = "Hossam Eid"
$playerLookup['Ironstone'] = "Ironstone"
$playerLookup['Faros the Scarred'] = "Faros the Scarred"
$playerLookup['MrClean'] = "MrClean"
$playerLookup['Celeborn'] = "Celeborn"
$playerLookup['GRAND PA'] = "GRAND PA"
$playerLookup['Scorpion King'] = "Scorpion King"
$playerLookup['Gladiators Sword'] = "Gladiators Sword"
$playerLookup['Brainstorm'] = "Brainstorm"
$playerLookup['Lowefell'] = "Lowefell"
$playerLookup['Mklw 15'] = "Mklw 15"
$playerLookup['Eyvening'] = "Eyvening"
$playerLookup['Estforce'] = "Estforce"
$playerLookup['Fyudamon'] = "Fyudamon"
$playerLookup['Hagar Hirmus'] = "Hagar Hirmus"
$playerLookup['Tarn'] = "Tarn"
$playerLookup['Wolverine'] = "Wolverine"
$playerLookup['Finix EST'] = "Finix EST"
$playerLookup['Proxy Ergo'] = "Proxy Ergo"
$playerLookup['Nijael'] = "Nijael"
$playerLookup['Pijus Magnificus'] = "Pijus Magnificus"
$playerLookup['Dark Phoenix'] = "Dark Phoenix"
$playerLookup['Shadow'] = "Shadow"
$playerLookup['Alex the Anarchist'] = "Alex the Anarchist"
$playerLookup['Kebrimad'] = "Kebrimad"
$playerLookup['Hasonee'] = "Hasonee"
$playerLookup['Arashilabar'] = "Arashilabar"
$playerLookup['DRAGONASTUR'] = "DRAGONASTUR"
$playerLookup['Octavious'] = "Octavious"
$playerLookup['Elgin'] = "Elgin"
$playerLookup['BEN78'] = "BEN78"
$playerLookup['Opus'] = "Opus"
$playerLookup['Manabandis'] = "Manabandis"

$fromVal = ""
$sourceVal = ""
$array = $clipboardContent -split '\r?\n'
$csvfile = "C:\dev\chestcounts.csv"
foreach($item in $array){
#   Write-Output "shane: $item"
   if($item -match "(From: .*$)"){
      $val = $matches[0]
      $val = [regex]::Replace($val,"From: ","",1)
      $fromVal = [regex]::Replace($val,"Time.*$","",1)

      $asciiBytes = [Text.Encoding]::ASCII.GetBytes($fromVal)
      $asciiString = -join ($asciiBytes | foreach { [char]$_ })
      foreach ($key in $playerLookup.Keys){
         $fromCompare = $asciiString.ToLower()
         $playerCompare = $key.ToLower()
         Write-Output "Looking for player:$playerCompare in fromval:$fromCompare"
         if($fromCompare -contains $playerCompare){
            $fromVal = $key
            Write-Output "found a player:$fromVal"
         }
      }
      if($fromVal -eq ""){
         $fromVal = "MrClean"
      }
      Write-Output "from match:$fromVal"
   }
   if($item -match "(Source: .*$)"){
      $val = $matches[0]
      if($val -Contains "Level 35-39 Vault of the Ancients"){
         $val = "Level 35-39 Vault of the Ancients"
      }
      if($val -Contains "Level 45 Vault of the Ancients"){
         $val = "Level 45 Vault of the Ancients"
      }
      if($val -Contains "Level 40-44 Vault of the Ancients"){
         $val = "Level 40-44 Vault of the Ancients"
      }
      if($val -Contains "Union of Triumph personal reward"){
         $val = "Union of Triumph personal reward"
      }
      if($val -Contains "Mimic Chest"){
         $val = "Mimic Chest"
      }

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
