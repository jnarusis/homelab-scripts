# Path to CSV
$csvPath = "\\DC01\sysvol\lab.local\scripts\new-users.csv"

# Domain base DN
$domain = "DC=lab,DC=local"

# Import CSV
Import-Csv $csvPath | ForEach-Object {
    $firstName = $_.FirstName
    $lastName = $_.LastName
    $username = $_.Username
    $ouPath = "OU=$($_.OU),$domain"
    $password = ConvertTo-SecureString $_.Password -AsPlainText -Force

    # Create user
    New-ADUser `
        -Name "$firstName $lastName" `
        -GivenName $firstName `
        -Surname $lastName `
        -SamAccountName $username `
        -UserPrincipalName "$username@lab.local" `
        -Path $ouPath `
        -AccountPassword $password `
        -Enabled $true `
        -ChangePasswordAtLogon $true `
        -PassThru |
    Out-Null

    Write-Output "Created: $username in $ouPath"
}
