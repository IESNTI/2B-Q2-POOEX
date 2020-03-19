# it is needed to launch this script as an administrator

# FIRST PART

$registryPath = "HKLM:\SOFTWARE"
# this is a hashtable, similar to a dictionnary in python
$registryKeys = @{ "Test-Version" = "2.0"; "Test-Region" = "Belgium"}
foreach($key in $registryKeys.keys)
{
    New-ItemProperty -Path $registryPath -Name $key -Value $registryKeys[$key]  -PropertyType "String"
}

# SECOND PART
