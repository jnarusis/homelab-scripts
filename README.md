
Homelab Scripts

This repository contains automation scripts developed for a Windows Server 2022 homelab environment. These scripts simulate real-world sysadmin tasks such as drive mapping, bulk user creation, offboarding, GPO auditing, and logon customization.

Each script matches a documented step in the Homelab Project: https://jnarusis.github.io/projects/homelab-project.html. Folder names match the step number from the tutorial.

Folder & Script Index

Step 11 – Drive Mapping via GPO
Script: step11/setup-drive-mapping-folders.ps1
Creates shared folders (HRShare, ITShare), applies NTFS permissions, and shares them for GPO drive mapping.
Usage:
.\step11\setup-drive-mapping-folders.ps1

Step 13 – Welcome Logon Script
Script: step13/welcome-logon-script.ps1
Generates a simple PowerShell welcome message for users at logon. Script must be linked to a GPO.
Usage:
# Run manually or deploy via GPO as logon script

Step 14 – Export Users to CSV
Script: step14/export-ad-user-groups.ps1
Exports all AD users and their group memberships to a CSV for audit or review.
Usage:
.\step14\export-ad-user-groups.ps1

Step 15 – Offboarding Script
Script: step15/offboard-user.ps1
Disables a user, removes group memberships, and moves the account to the OffboardedUsers OU.
Usage:
.\step15\offboard-user.ps1 -Username alice.hr

Step 17 – Bulk User Creation
Script: step17/create-bulk-users.ps1
Creates AD user accounts from a CSV file (also included). Script supports custom OU, password, and group assignment.
Usage:
.\step17\create-bulk-users.ps1 -CsvPath .
ew-users.csv

Script Summary:

| Step | Script                         | Description                                      |
|------|--------------------------------|--------------------------------------------------|
| 11   | setup-drive-mapping-folders.ps1 | Create shared folders + NTFS/share permissions   |
| 13   | welcome-logon-script.ps1       | Logon message via GPO                            |
| 14   | export-ad-user-groups.ps1      | Export user-group memberships to CSV             |
| 15   | offboard-user.ps1              | Disable user, move to OffboardedUsers OU         |
| 17   | create-bulk-users.ps1          | Bulk create users from CSV                       |

Notes:
- All scripts assume PowerShell execution on DC01 with AD and RSAT tools installed.
- Scripts are written for clarity and educational use in lab environments.

License:
MIT License – feel free to adapt or expand for your own learning or lab setup.
