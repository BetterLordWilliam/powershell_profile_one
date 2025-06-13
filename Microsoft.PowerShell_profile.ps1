## Custom Aliases
Set-Alias ff fastfetch

## Oh-My-Posh Config
$POSH_CONFIG="SimpleConfig.json"
$POSH_CONFIG_PATH=($PSScriptRoot -replace "\\", "/"), "PoshConfigs", $POSH_CONFIG -join "/"
oh-my-posh --config $POSH_CONFIG_PATH init pwsh | Invoke-Expression

