# it is needed to launch this script as an administrator

$date = $(get-date -f yyyy-MM-dd-H-m-s)
$registryPath = "HKLM:\SOFTWARE"
# this is a hashtable, similar to a dictionnary in python
$registryKeys = @{ "Test-Version" = "2.0"; "Test-Region" = "Belgium"}
$logsPath = "C:\logs"

function Set-RegKey {
    param( [String]$regPath, [String]$keyName, [String]$keyValue, [String]$keyType )
    New-ItemProperty -Path $regPath -Name $keyName -Value $keyValue  -PropertyType $keyType -ErrorAction Stop
}

function Write-Log {
    param([String]$logString)
    If(!(test-path $logsPath))
    {
        New-Item -ItemType Directory -Force -Path $logsPath | Out-Null #redirect output to null/void to make it cleaner
    }
    $logString | Out-File "$logsPath\$date.txt" -Append
}

Write-Log "Début du script"

foreach($key in $registryKeys.keys)
{
    Try {
        $result = Set-RegKey $registryPath $key $registryKeys[$key] "String"
        Write-Log $result
        Write-Log "Création de la clé « $key » terminée avec succès"
    }
    Catch {
        Write-Log "Erreur : création de la clé « $key » impossible"
    }
    Finally {
        Write-Log "Fin de la gestion de la clé « $key »"
    }
}

Write-Log "Fin du script"
