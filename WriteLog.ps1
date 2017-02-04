function WriteLog ($str, $log_path){
    if(-not(Test-Path -Path $log_path)){
        try{New-Item -Path $log_path -ItemType file -ErrorAction Stop -Force| Out-Null}catch{Write-Host "FATAL ERROR:" $_.Exception.Message; Exit}
    }
   $now = (Get-date).ToString()
   "$now,$str" | Add-Content -Path $log_path
}

#Usage Example:
WriteLog "Start installations" "c:\logs\logfile.log"
