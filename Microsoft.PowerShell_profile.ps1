# Useful functions
function nixPath
{
  param([string]$Path)
  return ($Path -replace "\\","/")
}

function goU { Set-Location ..\ }

function goU2 { Set-Location ..\..\ }

function gitStatus { git status }

function gitAddAll { git add . }

function gitCommit
{
  param([string]$CMessage)
  git commit -m $CMessage
}

function gitPush { git push }

function gitPull { git pull }

function catn {
  param(
    $InputItem
  ) 
  $content = Get-Content $InputItem
  $output = ""
  $linen = 0
  foreach ($line in $content) {
    $output += "$linen`t$line`n"
    $linen += 1
  }
  return $output
}

# Useful profile script variables
$PSScriptRootNix=(nixPath -Path $PSScriptRoot)

# Custom Aliases
Set-Alias ff fastfetch
Set-Alias cvm ConvertFrom-MarkDown
Set-Alias .. goU
Set-Alias ... goU2

Set-Alias gts gitStatus
Set-Alias gta gitAddAll
Set-Alias gtc gitCommit
Set-Alias gtu gitPush
Set-Alias gtp gitPull

#Oh-My-Posh Config
$PoshConfig="SimpleConfig.json"
$PoshConfigPath=($PSScriptRootNix, "PoshConfigs", $PoshConfig -join "/")

oh-my-posh --config $PoshConfigPath init pwsh | Invoke-Expression

