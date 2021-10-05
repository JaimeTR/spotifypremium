# Ignore errors from `Stop-Process`
$PSDefaultParameterValues['Stop-Process:ErrorAction'] = 'SilentlyContinue'

write-host @'
***************** 
@mrpond message:
Instagram: jaimetr_
Github: JaimeTR
***************** 
'@

write-host @'
***************** 
Author: @ JaimeTR
***************** 
'@

$SpotifyDirectory = "$env:APPDATA\Spotify"
$SpotifyExecutable = "$SpotifyDirectory\Spotify.exe"
$SpotifyApps = "$SpotifyDirectory\Apps"

Write-Host 'Deteniendo Spotify...'`n
Stop-Process -Name Spotify
Stop-Process -Name SpotifyWebHelper

if ($PSVersionTable.PSVersion.Major -ge 7) {
  Import-Module Appx -UseWindowsPowerShell
}

if (Get-AppxPackage -Name SpotifyAB.SpotifyMusic) {
  Write-Host @'
Se ha detectado la versión de Spotify de Microsoft Store que no es compatible.
'@`n
  $ch = Read-Host -Prompt "Desintalar la version de Spotify de Windows (Y/N) "
  if ($ch -eq 'y') {
    Write-Host @'
Desintalada la version de Spotify de Windows
'@`n
    Get-AppxPackage -Name SpotifyAB.SpotifyMusic | Remove-AppxPackage
  }
  else {
    Write-Host @'
Saliendo....
'@`n
    Pause 
    exit
  }
}

Push-Location -LiteralPath $env:TEMP
try {
  # Unique directory name based on time
  New-Item -Type Directory -Name "Spotifysinanuncios-$(Get-Date -UFormat '%Y-%m-%d_%H-%M-%S')" `
  | Convert-Path `
  | Set-Location
}
catch {
  Write-Output $_
  Pause
  exit
}

Write-Host 'Descargando el utlimo parche (chrome_elf.zip)...'`n
$webClient = New-Object -TypeName System.Net.WebClient
try {
  $webClient.DownloadFile(
    # Remote file URL
    'https://github.com/JaimeTR/Spotifysinanuncios/releases/latest/download/chrome_elf.zip',
    # Local file path
    "$PWD\chrome_elf.zip"
  )
}
catch {
  Write-Output $_
  Sleep
}
<#
try {
  $webClient.DownloadFile(
    # Remote file URL
    'https://github.com/JaimeTR/Spotifysinanuncios/files/5969916/zlink.zip',
    # Local file path
    "$PWD\zlink.zip"
  )
} catch {
  Write-Output $_
  Sleep
}
try {
  $webClient.DownloadFile(
    # Remote file URL
    'https://github.com/JaimeTR/Spotifysinanuncios/files/6234124/xpui.zip',
    # Local file path
    "$PWD\xpui.zip"
  )
} catch {
  Write-Output $_
  Sleep
}
#>
Expand-Archive -Force -LiteralPath "$PWD\chrome_elf.zip" -DestinationPath $PWD
Remove-Item -LiteralPath "$PWD\chrome_elf.zip"
<#
Expand-Archive -Force -LiteralPath "$PWD\zlink.zip" -DestinationPath $PWD
Remove-Item -LiteralPath "$PWD\zlink.zip"
Expand-Archive -Force -LiteralPath "$PWD\xpui.zip" -DestinationPath $PWD
Remove-Item -LiteralPath "$PWD\xpui.zip"
#>
$spotifyInstalled = (Test-Path -LiteralPath $SpotifyExecutable)
if (-not $spotifyInstalled) {
  Write-Host @'
No se detecto la instalacion nde Spotify.
Descargando la ultima version de Spotify, Espera por favor...
'@
  try {
    $webClient.DownloadFile(
      # Remote file URL
      'https://download.scdn.co/SpotifyFullSetup.exe',
      # Local file path
      "$PWD\SpotifyFullSetup.exe"
    )
  }
  catch {
    Write-Output $_
    Pause
    exit
  }
  mkdir $SpotifyDirectory >$null 2>&1
  Write-Host 'Ejecutando Instalacion...'
  Start-Process -FilePath "$PWD\SpotifyFullSetup.exe"
  Write-Host 'Deteniendo Spotify, otra vez...'
  while ((Get-Process -name Spotify -ErrorAction SilentlyContinue) -eq $null) {
    #waiting until installation complete
  }
  Stop-Process -Name Spotify >$null 2>&1
  Stop-Process -Name SpotifyWebHelper >$null 2>&1
  Stop-Process -Name SpotifyFullSetup >$null 2>&1
}

if (!(test-path $SpotifyDirectory/chrome_elf.dll.bak)) {
  move $SpotifyDirectory\chrome_elf.dll $SpotifyDirectory\chrome_elf.dll.bak >$null 2>&1
}

Write-Host 'Parcheando Spotify...'
$patchFiles = "$PWD\chrome_elf.dll", "$PWD\config.ini"
<#
$remup = "$PWD\zlink.spa"
$uipat = "$PWD\xpui.spa"
#>
Copy-Item -LiteralPath $patchFiles -Destination "$SpotifyDirectory"
<#
$ch = Read-Host -Prompt "Optional - Remove Upgrade Button. (Y/N) "
if ($ch -eq 'y'){
    move $SpotifyApps\zlink.spa $SpotifyApps\zlink.spa.bak >$null 2>&1
    Copy-Item -LiteralPath $remup -Destination "$SpotifyApps"
} else{
     Write-Host @'
Won't remove Upgrade Button.
'@`n
}
$ch = Read-Host -Prompt "Change Alpha UI back to Old UI. (BTS only supports Old UI). (Y/N) "
if ($ch -eq 'y'){
    move $SpotifyApps\xpui.spa $SpotifyApps\xpui.spa.bak >$null 2>&1
    Copy-Item -LiteralPath $uipat -Destination "$SpotifyApps"
} else{
     Write-Host @'
UI isn't changed.
'@`n
}
#>

