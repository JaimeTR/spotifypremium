@echo off
powershell -Command "& {Invoke-WebRequest -UseBasicParsing 'https://raw.githubusercontent.com/JaimeTR/Spotifysinanuncios/master/install.ps1' | Invoke-Expression}"
pause
exit