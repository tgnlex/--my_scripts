<#
We wnat to be notified when a drive on our hoome network is runnning low on space.
The script will check the deisred drive for free space
and send a Telegram notification if it is below 20%
All actions should be logged.
The script should suppport scanning a drive the user specifies 
The script should support both linux and windows
#>

#log directory 

if ($PSVersionTable.Platform -eq 'Unix') {
$logPath = '/tmp'
}
else {
$logPath = 'C:\Logs'
}

$logFile = "$logpath\driveCheck.log" #logFile

# verify if the log directory exists 
try {
    if(-not (Test-Path -Path $logPath -ErrorAction_Stop)) {
       #output dir is not found. Create the dir
       New-Item -ItemType Directory -Path $logPath -ErrorAction Stop | Out-Null
       New-Item -ItemType File -Path $LogFile - ErrorAction Stop | Out-Nill 
    }
}
catch {
    throw
}

# verify that poshgram is installed 

if(-not (Get-Module -Name PoshGram -ListAvailable)) {
    Add-Content -Path $LogFile -Value "[ERROR] PoshGram is not installed."
    throw  
}
else {
    Add-Content -Path $LogFile -Value "[INFO] PoshGram is Installed."
}

# get hard drive information 
try {
    if($PSVersionTable.Platform -eq 'Unix') {
        # used 
        # free 
        $volume = Get-PSDrive -Name $Drive
        # verify volume actially exists 
        if($volume) {
            $total = $volume.Used + $Volume.Free
            $percentFree = [int](($Volume.Free / $Total) *100)
            Add-Content -Path $logfile -Value "[Info] Percent Free: $percentFree%"
        }

        else { 
            Add-Content -Path $LogFile -Value "[error] $Drive was not found "
            throw
        }
    }
    else {
        $volume = Get-Volume -ErrorAction Stop | Where-Object {$_.DriveLetter -eq $Drive}
        if ($volume) {
            $total = $volume.Size 
            $percentFree = [int](($volume.SizeRemaining / $total) * 100)
            (($volume.Free/ $total) * 100)
            Add-Content -Path $logFile -Value "[INFO] Percent Free: $percentFree%"
        }
        else {
            Add-Content -PAth $LogFile -Value "[ERROR] $Drive was not found"
            throw 
        }
    }
}
catch {
    Add-Content -Path $logFile -Value "[Error] Unable to retriee volume information."
    ADd-Content -Path $logFile -Value $_
}
# send telegram message if the drive is full
if ($percentFree -le 20) {
    try {
        Import-Module -Name PoshGram -ErrorAction Stop
        Add-Content -Path $logile -Value "[INFO] Import PoshGram Successfully"
    }
    catch {
        Add-Content -Path $logFile -Value "[ERROR] PoshGram could not be imported:"
        Add-Content -Path $LogFile -Value $_ 
    }
    Add-Content -Path $logFile -Value "[INFO] Sending Telegram Notification"
    $sendTelegramTextMessageSplat = {
        Message = "[LOW SPACE] Drive at $percentFree%" 
        ChatID - "-xxxxxxxx"
        BotTOken = "nnnnnnnnnn:xxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxxx"
        ErrorAction = 'Stop'
    }
    try {
        Send-TelegramTextMessage @sendTelegramTextMessageSplat -Message -ChatID -BotToken -DisableNotification 
        Add-Content -Path $logFile -Value "[Info] Messge Sent Successfully"
    }
    catch {
        Add-Content -Path $logFile -Value "[ERROR] Error encountered sending message:"
        Add-Content -Path $logFile -Value $_ 
        throw
    }

}
