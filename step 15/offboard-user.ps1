# offboard-user.ps1

param (
    [Parameter(Mandatory=$true)]
    [string]$Username
)

$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm"
$logPath = "C:\Scripts\OffboardingLog_$timestamp.txt"

try {
    $user = Get-ADUser $Username -Properties MemberOf
    if ($user -eq $null) {
        Write-Output "User $Username not found." | Tee-Object -FilePath $logPath
        exit
    }

    Disable-ADAccount $user
    Write-Output "Disabled account: $Username" | Tee-Object -FilePath $logPath -Append

    foreach ($group in $user.MemberOf) {
        Remove-ADGroupMember -Identity $group -Members $user -Confirm:$false
        Write-Output "Removed $Username from group $group" | Tee-Object -FilePath $logPath -Append
    }

    $targetOU = "OU=OffboardedUsers,DC=lab,DC=local"
    Move-ADObject -Identity $user.DistinguishedName -TargetPath $targetOU
    Write-Output "Moved $Username to OffboardedUsers OU" | Tee-Object -FilePath $logPath -Append

    Write-Output "Offboarding for $Username complete." | Tee-Object -FilePath $logPath -Append
}
catch {
    Write-Output "Error: $_" | Tee-Object -FilePath $logPath -Append
}
