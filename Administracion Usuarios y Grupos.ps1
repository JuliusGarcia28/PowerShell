<#Administracion de usuarios y grupos#>
#Si no le añades ningun parametro , muestra una lista de todas las cuentas locales con info sobre cada una
Get-LocalUser
#Para obtener informacion detallada sobre una cuenta en concreto se usan filtros por parametros
Get-LocalUser -Name Julius | Select-Object *
#Obtiene informacion detallada sobre los grupos locales de un equipo
Get-LocalGroup
#De la misma manera que los usuarios se pueden filtrar por parametros
Get-LocalGroup -Name Administradores | Select-Object *
#Se crea una cuenta de usuario local en el equipo
New-LocalUser -Name "Usuario1" -Desccripcion "Usuario de prueba 1" -NoPassword
#
#Elimina un usuario local en el equipo
Remove-LocalUser -Name "Usuario1"
#Crea un nuevo grupo local en el equipo
New-LocalGroup -Name 'Grupo' -Descripcion 'Grupo de prueba 1'
#Agregar miembros a un grupo local en el equipo
Add-LocalGroupMember -Group Grupo1 -Member Usuario2 -Verbose
#Eliminar miembros de un grupo local del equipo
Remove-LocalGroupMember -Group Grupo1 -Member Usuario1