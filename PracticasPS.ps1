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

  <#Me quede en la pagina 72#>