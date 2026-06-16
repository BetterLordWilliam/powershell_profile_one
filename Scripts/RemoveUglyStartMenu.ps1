$ppath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer'
$pname = 'NoStartMenuMorePrograms' 

function set-nostartmenumoreprograms {
        <# If this thing throws an error, it means likely that the property is defined #>
        <# So just set it to 1 #>
        New-ItemProperty `
            -path $ppath `
            -name $pname `
            -value 1 `
            -propertytype 'DWord' || `
        Set-ItemProperty `
            -path $ppath `
            -name $pname `
            -value 1
    }

function get-nostartmenumoreprograms {
        Get-ItemProperty `
            -path $ppath `
            -name $pname `
    }

set-alias "snosmp" set-nostartmenumoreprograms
set-alias "gnosmp" get-nostartmenumoreprograms

try {
    set-nostartmenumoreprograms
    echo "Set the value of NoStartMenuMorePrograms to 1"
} catch {
    echo "Could not create or set NoStartMenuMorePrograms"
}

