<#Funciones#>
<#Fuction [<ámbito>:] <nombre de funcion> (<argumento>)
{
    param (<lista de parámetros>)
    # bloque de instrucciones
}#>

fuction Get-Fecha
{Get-Date}

fuction Get-Resta{
    param ([int]$num1, [int]$num2)
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