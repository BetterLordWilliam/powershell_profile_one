# Simple prompt: Show just the current directory
# function prompt {
#     $p = Split-Path -leaf -path (Get-Location)
#     "$p> "
# }
#

## Custom Aliases
New-Alias ff fastfetch

## Use EPIC oh-my-posh
oh-my-posh init pwsh | Invoke-Expression

