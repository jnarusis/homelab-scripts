<#
.SYNOPSIS
Exports all Active Directory users with their group memberships to a CSV.

.DESCRIPTION
This script lists every user in the domain along with all of their security group memberships and exports the data to a timestamped CSV file.

.NOTES
Author: Justin Narusis
Date: Get-Date -Format yyyy-MM-dd
#>

$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm"
$outputPath = "C:\Scripts\ADUserGroupAudit_$timestamp.csv"

# Get all users in the domain
$users = Get-ADUser -Filter * -Properties MemberOf

# Build the output
$report = foreach ($user in $users) {
    $groups = ($user.MemberOf | ForEach-Object {
        (Get-ADGroup $_).Name
    }) -join "; "

    [PSCustomObject]@{
        Username   = $user.SamAccountName
        FullName   = $user.Name
        Department = $user.Department
        Groups     = $groups
    }
}

# Export to CSV
$report | Export-Csv -Path $outputPath -NoTypeInformation -Encoding UTF8

Write-Host "Audit complete. Results saved to $outputPath"
