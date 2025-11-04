# Kaizer Tech's Windows Utility (KTWU) - Bootstrapper
# This script downloads and verifies the KTWU executable

<#
.SYNOPSIS
    Downloads and launches Kaizer Tech's Windows Utility with digital signature verification.

.DESCRIPTION
    This bootstrapper script:
    1. Downloads the latest KTWU executable from the official Kaizer Tech repository
    2. Verifies the digital signature to ensure authenticity
    3. Launches the application with administrator privileges

.EXAMPLE
    irm "https://kaizer.tech/get" | iex

.NOTES
    Author: Kaizer Tech
    Version: 1.0.0
    Repository: https://github.com/KaizerAE/KaizerTechWindowsUtility
#>

# Configuration
$DownloadUrl = "https://github.com/KaizerAE/KaizerTechWindowsUtility/releases/latest/download/KTWU.exe"
$TempPath = "$env:TEMP\KTWU_Installer.exe"
$ExpectedSigner = "CN=Kaizer Tech"

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  Kaizer Tech's Windows Utility (KTWU)  " -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Download the executable
Write-Host "[1/3] Downloading KTWU from official repository..." -ForegroundColor Yellow

try {
    Invoke-WebRequest -Uri $DownloadUrl -OutFile $TempPath -UseBasicParsing
    Write-Host "[✓] Download completed successfully" -ForegroundColor Green
} catch {
    Write-Host "[✗] Failed to download KTWU" -ForegroundColor Red
    Write-Host "Error: $_" -ForegroundColor Red
    Write-Host "Please check your internet connection and try again." -ForegroundColor Yellow
    return
}

# Step 2: Verify digital signature
Write-Host ""
Write-Host "[2/3] Verifying digital signature..." -ForegroundColor Yellow

try {
    $Signature = Get-AuthenticodeSignature -FilePath $TempPath
    
    if ($Signature.Status -ne 'Valid') {
        Write-Host "[✗] SECURITY ALERT: Invalid digital signature!" -ForegroundColor Red
        Write-Host "The file may be corrupt or tampered with." -ForegroundColor Red
        Write-Host "Deleting downloaded file for security." -ForegroundColor Yellow
        Remove-Item $TempPath -Force
        return
    }
    
    if ($Signature.SignerCertificate.Subject -notmatch [regex]::Escape($ExpectedSigner)) {
        Write-Host "[✗] SECURITY ALERT: Unexpected signer!" -ForegroundColor Red
        Write-Host "Expected: $ExpectedSigner" -ForegroundColor Yellow
        Write-Host "Got: $($Signature.SignerCertificate.Subject)" -ForegroundColor Yellow
        Write-Host "Deleting downloaded file for security." -ForegroundColor Yellow
        Remove-Item $TempPath -Force
        return
    }
    
    Write-Host "[✓] Digital signature verified successfully" -ForegroundColor Green
    Write-Host "    Signed by: $($Signature.SignerCertificate.Subject)" -ForegroundColor Gray
} catch {
    Write-Host "[✗] Failed to verify signature" -ForegroundColor Red
    Write-Host "Error: $_" -ForegroundColor Red
    Remove-Item $TempPath -Force -ErrorAction SilentlyContinue
    return
}

# Step 3: Launch the application
Write-Host ""
Write-Host "[3/3] Launching KTWU with administrator privileges..." -ForegroundColor Yellow

try {
    Start-Process -FilePath $TempPath -Verb RunAs
    Write-Host "[✓] KTWU launched successfully" -ForegroundColor Green
    Write-Host ""
    Write-Host "Thank you for using Kaizer Tech's Windows Utility!" -ForegroundColor Cyan
} catch {
    Write-Host "[✗] Failed to launch KTWU" -ForegroundColor Red
    Write-Host "Error: $_" -ForegroundColor Red
    Write-Host "Please try running the downloaded file manually from: $TempPath" -ForegroundColor Yellow
}
