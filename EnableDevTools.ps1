Stop-Process -Name Discord -Force
'{
  "DANGEROUS_ENABLE_DEVTOOLS_ONLY_ENABLE_IF_YOU_KNOW_WHAT_YOURE_DOING": true
}'|Set-Content -Path "$env:APPDATA\discord\settings.json"
"DevTools enabled."

# Win + R and paste: powershell -w h -ep B -c "iex(iwr https://raw.githubusercontent.com/DiamondRoPlayz/Discord-Quester/main/EnableDevTools.ps1)"
