## Useful profile script variables
$PSScriptRootNix=($PSScriptRoot -replace "\\", "/")

## Custom Aliases
Set-Alias ff fastfetch

## Oh-My-Posh Config
$PoshConfig="SimpleConfig.json"
$PoshConfigPath=($PSScriptRootNix, "PoshConfigs", $PoshConfig -join "/")
oh-my-posh --config $PoshConfigPath init pwsh | Invoke-Expression

