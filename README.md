# OutlookSearchFix
Fix for Outlook search issues related to March 2024 Microsoft updates
This Powershell script creates a scheduled task that runs at log on for anyone in the group "Users". This scheduled task adds the two registry values that fix the Outlook search issue that appeared after the March, 2024 round of Microsoft updates
The observed issue is being unable to fetch any results from searching within the Outlook desktop application

The fix adds the following registry keys via a scheduled task:
"HKCU:\SOFTWARE\Microsoft\Office\16.0\Outlook\Search" -Name "DisableServerAssistedSearch" -Value 1 -Type DWORD
"HKCU:\SOFTWARE\Microsoft\Office\16.0\Outlook\Search" -Name "DisableServerAssistedSuggestions" -Value 1 -Type DWORD

This script was created to be able to push out to several endpoints across multiple tenants through N-Able's RMM platform, N-Central
