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