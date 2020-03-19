# it is needed to launch this script as an administrator

$date = $(get-date -f yyyy-MM-dd-H-m-s)
$registryPath = "HKLM:\SOFTWARE"
# this is a hashtable, similar to a dictionnary in python
$registryKeys = @{ "Test-Version" = "2.0"; "Test-Region" = "Belgium"}

function Set-RegKey {
    param( [String]$regPath, [String]$keyName, [String]$keyValue, [String]$keyType )
    New-ItemProperty -Path $regPath -Name $keyName -Value $keyValue  -PropertyType $keyType
}

function Write-Log {
    param([String]$logString)
    New-Item -ItemType Directory -Force -Path "C:\logs"
    $logString | Out-File "C:\logs\$date.txt" -Append
}

Write-Log "Début du script"

foreach($key in $registryKeys.keys)
{
    $result = Set-RegKey $registryPath $key $registryKeys[$key] "String"
    Write-Log $result
}

Write-Log "Fin du script"
