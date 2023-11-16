$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd"
$registryName = "AdmPwdEnabled"
$registryValue = 1

# Create or open the registry key
$registryKey = Get-Item -Path $registryPath -ErrorAction SilentlyContinue
if (-not $registryKey) {
    $registryKey = New-Item -Path $registryPath -Force
}

# Set the registry value
Set-ItemProperty -Path $registryKey.PSPath -Name $registryName -Value $registryValue -Type DWORD