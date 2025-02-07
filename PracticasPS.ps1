<#Variables#>
$var1="Hola"
$var2="mundo"
$var3=100
${VAR iable4}=200



$variable5=300

$var1+$var2

$var3+${VAR iable4}
$var3-${VAR iable4}

<#Tipos de datos#>

[int]$vari1=100
[int]$vari2="Hola"

<#Ejecuciones Condicionales y Bucles#>

$condicion=$true
if ($condicion)
{
    Write-Output "La condicion era verdadera"
}
else 
{
    Write-Output "La condicion era falsa"
}

$numero=2
if ($numero -ge 3)
{
    Write-Output "El numero [$numero] es mayor o igual a 3"
}
elseif ($numero -lt 2)
{
    Write-Output "El numero [$numero] es menor que 2"
}
else 
{
    Write-Output "El numero [$numero] es igual a 2"
}



<#Switch#>

switch (3) {
    1{"[$_] es uno."  }
    2{"[$_] es dos."  }
    3{"[$_] es tres."  }
    4{"[$_] es cuatro."  }
}
switch (3) {
    1{"[$_] es uno."  }
    2{"[$_] es dos."  }
    3{"[$_] es tres."  }
    4{"[$_] es cuatro."  }
    3{"[$_] es tres de nuevo."  }
}
switch (3) {
    1{"[$_] es uno."  }
    2{"[$_] es dos."  }
    3{"[$_] es tres."; Break  }
    4{"[$_] es cuatro."  }
    3{"[$_] es tres de nuevo"  }
}

switch (1, 5) {
    1{"[$_] es uno."  }
    2{"[$_] es dos."  }
    3{"[$_] es tres."  }
    4{"[$_] es cuatro."  }
    5{"[$_] es cinco."  }
}

$email = 'antonio.yanez@udc.es'
$email2 = 'antonio.yanez@usc.gal'
$url = 'https://www.dc.fi.udc.es/~afyanez/Docencia/2023'
switch -Regex ($url, $email, $email2) {
    '^\w+.\w+@(udc|usc|edu)\.(es|gal)$' { "[$_] es una direccion de correo electronico academica" }
    '^ftp:\/\/.*$' { "[$_] es una direccion ftp" }
    '^((http|https):\/\/).*' { "[$_] es una direccion web, que utiliza [${matches[1]}]" }
}
<#Operadores logicos y comparativos#>

1 -eq "1.0"
"1.0" -eq 1

<#Ciclo For#>

for (($i=0), ($j=0); $i -lt 5; $i++ )
{
    "`$i:$i"
    "`$j:$j"
}

for ($($i=0;$j=0); $i -lt 5; $($i++;$j++) )
{
    "`$i:$i"
    "`$j:$j"
}


<#Foreach#>

$ssoo = "freebsd", "openbsd", "solaris", "fedora", "ubuntu", "netbsd"
foreach ($so in $ssoo)
{
    Write-Host $so
}

foreach ($archivo in Get-ChildItem)
{
    if ($archivo.legth -ge 10KB)
    {
        Write-Host $archivo -> [($archivo.legth)]
    }
}


<#Ciclo while#>

$num= 0

while ($num -ne 5) 
{
    if ($num -eq 1) { $num = $num +3 ; Continue}
    $num++
    Write-Host $num
}

$valor = 5
$multiplicacion = 1
do 
{
    $multiplicacion = $multiplicacion * $valor
    $valor--
}
while ($valor -gt 0) 
Write-Host $multiplicacion

<#Declaraciones Break y Continue#>
$nume = 10
for ($ii = 2; $ii -lt 10; $ii++)
{
    $nume =  $nume+$ii
    if ($ii -eq 5) { Break }
}
Write-Host $nume  
Write-Host $ii

<#Break con For#>
$cadena= "Hola, buenas tardes"
$cadena2= "Hola, buenas noches"

switch -Wildcard ($cadena, $cadena2) 
{
    "Hola, buenas*" {"[$_] coincide con [Hola, buenas*]"}
    "Hola, bue*"{"[$_] coincide con [Hola, bue*]"}
    "Hola,*"{"[$_] coincide con [Hola,*]"; Break}
    "Hola, buenas tardes"{"[$_] coincide con [Hola, buenas tardes*]"}
}

<#Continue con For#>
$cadena1= "Hola, buenas tardes"
$cadena3= "Hola, buenas noches"

switch -Wildcard ($cadena1, $cadena3) 
{
    "Hola, buenas*" {"[$_] coincide con [Hola, buenas*]"}
    "Hola, bue*"{"[$_] coincide con [Hola, bue*]"}
    "Hola,*"{"[$_] coincide con [Hola,*]"; Continue}
    "Hola, buenas tardes"{"[$_] coincide con [Hola, buenas tardes*]"}
}