$ch = Read-Host -Prompt "Opcional: elimine el marcador de anuncio y el botón de actualizacion a premium. (Experimental) (S/N) "
if ($ch -eq 'y') {
  Add-Type -Assembly 'System.IO.Compression.FileSystem'

  Copy-Item -Path "$SpotifyApps\xpui.spa" -Destination "$SpotifyApps\xpui.spa.bak"

  $zip = [System.IO.Compression.ZipFile]::Open("$SpotifyApps\xpui.spa", 'update')
  $entry = $zip.GetEntry('xpui.js')

  # Extract xpui.js from zip to memory
  $reader = New-Object System.IO.StreamReader($entry.Open())
  $xpuiContents = $reader.ReadToEnd()
  $reader.Close()

  # Replace ".ads.leaderboard.isEnabled" + separator - '}' or ')'
  # With ".ads.leaderboard.isEnabled&&false" + separator
  $xpuiContents = $xpuiContents -replace '(\.ads\.leaderboard\.isEnabled)(}|\))', '$1&&false$2'
    
  # Delete ".createElement(XX,{onClick:X,className:XX.X.UpgradeButton}),X()"
  $xpuiContents = $xpuiContents -replace '\.createElement\([^.,{]+,{onClick:[^.,]+,className:[^.]+\.[^.]+\.UpgradeButton}\),[^.(]+\(\)', ''
    
  # Rewrite it to the zip
  $writer = New-Object System.IO.StreamWriter($entry.Open())
  $writer.BaseStream.SetLength(0)
  $writer.Write($xpuiContents)
  $writer.Close()

  $zip.Dispose()
}
else {
  Write-Host @'
No eliminará el marcador de posición del anuncio ni el botón de actualización.
'@`n
}

$tempDirectory = $PWD
Pop-Location

Remove-Item -Recurse -LiteralPath $tempDirectory  

Write-Host 'Parche Completado, Iniciando Spotify...'
Start-Process -WorkingDirectory $SpotifyDirectory -FilePath $SpotifyExecutable
Write-Host 'Done.'

write-host @'
***************** 
@mrpond message:
Instagram: jaimetr_
Github: JaimeTR
***************** 
'@

exit