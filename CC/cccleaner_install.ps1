# URL del archivo en GitHub (asegúrate de utilizar el enlace raw)
$githubFileUrl = "https://raw.githubusercontent.com/sercoivel/Intune/main/SonicWallCaptureClientCleanerUtility.3.7.8.exe"

# Ruta de destino en tu sistema local
$localDestination = "C:\IT\APP\CCCleaner\SonicWallCaptureClientCleanerUtility.3.7.8.exe"

# Verificar si el directorio de destino existe, y créalo si es necesario
$directory = [System.IO.Path]::GetDirectoryName($localDestination)
if (-not (Test-Path -Path $directory -PathType Container)) {
    New-Item -ItemType Directory -Force -Path $directory
}

# Descargar el archivo
Invoke-WebRequest -Uri $githubFileUrl -OutFile $localDestination

#----------------------------------------------------#

# Ruta del ejecutable
$rutaEjecutable = "C:\IT\APP\CCCleaner\SonicWallCaptureClientCleanerUtility.3.7.8.exe"

# Código de autenticación
$authCode = "3CB5101FF594EEFF9144DD4F7D34AA7B9E726DAB4E172CECA8B6071C6524A22A"

# Ruta del archivo de log en la misma carpeta que el ejecutable
$rutaLog = Join-Path (Get-Item $rutaEjecutable).DirectoryName "Resultado_Log.txt"

# Construir el comando con la redirección de salida al archivo de log
$comando = "& '$rutaEjecutable' -authCode $authCode > '$rutaLog' 2>&1"

# Ejecutar el comando
Invoke-Expression -Command $comando

# Mostrar mensaje de finalización
Write-Host "Comando ejecutado. Resultado almacenado en: $rutaLog"



