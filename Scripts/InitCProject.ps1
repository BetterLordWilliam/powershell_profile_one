function _main-file-contents {
        
    }

function _make-file-contents {
        
    }

function new-c-project {
        new-item -type directory -name src 2> $null
        new-item -type directory -name build 2> $null
        new-item -type file -name makefile 2> $null
    }

