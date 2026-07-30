@echo off

:: Line for changing SpotifyPremium parameters, each parameter should be separated by a space
set param=-confirm_uninstall_ms_spoti -confirm_spoti_recomended_over -podcasts_off -block_update_on -start_spoti -new_theme -adsections_off -lyrics_stat spotify -no_pause

set url='https://raw.githubusercontent.com/JaimeTR/spotifypremium/main/run.ps1'
set url2='https://raw.githubusercontent.com/JaimeTR/spotifypremium/main/run.ps1'
set tls=[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12;

%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe ^
-Command %tls% $p='%param%'; """ & { $(try { iwr -useb %url% } catch { $p+= ' -m'; iwr -useb %url2% })} $p """" | iex

pause
exit /b
