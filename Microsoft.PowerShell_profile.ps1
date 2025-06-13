## Custom Aliases
Set-Alias ff fastfetch

## Use EPIC oh-my-posh
$POSH_CONFIG=($PSScriptRoot -replace "\\", "/")+"/poshconfigs/simpleexample.json"
Write-Host $POSH_CONFIG
oh-my-posh --config $POSH_CONFIG init pwsh | Invoke-Expression

