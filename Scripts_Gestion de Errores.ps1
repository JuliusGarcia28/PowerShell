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