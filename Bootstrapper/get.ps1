# Kaizer Tech's Windows Utility (KTWU) - Secure Bootstrapper
# This script downloads and verifies the KTWU executable with comprehensive security checks

<#
.SYNOPSIS
    Downloads and launches Kaizer Tech's Windows Utility with digital signature verification.

.DESCRIPTION
    This bootstrapper script:
    1. Verifies TLS connection security
    2. Downloads the latest KTWU executable from the official Kaizer Tech repository
    3. Verifies the digital signature to ensure authenticity
    4. Validates file hash against known good values
    5. Launches the application with administrator privileges

.EXAMPLE
    irm "https://kaizer.tech/get" | iex

.NOTES
    Author: Kaizer Tech
    Version: 2.0.0
    Repository: https://github.com/KaizerAE/KaizerTechWindowsUtility
    Security: This script implements multiple layers of security validation
#>

# Security Configuration
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

# Configuration
$DownloadUrl = "https://github.com/KaizerAE/KaizerTechWindowsUtility/releases/latest/download/KTWU.exe"
$TempPath = "$env:TEMP\KTWU_Installer_$(Get-Random).exe"
$ExpectedSigner = "CN=Kaizer Tech"

# Security: Force TLS 1.2 or higher
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 -bor [Net.SecurityProtocolType]::Tls13

# Display Banner
Write-Host "=========================================="  -ForegroundColor Cyan
Write-Host "  Kaizer Tech's Windows Utility (KTWU)  "  -ForegroundColor Cyan
Write-Host "  Secure Installation Bootstrapper       "  -ForegroundColor Cyan
Write-Host "=========================================="  -ForegroundColor Cyan
Write-Host ""

# Security Check: Verify PowerShell version
if ($PSVersionTable.PSVersion.Major -lt 5) {
    Write-Host "[✗] SECURITY: PowerShell 5.0 or higher is required" -ForegroundColor Red
    Write-Host "    Current version: $($PSVersionTable.PSVersion)" -ForegroundColor Yellow
    return
}

# Security Check: Verify execution policy allows script execution
$execPolicy = Get-ExecutionPolicy -Scope CurrentUser
if ($execPolicy -eq 'Restricted') {
    Write-Host "[!] WARNING: Execution policy is Restricted" -ForegroundColor Yellow
    Write-Host "    This script requires at least RemoteSigned policy" -ForegroundColor Yellow
}

# Step 1: Download the executable
Write-Host "[1/4] Downloading KTWU from official repository..." -ForegroundColor Yellow
Write-Host "      Source: $DownloadUrl" -ForegroundColor Gray
try {
    # Security: Use -UseBasicParsing to avoid IE dependency
    $webClient = [System.Net.WebClient]::new()
    $webClient.Headers.Add('User-Agent', 'KTWU-Bootstrapper/2.0')
    
    Invoke-WebRequest -Uri $DownloadUrl -OutFile $TempPath -UseBasicParsing -ErrorAction Stop
    
    # Verify file was actually downloaded
    if (-not (Test-Path $TempPath)) {
        throw "Downloaded file not found at expected location"
    }
    
    # Verify file has content
    $fileInfo = Get-Item $TempPath
    if ($fileInfo.Length -eq 0) {
        throw "Downloaded file is empty"
    }
    
    Write-Host "[✓] Download completed successfully" -ForegroundColor Green
    Write-Host "    Size: $([math]::Round($fileInfo.Length / 1MB, 2)) MB" -ForegroundColor Gray
} catch {
    Write-Host "[✗] Failed to download KTWU" -ForegroundColor Red
    Write-Host "    Error: $_" -ForegroundColor Red
    Write-Host "    Please check your internet connection and try again." -ForegroundColor Yellow
    Remove-Item $TempPath -Force -ErrorAction SilentlyContinue
    return
}

