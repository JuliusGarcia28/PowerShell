<#Backup en ruta especifica#>
fuction Backup-Registry {
    Param(
        [Parameter(Mandatory = $true)]
        [string]$rutaBackup
    )

    #Crear la ruta de ddestino del backup si no existe
    if (!(Test-Path -Path $rutaBackup)){
        New-Item -ItemType Directory -Path $rutaBackup | Out-Null
    }

    #Generar un nombre unico para el archivo de backup si no existe
    $nombreArchivo = "Backup-Registry_" + (Get-Date -Format "yyyy-MM-dd-mm-ss") + ".reg"
    $rutaArchivo = Join-Path -Path $rutaBackup -ChildPath
    $nombreArchivo

    #Realizar el backup del registro del sistema y guardarlo en archivo de destino
    try{
        Write-Host "Realizando backup del registro del sistema en $rutaArchivo..."
        reg export HKLM $rutaArchivo
        Write-Host "El backup del registro del sistema se ha realizado con exito"   
    }catch{
        Write-Host "Se ha producido un error al realizar un backup del registro del sistema: $_"
    }
}

<#Backup funciones agregadas#>
#Escribir el codigo en archivo log
$logDDirectory = "$env:APPDATA\RegistryBackup"
$logFile = Join-Path $logDirectory "backup-registry_log.txt"
logEntry = "$(Get-Date) - $env:USERNAME - Backup - $backupPath"
if(!(Test-Path $logDirectory)) {
    New-Item -ItemType Directory -Path $logDirectory | Out-Null
}
Add-Content -Path $logFile -Value $logEntry

#Verificar si hay mas $backupCount backups en el directorio y eliminar los mas antiguos si es necesario
$backupCount = 10
$backups = Get-ChildItem $backupDirectory -Filter *.reg | Sort-Object LastWriteTime -Descending
if ($backups.Count -gt $backupCount) {
    backupsToDelete = $backups[$backupCount..($backups.Count-1)]
    $backupsToDelete | Remove-Item -Force
}

#Creacion de script que crea un archivo .psd1
@{
    ModuleVersion = '1.0.0'
    PowerShellVersion = '5.1'
    RootModule = 'Backup-Registry.ps1'
    Description = 'Modulo para realizar backups del registro del sistema de windows'
    Autho = 'Julian'
    FunctionsToExport = @('Backup-Registry')
}

#Automatizacion de la ejecucion del backup
#Configuracion de la tarea
$Time = New-ScheduledTaskTrigger -At 02:00 -Daily
#Atencion de la tarea
$PS = New-ScheduledTaskAction -Excute "Powershell.exe" -Argument
"-Command '"Import-Module BackupRegistry -Force; backup-Registry -rutaBackup 'D:\tmp\Backups\Registro'"'"
#Crear la tarea programada
Register-ScheduledTask -TaskName "Ejecutar Backupdel Registro del sistema" -Trigger $Time -Action $PS
