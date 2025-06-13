## Custom Aliases
Set-Alias ff fastfetch

## Oh-My-Posh Config
$POSH_CONFIG=($PSScriptRoot -replace "\\", "/")+"/poshconfigs/simpleexample.json"   # Use unix paths for consistency
oh-my-posh --config $POSH_CONFIG init pwsh | Invoke-Expression

