$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$registryName = "DisablePersonalDirChange"
$registryValue = 0

# Create or open the registry key
$registryKey = Get-Item -Path $registryPath -ErrorAction SilentlyContinue
if (-not $registryKey) {
    $registryKey = New-Item -Path $registryPath -Force
}

# Set the registry value
Set-ItemProperty -Path $registryKey.PSPath -Name $registryName -Value $registryValue -Type DWORD
