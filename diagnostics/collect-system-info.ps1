# Read-only WSL2 and Docker diagnostic snapshot.
# Run from PowerShell. Some checks may require an elevated PowerShell window.
# Review the output before sharing it; it can contain machine-specific details.

$ErrorActionPreference = "Continue"

Write-Host "`n=== WINDOWS ==="
Get-ComputerInfo |
    Select-Object WindowsProductName, WindowsVersion, OsBuildNumber

Write-Host "`n=== WSL STATUS ==="
wsl --status
wsl --version
wsl --list --verbose

Write-Host "`n=== WINDOWS FEATURES ==="
Get-WindowsOptionalFeature -Online |
    Where-Object FeatureName -in @(
        "VirtualMachinePlatform",
        "Microsoft-Windows-Subsystem-Linux"
    ) |
    Select-Object FeatureName, State

Write-Host "`n=== VIRTUALIZATION ==="
Get-CimInstance Win32_ComputerSystem |
    Select-Object HypervisorPresent

Write-Host "`n=== DOCKER CLI ==="
docker --version
docker info

Write-Host "`n=== WSL SERVICES ==="
Get-Service WslService, vmcompute, LxssManager `
    -ErrorAction SilentlyContinue |
    Select-Object Name, Status, StartType

Write-Host "`n=== END ==="
Write-Host "This script does not intentionally change system settings."
Write-Host "Review output for personal or machine-specific information before sharing."
