#To install the driver in DriverStore use this, changing the path as needed:

pnputil.exe -i -a C:\Printer\SPL_PCL\ssi5m.inf 

#To get the driver installed, change the name as found in the .inf file:

$drivename = “Samsung M332x 382x 402x Series" 
Add-PrinterDriver -Name "$drivename"

#Change the $ip as needed and check the existence of the port, creating it if needed:

$ip = "192.168.10.27"

$portName = “IP_$ip” 

$checkPortExists = Get-Printerport -Name $portname -ErrorAction SilentlyContinue

if (-not $checkPortExists) {

    Add-PrinterPort -name $portName -PrinterHostAddress $ip 
}


#To add the new printer to the Operetional System, change the printer name to the client standart:

Add-Printer -Name Samsung_m4020 -DriverName "$drivename" -PortName IP_"$ip"



#(New-Object -ComObject WScript.Network).AddWindowsPrinterConnection("\\Printserver01\Xerox5")

#created based on https://github.com/Action1Corp/Howtos/blob/main/Install%20New%20Printer.ps1 by d-ferente
