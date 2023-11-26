Caps-Indicator -pause 250 -blinks 3

function Caps-Indicator {
    [CmdletBinding()]
    param (
    [Parameter (Mandatory = $True, ValueFromPipeline = $True)]
    [int]$blinks
    )

    $O=New-Object -ComObject WScript.Shell
    for($i = 1; $i -le $blinks * 2; $i++) {
        $o.SendKeys("{CAPSLOCK}");Start-Sleep -Milliseconds $pause
    }
}