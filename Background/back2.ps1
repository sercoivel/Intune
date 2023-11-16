Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

# Definir la URL de la imagen de fondo de pantalla
$url = "https://sercotelconnect.sercotelhoteles.com/wp-content/uploads/2023/06/la-Rivera-Sitges20656-e1687164995745-300x200.jpg"

# Definir la carpeta de destino para guardar la imagen
$rutaCarpeta = "C:\IT\"
$rutaDestino = Join-Path -Path $rutaCarpeta -ChildPath "imagen.jpg"

# Verificar si la carpeta de destino existe y, de lo contrario, crearla
if (-not (Test-Path -Path $rutaCarpeta -PathType Container)) {
    New-Item -ItemType Directory -Path $rutaCarpeta | Out-Null
}

# Descargar la imagen desde el enlace
Invoke-WebRequest -Uri $url -OutFile $rutaDestino

# Establecer la imagen como fondo de pantalla
$SPI_SETDESKWALLPAPER = 0x0014
$SPIF_UPDATEINIFILE = 0x01
$SPIF_SENDCHANGE = 0x02

[Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $rutaDestino, $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE)
