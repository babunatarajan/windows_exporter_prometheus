
$url = "https://github.com/prometheus-community/windows_exporter/releases/download/v0.14.0/windows_exporter-0.14.0-amd64.msi"

$output = "windows_exporter-0.14.0-amd64.msi"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Invoke-WebRequest -Uri $url -OutFile $output
. $output

Start-Sleep -s 60
Get-Service -name 'windows_exporter'
netstat -an | findstr 9182
