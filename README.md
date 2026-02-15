# Local System Information PowerShell Script

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue)
![License](https://img.shields.io/badge/License-MIT-green)

A lightweight PowerShell script that collects comprehensive hardware and software details from your local Windows machine and generates an easy-to-read text report. Perfect for asset inventory, troubleshooting, or documentation.

## Table of Contents
- [Description](#description)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Sample Output](#sample-output)
- [Screenshot](#screenshot)
- [Contributing](#contributing)
- [License](#license)
- [Author](#author)

## Description
This script is a standalone version of a remote inventory tool, adapted to run locally. It gathers essential system information without requiring network access to other computers. The output is a timestamped text file saved to a folder of your choice.

## Features
- **Operating System** – Captures OS name, version, build number, architecture, last boot time, and uptime.
- **Processor** – Shows CPU name, manufacturer, core count, and max clock speed.
- **Memory (RAM)** – Calculates total physical memory and lists the number of installed modules.
- **Fixed Disks** – Reports drive letter, total size, free space, and usage percentage.
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

## Usage
1. **Open PowerShell as Administrator** (right-click PowerShell and select "Run as administrator").
2. **Navigate to the script folder**:
   ```powershell
   cd C:\Path\To\Script
