param([string]$port='10933', [string]$env='dev', [string]$role='web-server', [string]$ip='')

$password =  ConvertTo-SecureString "adminP@ssw0rd" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential("$env:COMPUTERNAME\adminuser", $password)
$command = $file = $PSScriptRoot + "\octoInstall.ps1"
Enable-PSRemoting –force
Invoke-Command -FilePath $command -Credential $credential -ComputerName $env:COMPUTERNAME -ArgumentList $port, $env, $role, $ip
Disable-PSRemoting -Force