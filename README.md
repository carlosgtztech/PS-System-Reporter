# PS-System-Reporter

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue)
![License](https://img.shields.io/badge/License-MIT-green)

A small PowerShell script that collects comprehensive hardware and software details from your local Windows machine and generates an easy-to-read text report. Perfect for asset inventory, troubleshooting, or documentation.

## Table of Contents
- [Description](#description)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Sample Output](#sample-output)
- [Screenshot](#screenshot)
- [Contributing](#contributing)
- [Author](#author)

## Description
This script is a standalone version of a remote inventory tool, adapted to run locally. It gathers essential system information without requiring network access to other computers. The output is a timestamped text file saved to a folder of your choice.

## Features
- **Operating System** – Captures OS name, and version.
- **Processor** – Shows CPU name, manufacturer, and core count.
- **Memory (RAM)** – Calculates total physical memory.
- **Fixed Disks** – Reports drive letter, total size, and free space.
- **Network Adapters** – Lists active adapters with interface description, MAC address, and assigned IPv4 addresses.
- **Installed Software** – Displays the top 50 installed applications (name, version, publisher).
- **Remote Desktop Protocol (RDP) Status** – Checks registry setting, service state, and firewall rule.
- **Listening Ports** – Shows local ports that are currently in a listening state.

## Requirements
- **Windows** – Works on Windows 7/8/10/11 and Windows Server 2008+.
- **PowerShell** – Version 5.1 or later (PowerShell 7 is also supported).
- **Administrator Rights** – Required for full network adapter and firewall information (script will still run without admin, but some data may be missing).

## Installation
1. **Download the script** – Save [`LocalSystemInfo.ps1`](LocalSystemInfo.ps1) to your computer.
2. **(Optional) Review the script** – Open it in a text editor to understand what it does.
3. **Place it in a convenient folder** – e.g., `C:\Scripts` or your Desktop.

## How to use
1. **Open PowerShell as Administrator** (right-click PowerShell and select "Run as administrator").
2. **Navigate to the script folder**:
   ```powershell
   cd C:\Path\To\Script
3. **Run the script**:
   cd .\LocalSystemInfo.ps1
4. **Follow the prompts**:
   Enter your name (for report attribution).
   Enter the folder path where you want to save the report (e.g, `C:\Reports`).
6. **Wait for completion**:
   The script will display "Report saves: [filename]" when done.
   The report file will be named `COMPUTER-INV-YYYY-MM-DD_HH-mm.txt` and placed in your specified folder.

   ![image alt](https://github.com/carlosgtztech/PS-System-Reporter/blob/d0f122925115d835a918e01c05fd993201dfda3e/images/Screenshot-report1.png)
   

   **Sample Output**
   Below is a trimmed example of the generated report:
   
  ![image alt](https://github.com/carlosgtztech/PSS-System-Reporter/images/Screenshot-report1.png)

## Contributing
**Contributions are welcome! Feel free to:**
   Report bugs or suggest features via Issues.
   Submit pull request for improvements
   Share your ideas in the Discussions section.
