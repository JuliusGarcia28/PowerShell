<#Administracion con PowerShell#>
#Obtener los Servicios que se pueden visualizar como una lista
Get-Service
#Detiene un servicio inmediatamente y tambien cualquier tarea en curso que se este realizando
Stop-Service -Name Spooler -Confirm -PassThru
#Iniciar un servicio y que comience a ejecutarse
Start-Service -Name Spooler -Confirm -PassThru
#Se utliza para suspender un servicio, pausandolo temporalmente en lugar de detenerlo por completo
Suspend-Service -Name Spooler -Confirm -PassThru
#Detiene y luego inicia nuevamente un servicio de esta manera reiniciando el servicio deseado
Restart-Service -Name WSearch -Confirm -PassThru
#Cambia la configuracion de un servicio realizando tareas como cambiar su nombre, descripcion, su tipo de inicio, entre otros
Set-Service -Name dcsvc -DisplayName "Servicio de virtualizacion de credenciales de seguridad distribuidas"
#Regresa nombre y descripcion de un servicio
Get-CimInstance Win32_Service -Filter 'Name = "BITS"' | Format-List Name, Description
#Obtiene informacion detallada del usuario sobre los procesos en ejecucion
Get-Process -Name Acrobat
#Para esperar a que un proceso en ejecucion se detenga, suprime el cmd hasta que se detengan los procesos
Wait-Process -Name Notepad