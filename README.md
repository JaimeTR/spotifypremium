<p align="center">
  <h1 align="center">SpotifyPremium by JaimeTR 🎵</h1>
</p>

<p align="center">
  <a href="https://github.com/JaimeTR/spotifypremium"><img src="https://img.shields.io/badge/version-1.2.95-blue"></a>
  <a href="https://discord.gg/kDYXfJsx4T"><img src="https://img.shields.io/badge/Discord-Join-5865F2"></a>
  <a href="https://github.com/JaimeTR/spotifypremium/blob/main/LICENSE"><img src="https://img.shields.io/badge/license-MIT-green"></a>
</p>

<h2>
  <div align="center">
    <b>Parcheador para Spotify Desktop en Windows</b>
  </div>
</h2>

<p align="center">
  <b>Elimina anuncios, activa funciones experimentales y personaliza tu experiencia de Spotify</b>
</p>

<p align="center"> •
  <a href="#requisitos">Requisitos</a> •
  <a href="#caracteristicas">Caracteristicas</a> •
  <a href="#instalacion">Instalacion</a> •
  <a href="#parametros">Parametros</a> •
  <a href="#desinstalar">Desinstalar</a> •
  <a href="#preguntas-frecuentes">FAQ</a> •
  <a href="#descargo-de-responsabilidad">Disclaimer</a>
</p>

---

<h1 id="requisitos">📋 Requisitos</h1>

- **SO:** Windows 7, 8, 8.1, 10, 11
- **Spotify:** [Version oficial de escritorio](https://www.spotify.com/download/windows/) (No sirve la version de Microsoft Store)
- **PowerShell:** 5.1 o superior (viene con Windows)

<h1 id="caracteristicas">🚀 Caracteristicas</h1>

- **Bloquea todos los anuncios** — banners, videos y audio ads
- **Oculta podcasts, episodios y audiolibros** de la pagina principal (opcional)
- **Bloquea las actualizaciones automaticas** de Spotify (opcional)
- **Activa funciones experimentales** como ecualizador, barra lateral derecha, letras, etc.
- **Deshabilita el envio de telemetria y analiticas**
- **Tema nuevo o clasico** — elige entre la UI moderna o la clasica (v1.2.13)
- **Colores estaticos para las letras** de canciones (27 temas disponibles)
- **Oculta secciones publicitarias** de la pagina principal
- **Modo desarrollador** — activa las herramientas de desarrollo de Spotify
- **Sin anuncios en podcast** (modo premium)

<h1 id="instalacion">📥 Instalacion / Actualizacion</h1>

### Opcion 1: Instalacion normal (tema nuevo)

Descarga y ejecuta **[Install_New_theme.bat](Install_New_theme.bat)**

O en PowerShell (como administrador):

```ps1
iex "& { $(iwr -useb 'https://raw.githubusercontent.com/JaimeTR/spotifypremium/main/run.ps1') } -new_theme"
```

### Opcion 2: Instalacion completa automatica

Descarga y ejecuta **[Install_Auto.bat](scripts/Install_Auto.bat)**

O en PowerShell:

```ps1
iex "& { $(iwr -useb 'https://raw.githubusercontent.com/JaimeTR/spotifypremium/main/run.ps1') } -confirm_uninstall_ms_spoti -confirm_spoti_recomended_over -podcasts_off -block_update_on -start_spoti -new_theme -adsections_off -lyrics_stat spotify"
```

### Opcion 3: Para usuarios Premium (sin bloqueo de anuncios)

Descarga y ejecuta **[Install_Prem.bat](scripts/Install_Prem.bat)**

### Opcion 4: Tema antiguo (v1.2.13)

Si prefieres la interfaz clasica de Spotify, descarga y ejecuta **[Install_Old_theme.bat](Install_Old_theme.bat)**

---

<h1 id="parametros">⚙️ Parametros avanzados</h1>

Puedes combinar multiples parametros al ejecutar el script:

| Parametro | Descripcion |
|-----------|-------------|
| `-new_theme` | Activa el nuevo tema (barras laterales modernas) |
| `-podcasts_off` | Oculta podcasts, episodios y audiolibros |
| `-block_update_on` | Bloquea las actualizaciones automaticas |
| `-adsections_off` | Oculta secciones similares a anuncios |
| `-lyrics_stat <color>` | Color estatico para las letras |
| `-premium` | Modo premium (solo desactiva anuncios en podcasts) |
| `-devtools` | Activa herramientas de desarrollo |
| `-cache_limit <MB>` | Limite de cache (500-20000 MB) |
| `-start_spoti` | Abre Spotify al finalizar |
| `-no_shortcut` | No crear acceso directo en el escritorio |
| `-v <version>` | Forzar una version especifica de Spotify |

Colores disponibles para `-lyrics_stat`: `blue`, `discord`, `forest`, `github`, `orange`, `purple`, `red`, `spotify`, `yellow` y muchos mas.

<h1 id="desinstalar">🗑️ Desinstalar</h1>

1. Ejecuta **[Uninstall.bat](Uninstall.bat)** (restaura los archivos originales)
2. O reinstala Spotify desde cero

<h1 id="preguntas-frecuentes">❓ Preguntas frecuentes</h1>

**¿Funciona con la version de Microsoft Store?**  
No. Solo funciona con la version de escritorio oficial desde [spotify.com](https://www.spotify.com/download/windows/).

**¿Spotify se actualizara y perdera el parche?**  
Si activas el bloqueo de actualizaciones (`-block_update_on`), Spotify no se actualizara y el parche seguira funcionando.

**¿Es seguro?**  
El script modifica archivos locales de Spotify en tu PC. No roba cuentas ni datos. Usalo bajo tu propio riesgo.

**¿Funciona con Spicetify?**  
Spicetify debe instalarse **despues** de SpotifyPremium para que ambos funcionen correctamente.

**¿Por que mi antivirus lo detecta como amenaza?**  
Es un falso positivo. El script usa PowerShell para modificar archivos, y algunos antivirus detectan esto heuristicamente como sospechoso. Agrega exclusiones en tu antivirus.

<h1 id="descargo-de-responsabilidad">⚖️ Descargo de responsabilidad</h1>

SpotifyPremium es una herramienta que modifica el cliente oficial de Spotify, proporcionada como version de evaluacion. No estoy afiliado ni respaldado por Spotify AB. Usala bajo tu propio riesgo.

---

<p align="center">
  <b>Creado por <a href="https://github.com/JaimeTR">@JaimeTR</a></b>
</p>
