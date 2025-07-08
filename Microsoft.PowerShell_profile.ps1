# Useful functions
function nixPath
{
  param([string]$Path)
  return ($Path -replace "\\","/")
}
function goU { Set-Location ..\ }

function gitStatus { git status }
function gitAddAll { git add . }
function gitCommit
{
  param([string]$CMessage)
  git commit -m $CMessage
}
function gitPush { git push }

# Useful profile script variables
$PSScriptRootNix=(nixPath -Path $PSScriptRoot)

# Custom Aliases
Set-Alias ff fastfetch
Set-Alias .. goU

Set-Alias gts gitStatus
Set-Alias gta gitAddAll
Set-Alias gtc gitCommit
Set-Alias gtu gitPush

# Oh-My-Posh Config
$PoshConfig="SimpleConfig.json"
$PoshConfigPath=($PSScriptRootNix, "PoshConfigs", $PoshConfig -join "/")
oh-my-posh --config $PoshConfigPath init pwsh | Invoke-Expression

