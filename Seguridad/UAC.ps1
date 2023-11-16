# Definir la ruta del registro
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

# Definir el nombre del valor del registro
$valueName = "ConsentPromptBehaviorUser"

# Definir el nuevo valor REG_DWORD
$newValue = 0

# Comprobar si la ruta del registro existe
if (Test-Path $registryPath) {
    # Crear una nueva entrada del registro o modificar un valor existente
    Set-ItemProperty -Path $registryPath -Name $valueName -Value $newValue -Type DWORD -Force
    Write-Host "El valor del registro se ha modificado correctamente."
} else {
    Write-Host "La ruta del registro no existe."
}