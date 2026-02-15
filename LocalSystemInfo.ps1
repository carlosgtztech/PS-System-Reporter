# Description
# This script gathers OS, CPU, RAM, disk, network, software, Remote Desktop Protocol status, and open ports from my local virtual machine and saves the report in a specified folder.
# Author 
# Carlos Almendares
# Last Update
# 03/14/2026

# Prompt the user input 
$userName = Read-Host "Enter your name"
$reportLocation = Read-Host "Enter the folder location to save reports"

#Ensure report directory exists 
if (-not (Test-Path $reportLocation)) { New-Item -ItemType Directory -Path $reportLocation }

# Set computer name
$computerName = $env:COMPUTERNAME

# Generate report filename with timestamp
$timestamp = Get-date -format "yyyy-MM-dd_HH-mm"
$reportFile = "$reportLocation\$computerName-INV-$timestamp.txt"

# -------------------- Gets data from the local computer --------------------

# Operating System
$osInfo = Get-CimInstance -ClassName Win32_OperatingSystem

# Processor
$cpuInfo = Get-CimInstance -ClassName Win32_Processor | Select-Object Name, Manufacturer, MaxClockSpeed, NumberOfCores

# RAM
$ram = Get-CimInstance -ClassName Win32_PhysicalMemory

# Logical disks (fixed drives only)
$disks = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"

# Network adapters
$netAdapter = Get-NetAdapter | Where-Object Status -eq 'Up'

# Installed software from the registry
$software = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object DisplayName

# Remote Desktop Protocol (RDP) status 
$RdpKey = "HKLM:\System\CurrentControlSet\Control\Terminal Server"
$RdpSetting = Get-ItemProperty -Path $RdpKey -Name fDenyTSConnections -ErrorAction SilentlyContinue
$rdpRegistry = if ($RdpSetting -and $RdpSetting.fDenyTSConnections -eq 0) { "Enabled" } else { "Disabled" }
$rdpService = Get-Service -Name TermService
$rdpServiceStatus = if ($rdpService.Status -eq "Running") { "Running" } else { "Stopped" }
$rdpFirewall = Get-NetFirewallRule -DisplayGroup "Remote Desktop" | Where-Object Enabled -eq True
$rdpFirewallStatus = if ($rdpFirewall) { "Enabled" } else { "Disabled" }

# Open listening ports
$openPorts = Get-NetTCPConnection | Where-Object State -eq "Listen" | Select-Object LocalPort, OwningProcess

# Total RAM
$totalRAM = [math]::Round(($ram | Measure-Object -Property Capacity -Sum).Sum / 1GB, 2)

# -------------------- Output the information to a file report ---------------------------
$report = @"
==========================
REPORT FOR $computerName
==========================
Report run by: $userName 
Date: $(Get-Date)
==========================
Operating System
OS: $($osInfo.Caption) - $($osInfo.Version)
=========================
Processor Information
CPU: $($cpuInfo.Name)
Manufacturer: $($cpuInfo.Manufacturer)
Cores: $($cpuInfo.NumberOfCores)
========================
Memory Information
Total RAM: $totalRAM GB
========================
Disk Drives
$($disks | ForEach-Object {
    $size = [math]::Round($_.Size/1GB,2)
    $free = [math]::Round($_.FreeSpace/1GB,2)
    "$($_.DeviceID) : $size GB total, $free GB free"
} | Out-String)
========================
Network Adapters (Up)
$($netAdapter | ForEach-Object {
    $ips = ($_ | Get-NetIPAddress -AddressFamily IPv4).IPAddress -join ', '
    "$($_.Name) : $($_.InterfaceDescription) - MAC: $($_.MacAddress) - IPs: $ips"
} | Out-String)
========================
Installed Software (Top 50)
$($software | Sort-Object DisplayName | Select-Object -First 50 | ForEach-Object {
    "$($_.DisplayName) - $($_.DisplayVersion) ($($_.Publisher))"
} | Out-String)
========================
Remote Desktop Protocol Status
Registry Setting: $rdpRegistry
Service Status: $rdpServiceStatus
Firewall Rule: $rdpFirewallStatus
========================
Open Ports
$($openPorts | Format-Table LocalPort, OwningProcess -AutoSize | Out-String)
"@

$report | Out-File -FilePath $reportFile
Write-Host "Report saved: $reportFile"
