# Homelab Scripts

This repository contains PowerShell automation scripts developed as part of a Windows Server 2022 Active Directory project simulating enterprise IT administration. These scripts reflect common real-world sysadmin tasks including:

- Drive mapping and file share permissions  
- Bulk user creation and offboarding  
- Active Directory user/group audits  
- GPO-based logon customization  

## Folder & Script Index

### Step 11 – Drive Mapping via GPO  
**Script:** `step11/setup-drive-mapping-folders.ps1`  
Creates shared folders (HRShare, ITShare), applies NTFS permissions, and configures shares for Group Policy drive mapping.

**Usage:**
```powershell
.\step11\setup-drive-mapping-folders.ps1
```

---

### Step 13 – Welcome Logon Script  
**Script:** `step13/welcome-logon-script.ps1`  
Displays a welcome message to users at logon. Designed for GPO deployment.

**Usage:**
```powershell
# Run manually or deploy via GPO as a user logon script
```

---

### Step 14 – Export Users to CSV  
**Script:** `step14/export-ad-user-groups.ps1`  
Exports all Active Directory users and their group memberships to a CSV file.

**Usage:**
```powershell
.\step14\export-ad-user-groups.ps1
```

---

### Step 15 – Offboarding Script  
**Script:** `step15/offboard-user.ps1`  
Disables a user account, removes group memberships, and moves it to the OffboardedUsers OU.

**Usage:**
```powershell
.\step15\offboard-user.ps1 -Username alice.hr
```

---

### Step 17 – Bulk User Creation  
**Script:** `step17/create-bulk-users.ps1`  
Creates new AD users from a CSV file (`new-users.csv` included). Supports custom OUs, passwords, and group assignment.

**Usage:**
```powershell
.\step17\create-bulk-users.ps1 -CsvPath .\step17
ew-users.csv
```

## Script Summary

| Step | Script                          | Description                                      |
|------|----------------------------------|--------------------------------------------------|
| 11   | `setup-drive-mapping-folders.ps1` | Create shares + set NTFS/share permissions       |
| 13   | `welcome-logon-script.ps1`        | Display logon message via GPO                    |
| 14   | `export-ad-user-groups.ps1`       | Export AD users and group memberships to CSV     |
| 15   | `offboard-user.ps1`               | Disable user, remove groups, move to OU          |
| 17   | `create-bulk-users.ps1`           | Bulk-create users from CSV file                  |

## Notes

- All scripts are designed for use on a domain controller (DC01) with Active Directory and RSAT tools installed.  
- These scripts are intended for educational and portfolio demonstration purposes.  

## License

MIT License — Feel free to adapt, extend, or reuse these scripts in your own lab or portfolio environments.
