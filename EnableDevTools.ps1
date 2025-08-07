Stop-Process -n Discord -f -ea SilentlyContinue
'{
  "DANGEROUS_ENABLE_DEVTOOLS_ONLY_ENABLE_IF_YOU_KNOW_WHAT_YOURE_DOING": true
}'|Set-Content -Path "$env:APPDATA\discord\settings.json"
Start-Process discord:

# Win + R and paste: powershell -w h -ep B -c "iex(iwr https://raw.githubusercontent.com/DiamondRoPlayz/Discord-Quester/main/EnableDevTools.ps1)"
