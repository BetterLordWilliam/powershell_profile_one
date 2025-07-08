# Useful functions
function nixPath
{
  param([string]$Path)
  return ($Path -replace "\\","/")
}
function goU { Set-Location ..\ }

## Git functions
function gitAddAll { git add . }

# Useful profile script variables
$PSScriptRootNix=(nixPath -Path $PSScriptRoot)

# Custom Aliases
Set-Alias ff fastfetch
Set-Alias .. goU

Set-Alias ga gitAddAll

# Oh-My-Posh Config
$PoshConfig="SimpleConfig.json"
$PoshConfigPath=($PSScriptRootNix, "PoshConfigs", $PoshConfig -join "/")
oh-my-posh --config $PoshConfigPath init pwsh | Invoke-Expression

