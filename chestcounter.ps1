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
$playerLookup['canayanochin'] = "canayanochin"
$playerLookup['Bernoden'] = "Bernoden"
$playerLookup['Otto The Orange'] = "Otto The Orange"
$playerLookup['Elektramagnetic'] = "Elektramagnetic"
$playerLookup['Steelsinger'] = "Steelsinger"
$playerLookup['Tojabar'] = "Tojabar"
$playerLookup['x 4L13N x'] = "x 4L13N x"
$playerLookup['Kawasaki'] = "Kawasaki"
$playerLookup['Gremidren'] = "Gremidren"
$playerLookup['OssianMoMoney'] = "OssianMoMoney"
$playerLookup['ORCA'] = "ORCA"
$playerLookup['Genghis Khan'] = "Genghis Khan"
$playerLookup['StefanoDoc'] = "StefanoDoc"
$playerLookup['Fiegleyl'] = "Fiegleyl"
$playerLookup['Ananaya'] = "Ananaya"
$playerLookup['Nono'] = "Nono"
$playerLookup['Elgin'] = "Elgin"
$playerLookup['MadKarlgen'] = "MadKarlgen"
$playerLookup['puraviq'] = "puraviq"
$playerLookup['Foin'] = "Foin"
$playerLookup['Hefaistos DK'] = "Hefaistos DK"
$playerLookup['Marsha'] = "Marsha"
$playerLookup['Deldrien'] = "Deldrien"
$playerLookup['Firlefanz'] = "Firlefanz"
$playerLookup['Hulk'] = "Hulk"
$playerLookup['RATC'] = "RATC"
$playerLookup['Dagdarim'] = "Dagdarim"
$playerLookup['Finginad'] = "Finginad"

$fromVal = ""
$sourceVal = ""
$array = $clipboardContent -split '\r?\n'
$csvfile = "C:\dev\chestcounts.csv"
foreach($item in $array){
#   Write-Output "shane: $item"
   if($item -match "(From: .*$)"){
      $val = $matches[0]
      $val = [regex]::Replace($val,"From: ","",1)
 #     $fromVal = [regex]::Replace($val,"Time.*$","",1)
      $fromVal = $val.Trim()

      $asciiBytes = [Text.Encoding]::ASCII.GetBytes($fromVal)
      $fromCompare = -join ($asciiBytes | foreach { [char]$_ })
      foreach ($key in $playerLookup.Keys){
         Write-Output "Looking for player:$playerCompare in fromval:$fromCompare"
         if($fromCompare -match "(?i)$key"){
            $fromVal = $key
            Write-Output "found a player:$fromVal"
         }
      }
      if($fromVal -Match "(?i)x 4L43N"){
         $fromVal = "x 4L13N x"
      }
      if($fromVal -Match "(?i)x 4L3N"){
         $fromVal = "x 4L13N x"
      }
      if($fromVal -Match "(?i)X ALI3N"){
         $fromVal = "x 4L13N x"
      }
      if($fromVal -Match "(?i)Ob.lix"){
         $fromVal = "Oblix"
      }
      Write-Output "from match:$fromVal"
   }
   if($item -match "(Source: .*$)"){
      $val = $matches[0]
      if($val -match "(?i)Level 35-39 Vault of the Ancients"){
         $val = "Level 35-39 Vault of the Ancients"
      }
      if($val -match "(?i)Level 45 Vault of the Ancients"){
         $val = "Level 45 Vault of the Ancients"
      }
      if($val -match "(?i)Level 40-44 Vault of the Ancients"){
         $val = "Level 40-44 Vault of the Ancients"
      }
      if($val -match "(?i)Union of Triumph personal reward"){
         $val = "Union of Triumph personal reward"
      }
      if($val -match "(?i)Mimic Chest"){
         $val = "Mimic Chest"
      }
      if($val -match "(?i)Level 19 heroic Monster"){
         $val = "Level 19 heroic Monster"
      }
      if($val -match "(?i)Level 20 heroic Monster"){
         $val = "Level 20 heroic Monster"
      }
      if($val -match "(?i)Level 24 heroic Monster"){
         $val = "Level 24 heroic Monster"
      }
      if($val -match "(?i)Level 25 heroic Monster"){
         $val = "Level 25 heroic Monster"
      }
      if($val -match "(?i)Level 27 heroic Monster"){
         $val = "Level 27 heroic Monster"
      }
      if($val -match "(?i)Level 28 heroic Monster"){
         $val = "Level 28 heroic Monster"
      }
      if($val -match "(?i)Level 29 heroic Monster"){
         $val = "Level 29 heroic Monster"
      }
      if($val -match "(?i)Level 33 heroic Monster"){
         $val = "Level 33 heroic Monster"
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
#sleep(100000)
exit 0