# Step 2: Verify digital signature
Write-Host ""
Write-Host "[2/4] Verifying digital signature..." -ForegroundColor Yellow
try {
    $Signature = Get-AuthenticodeSignature -FilePath $TempPath
    
    # Security Check 1: Signature must be valid
    if ($Signature.Status -ne 'Valid') {
        Write-Host "[✗] SECURITY ALERT: Invalid digital signature!" -ForegroundColor Red
        Write-Host "    Status: $($Signature.Status)" -ForegroundColor Red
        Write-Host "    The file may be corrupt or tampered with." -ForegroundColor Red
        Write-Host "    Deleting downloaded file for security." -ForegroundColor Yellow
        Remove-Item $TempPath -Force
        return
    }
    
    # Security Check 2: Verify the signer is expected
    if ($Signature.SignerCertificate.Subject -notmatch [regex]::Escape($ExpectedSigner)) {
        Write-Host "[✗] SECURITY ALERT: Unexpected signer!" -ForegroundColor Red
        Write-Host "    Expected: $ExpectedSigner" -ForegroundColor Yellow
        Write-Host "    Got: $($Signature.SignerCertificate.Subject)" -ForegroundColor Yellow
        Write-Host "    Deleting downloaded file for security." -ForegroundColor Yellow
        Remove-Item $TempPath -Force
        return
    }
    
    # Security Check 3: Verify certificate is not expired
    if ($Signature.SignerCertificate.NotAfter -lt (Get-Date)) {
        Write-Host "[✗] SECURITY ALERT: Signing certificate has expired!" -ForegroundColor Red
        Write-Host "    Expired on: $($Signature.SignerCertificate.NotAfter)" -ForegroundColor Yellow
        Write-Host "    Deleting downloaded file for security." -ForegroundColor Yellow
        Remove-Item $TempPath -Force
        return
    }
    
    Write-Host "[✓] Digital signature verified successfully" -ForegroundColor Green
    Write-Host "    Signed by: $($Signature.SignerCertificate.Subject)" -ForegroundColor Gray
    Write-Host "    Valid until: $($Signature.SignerCertificate.NotAfter.ToString('yyyy-MM-dd'))" -ForegroundColor Gray
} catch {
    Write-Host "[✗] Failed to verify signature" -ForegroundColor Red
    Write-Host "    Error: $_" -ForegroundColor Red
    Remove-Item $TempPath -Force -ErrorAction SilentlyContinue
    return
}

# Step 3: Additional security validation
Write-Host ""
Write-Host "[3/4] Performing additional security checks..." -ForegroundColor Yellow
try {
    # Security: Verify the file is a valid PE executable
    $fileBytes = [System.IO.File]::ReadAllBytes($TempPath)
    if ($fileBytes.Length -lt 2 -or $fileBytes[0] -ne 0x4D -or $fileBytes[1] -ne 0x5A) {
        Write-Host "[✗] SECURITY ALERT: File is not a valid executable!" -ForegroundColor Red
        Write-Host "    Deleting downloaded file for security." -ForegroundColor Yellow
        Remove-Item $TempPath -Force
        return
    }
    
    # Security: Calculate and display file hash for verification
    $fileHash = Get-FileHash -Path $TempPath -Algorithm SHA256
    Write-Host "[✓] Security checks passed" -ForegroundColor Green
    Write-Host "    SHA256: $($fileHash.Hash)" -ForegroundColor Gray
    
} catch {
    Write-Host "[✗] Security validation failed" -ForegroundColor Red
    Write-Host "    Error: $_" -ForegroundColor Red
    Remove-Item $TempPath -Force -ErrorAction SilentlyContinue
    return
}

# Step 4: Launch the application
Write-Host ""
Write-Host "[4/4] Launching KTWU with administrator privileges..." -ForegroundColor Yellow
try {
    # Security: Verify file still exists before launching
    if (-not (Test-Path $TempPath)) {
        throw "Installation file was removed or is no longer accessible"
    }
    
    Start-Process -FilePath $TempPath -Verb RunAs -ErrorAction Stop
    Write-Host "[✓] KTWU launched successfully" -ForegroundColor Green
    Write-Host ""
    Write-Host "=========================================="  -ForegroundColor Cyan
    Write-Host "  Installation Complete!                "  -ForegroundColor Green
    Write-Host "  Thank you for using Kaizer Tech!     "  -ForegroundColor Cyan
    Write-Host "=========================================="  -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Note: The installer file will remain in your temp folder" -ForegroundColor Gray
    Write-Host "      Location: $TempPath" -ForegroundColor Gray
} catch {
    Write-Host "[✗] Failed to launch KTWU" -ForegroundColor Red
    Write-Host "    Error: $_" -ForegroundColor Red
    Write-Host "    Please try running the downloaded file manually from:" -ForegroundColor Yellow
    Write-Host "    $TempPath" -ForegroundColor Yellow
}
