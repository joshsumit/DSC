Get-ChildItem -Path 'C:\Windows\System32\Configuration' -File -Force
Remove-DscConfigurationDocument -Stage Current, Pending, Previous -Verbose

#For LCM meta
Get-DscLocalConfigurationManager
Set-DscLocalConfigurationManager

#For Config
Get-DscConfiguration
Start-DscConfiguration
Update-DscConfiguration
