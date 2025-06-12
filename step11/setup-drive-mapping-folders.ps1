<#
.SYNOPSIS
Creates and shares department-specific folders for drive mapping via GPO.
Applies NTFS and share-level permissions based on AD group membership.

.Author: Justin Narusis
.Date: 2025-06
.Lab Domain: lab.local
#>

# Variables
$basePath = "C:\Shares"
$folders = @(
    @{ Name = "HRShare"; Group = "lab\HRStaff" },
    @{ Name = "ITShare"; Group = "lab\ITAdmins" }
)

# Ensure base folder exists
if (-Not (Test-Path $basePath)) {
    New-Item -Path $basePath -ItemType Directory -Force
}

foreach ($f in $folders) {
    $folderPath = Join-Path $basePath $f.Name

    # Create the folder
    if (-Not (Test-Path $folderPath)) {
        Write-Host "Creating folder: $folderPath"
        New-Item -Path $folderPath -ItemType Directory -Force
    }

    # Set NTFS permissions
    $acl = Get-Acl $folderPath
    $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule(
        $f.Group, "Modify", "ContainerInherit,ObjectInherit", "None", "Allow"
    )
    $acl.SetAccessRule($accessRule)
    Set-Acl -Path $folderPath -AclObject $acl
    Write-Host "Applied NTFS permissions for $($f.Group)"

    # Create SMB share
    if (-Not (Get-SmbShare -Name $f.Name -ErrorAction SilentlyContinue)) {
        New-SmbShare -Name $f.Name -Path $folderPath -FullAccess $f.Group
        Write-Host "Shared $folderPath as \\DC01\$($f.Name) with FullAccess for $($f.Group)"
    } else {
        Write-Host "Share \\DC01\$($f.Name) already exists"
    }
}

Write-Host "`nDrive mapping folders created and shared successfully."