<#Cmdlet
Get-Command -Type Cmdlet | Sort-Object -Property Noun | 
Format-Table -GroupBy Noun

Get-Command -Name <cmdlet> -Args Cert: -Syntax

<#Objetos y Pipeline

Get-Item .\Test.txt | Get-Member -MemberType Method

Get-Item .\Test.txt | Select-Object Name, Length
Get-Item .\Test.txt | Select-Object -Last 5
Get-Item .\Test.txt | Select-Object -First 5
Get-Servie | Where-Object {$-.Status -eq "Running"}

(Get-Item .\Test.txt).IsReadOnly
(Get-Item .\Test.txt).IsReadOnly = 1

Get-ChildItem *.txt
(Get-Item .\Test.txt).CopyTo("C:\Desktop\prueba.txt")

#>

<#Funciones#>

<#Fuction [<ámbito>:] <nombre de funcion> (<argumento>)
{
    param (<lista de parámetros>)
    # bloque de instrucciones
}#>

fuction Get-Fecha
{Get-Date}

fuction Get-Resta{
    param ([int]num1, [int]$num2)
    $resta=$num1-$num2
    Write-Host "La resta de los parametros es $resta"
}

fuction Get-Resta{
    Param ([Parameter(Mandatory)][int]$num1, [int]$num2)
    $resta=$num1-$num2
    Write-Host "La resta de los parametros es $resta"
}

fuction Get-Resta{
    [CmdletBinding()]
    Param([int]$num1, [int]$num2)
    $resta=$num1-$num2
    Write-Host "La resta de los parametros es $resta"
}

<#Modulos#>

<#Get-Module
    Get-Module -ListAvilable
    Remove-Module BitsTransfer
#>

<#Scripts#>

 <#Gestion de errores Try/Catch#>
 try{
    Write-Output "Todo Bien"
 }catch{
    Write-Output "Algo lanzo una excepcion"
    Write-Output $_
 }
 try{
    Start-Something -ErrorAction Stop
 }catch{
    Write-Output "Algo genero una excepcion o uso Write-Error"
    Write-Output $_
 }

 <#Gestion de errores Try/Finally#>
 $comando = [System.Data.sqlClient.sqlCommand]::New(queryString, connection)
 try{
    $comando.Connection.Open()
    $comando.ExcuteNonQuery()
 }
 finally{
    Write-Error "Ha habido un prooblema con la ejecucion de la query. Cerrando la conexion"
    $comando.Connection.Close()
 }

  try{
    Start-Something -Path $path -ErrorAction Stop
  }catch [System.IO.DirectoryNotFoundException],[System.IO.FileNotFoundException]{
    Write-Output "El directorio o fichero no ha sido encontrado:[$path]"
  }catch [System.IO.IOException]{
    Write-Output "Error de IO con el archivo: [$path]"
  }

  throw "No se puede encontrar la ruta: [$path]"

  throw [System.IO.FileNotFoundException] "No se puede encontrar la ruta: [$path]"

  throw [System.IO.FileNotFoundException]::new()

  throw [System.IO.FileNotFoundException]::new("No se puede encontrar la ruta: [$path]")

  throw (New-Object -TypeName System.IO.FileNotFoundException)

  throw (New-Object -TypeName System.IO.FileNotFoundException -ArgumentList "No se puede encontrar la ruta: [$path]")

trap{
    Write-Output $PSItem.ToString()
}
throw [System.Exception]::new('primero')
throw [System.Exception]::new('segundo')
throw [System.Exception]::new('tercero')

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

<#Administracion con PowerShell#>
Get-Service

Stop-Service -Name Spooler -Confirm -PassThru

Start-Service -Name Spooler -Confirm -PassThru

Suspend-Service -Name Spooler -Confirm -PassThru

Restart-Service -Name WSearch -Confirm -PassThru

Set-Service -Name dcsvc -DisplayName "Servicio de virtualizacion de credenciales de seguridad distribuidas"

Get-CimInstance Win32_Service -Filter 'Name = "BITS"' | Format-List Name, Description

Get-Process -Name Acrobat

Wait-Process -Name Notepad

<#Administracion de usuarios y grupos#>
Get-LocalUser

Get-LocalUser -Name Julius | Select-Object *

Get-LocalGroup

Get-LocalGroup -Name Administradores | Select-Object *

New-LocalUser -Name "Usuario1" -Desccripcion "Usuario de prueba 1" -NoPassword

Get-LocalUSer -Name "Usuario1"

Remove-LocalUser -Name "Usuario1"

New-LocalGroup -Name 'Grupo' -Descripcion 'Grupo de prueba 1'

Add-LocalGroupMember -Group Grupo1 -Member Usuario2 -Verbose

Remove-LocalGroupMember -Group Grupo1 -Member Usuario1