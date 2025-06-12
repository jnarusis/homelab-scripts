# welcome-logon-script.ps1
# Displays a welcome message and logs the username and timestamp to a local file

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$username = $env:USERNAME
$logPath = "C:\Users\$username\Desktop\welcome_log.txt"

Add-Content -Path $logPath -Value "Welcome $username! You logged in at $timestamp."

[System.Windows.MessageBox]::Show("Welcome to the system, $username!", "Login Notification", 'OK', 'Information')
