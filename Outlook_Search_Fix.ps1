$command1 = 'reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Search" /v "DisableServerAssistedSearch" /t REG_DWORD /d 1 /f'
$command2 = 'reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Search" /v "DisableServerAssistedSuggestions" /t REG_DWORD /d 1 /f'
$TaskName = "OutlookSearchFix"
$Trigger = New-ScheduledTaskTrigger -AtLogOn
$Action= New-ScheduledTaskAction -Execute "cmd.exe" -Argument "/c `"$command1 && $command2`""
$Newtask = New-ScheduledTask -Action $Action -Trigger $Trigger
$principal = New-ScheduledTaskPrincipal -GroupId "Users" -RunLevel Limited
$Newtask.Principal = $principal
$Newtask | Register-ScheduledTask -TaskName $TaskName

