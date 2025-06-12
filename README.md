# Homelab Scripts

This repository contains automation scripts developed as part of a Windows Server homelab environment. These scripts are designed to simulate real-world sysadmin tasks and help streamline domain setup, user management, drive mapping, and more.

## Step 11 – Drive Mapping via Group Policy

This script automates the creation and configuration of shared folders for department-specific drive mapping using Group Policy.

**Script**: [`step11/setup-drive-mapping-folders.ps1`](step11/setup-drive-mapping-folders.ps1)

### Features
- Creates `C:\Shares\HRShare` and `C:\Shares\ITShare`
- Applies NTFS permissions for AD groups (`HRStaff` and `ITAdmins`)
- Shares the folders with appropriate share-level access

### Usage
Run on the domain controller (`DC01`) as an administrator:

```powershell
.\step11\setup-drive-mapping-folders.ps1
# homelab-scripts
Automation scripts for Windows Server, PowerShell management, and homelab operations.
