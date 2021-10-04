[![Build status](https://ci.appveyor.com/api/projects/status/31l6ynm0a1fhr2vs/branch/master?svg=true)](https://ci.appveyor.com/project/JaimeTR/spotifysinanuncios/branch/master)  [![Discord](https://discord.com/api/guilds/807273906872123412/widget.png)](https://discord.gg/)


<center>
    <h1 align="center">Spotify sin Anuncios</h1>
    <h4 align="center">Bloqueador de anuncios multipropósito y omisión para la aplicación de Spotify de <strong>Windows</strong></h4>
    <h5 align="center">Apoya a Spotify comprando Premium</h5>
    <p align="center">
        <strong>Última actualización:</strong> 4 Octubre 2021<br>
        <strong>Última versión probada:</strong> v1.0
    </p> 
</center>

#### Comprobaciones importantes antes de la instalación:
1. Actualiza Windows, actualiza Spotify y actualiza Spotifysinanuncios
2. Vaya a "Seguridad de Windows" -> "Protección contra virus y amenazas"
3. Haga clic en "Amenazas permitidas" -> "Eliminar todas las amenazas permitidas"

### Características:
* Bloquea todos los anuncios de banner / video / audio dentro de la aplicación
* Conserva la funcionalidad de amigo, video vertical y radio
* Desbloquea la función de salto para cualquier pista
* Ahora es compatible con la nueva versión Alpha (Nueva interfaz de usuario)

:warning: Este mod es solo para la [**Aplicacion de escritorio**](https://www.spotify.com/download/windows/) de Spotify en Windows y no para la versión de **Microsoft Store**.

### Instalación / Actualización:
* Simplemente descargue y ejecute [Spotifysinanuncios.bat](https://raw.githack.com/mrpond/BlockTheSpot/master/BlockTheSpot.bat)  

o

* Ejecute el siguiente comando en PowerShell:
```ps1
Invoke-WebRequest -UseBasicParsing 'https://raw.githubusercontent.com/JaimeTR/Spotifysinanuncios/main/install.ps1' | Invoke-Expression
```

o

1. Busque su carpeta de instalación de Spotify `%APPDATA%\Spotify`
2. Descarga  `chrome_elf.zip` de [releases](https://github.com/JaimeTR/Spotifysinanuncios/releases)
3. Unzip and replace `chrome_elf.dll` and `config.ini` 

### Uninstall:
* Just run uninstall.bat
or
* Reinstall Spotify 

### Known Issues:  
* You may face issue [#150](https://github.com/mrpond/BlockTheSpot/issues/150). Can be fixed by enabling the experimental feature when using `BlockTheSpot.bat`.    
* We support last 2 version of Spotify (latest + previous) only. Please check it before opening an issue.

### Additional Notes:  
* Remove "Upgrade" Button [#83](https://github.com/mrpond/BlockTheSpot/issues/83) and Remove "Ad Placeholder" [#150](https://github.com/mrpond/BlockTheSpot/issues/150) only works when you use any of the auto installation methods and press `y` when prompted.  
* "chrome_elf.dll" gets replaced by the Spotify installer each time it updates, hence why you'll probably need to apply the patch again when it happens
* [Spicetify](https://github.com/khanhas/spicetify-cli) users will need to reapply BlockTheSpot after applying a Spicetify patches.
* If the automatic install/uninstall scripts do not work, please contact [Nuzair46](https://github.com/Nuzair46)
* For more support and discussions, join our [Discord server](https://discord.gg/p43cusgUPm) 
