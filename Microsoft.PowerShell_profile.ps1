. "$PSScriptRoot\Environment.ps1"

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
    $output += "`t$linen  $line`n"
    $linen += 1
  }
  return $output
}

function Reload-Path {
  $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

function Clear-FastFetch {
  Clear-Host
  fastfetch.exe
}

function Get-CodeLineCount {
  param(
    [Parameter(Mandatory)]
    [Alias("E")]
    [string] $Extension,
    [Parameter(Mandatory = $false)]
    [Alias("L")]
    [string] $Location = $(Get-Location).Path
  )

  $totalLines = 0
  $targetItems = Get-ChildItem -Path $Location -Recurse
  $targetItems | Foreach-Object {
    if ( ( $_.Extension ) -and ( $_.Extension.Equals($Extension) -and ( $_ -is [System.IO.FileInfo] ) ) ){
      $totalLines += ( Get-Content $_.FullName ).Count # Number of lines
    }
  }

  return $totalLines;
}

function Start-Timer {
  param(
    [Parameter(Mandatory)]
    [Alias("D")]
    [int]$Duration
  )
  Start-ThreadJob -StreamingHost $Host -ScriptBlock {
    $i = ( $using:Duration )
    while ($i -ge 0) {
      Write-Host "$i"
      Start-Sleep -seconds 1
      $i--
    }
    Write-Host "`a"
  } | Wait-Job
}

function prompt {
        <#
            desired path
            user@computer:dir-leaf$

            $env:USERNAME
            $env:USERDOMAIN
        #>
        $path   = "$pwd"
        $uroot  = "C:\\Users\\$($env:USERNAME)"
        $reg    =  "^$uroot(?<trail>.*?)`$"
        if ( $pwd -match $reg ) {
                $path = "~" + ( $pwd -replace $reg, '${trail}')
            }
        return "`e[32m{0}@{1}`e[0m:`e[32m{2}`e[0m$ " -f `
            $env:USERNAME, `
            $env:USERDOMAIN, `
            $path
    }

# Useful profile script variables
$PSScriptRootNix=(nixPath -Path $PSScriptRoot)

# Custom Aliases
Set-Alias ff fastfetch.exe
Set-Alias ffc Clear-FastFetch

Set-Alias cvm ConvertFrom-MarkDown
Set-Alias .. goU
Set-Alias ... goU2

Set-Alias gts gitStatus
Set-Alias gta gitAddAll
Set-Alias gtc gitCommit
Set-Alias gtu gitPush
Set-Alias gtp gitPull

Set-Alias refreshenv Reload-Path
Set-Alias lines Get-CodeLineCount

Set-Alias cocker docker

Set-Alias sl sl.exe -Force

Set-Alias sd Switch-Desktop
Set-Alias nd New-Desktop

Set-Alias gt Get-ScheduledTask
Set-Alias st Set-ScheduledTask

Remove-Alias man <# why?? #>

#Oh-My-Posh Config
$PoshConfig="SimpleConfig.json"
$PoshConfigPath=($PSScriptRootNix, "PoshConfigs", $PoshConfig -join "/")

#oh-my-posh --config $PoshConfigPath init pwsh | Invoke-Expression

