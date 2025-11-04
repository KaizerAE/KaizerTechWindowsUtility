# 🚀 Kaizer Tech's Windows Utility (KTWU)

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![C#](https://img.shields.io/badge/language-C%23-239120.svg)](https://docs.microsoft.com/en-us/dotnet/csharp/)
[![WinUI 3](https://img.shields.io/badge/UI-WinUI%203-0078D4.svg)](https://microsoft.github.io/microsoft-ui-xaml/)

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

## 🏗️ Project Architecture

### Directory Structure

```
KaizerTechWindowsUtility/
├── .github/
│   └── workflows/          # GitHub Actions CI/CD
├── Bootstrapper/           # Application bootstrapper
├── KTWU.Core/             # Main application project
│   ├── Assets/            # Images, icons, and resources
│   ├── Models/            # Data models
│   │   ├── Tweak.cs               # Tweak definition model
│   │   ├── WingetApp.cs           # Winget application model
│   │   └── TweakHistoryEntry.cs   # Database history model
│   ├── Services/          # Business logic and services
│   │   ├── TweakService.cs        # Tweak loading and management
│   │   ├── PowerShellRunner.cs    # PowerShell execution service
│   │   ├── WingetService.cs       # Winget integration service
│   │   ├── MaintenanceService.cs  # System maintenance tools
│   │   └── DatabaseContext.cs     # Entity Framework DB context
│   ├── ViewModels/        # MVVM view models
│   └── Views/             # XAML UI pages
│       ├── TweaksPage.xaml        # System tweaks interface
│       ├── InstallPage.xaml       # Package installation UI
│       ├── MaintenancePage.xaml   # Maintenance tools UI
│       └── HistoryPage.xaml       # Change history and rollback
├── TweakManifests/        # JSON tweak definitions
│   ├── performance.json   # Performance optimizations
│   ├── privacy.json       # Privacy enhancements
│   └── explorer.json      # File Explorer customizations
├── KTWU.Core.sln         # Visual Studio solution
└── README.md             # This file
```

---

## 🔧 Technology Stack

### Core Technologies

- **Framework**: .NET 7.0+
- **UI Framework**: WinUI 3 (Windows App SDK)
- **Architecture**: MVVM (Model-View-ViewModel)
- **Database**: SQLite with Entity Framework Core
- **Package Manager**: NuGet

### Key NuGet Packages

```xml
<PackageReference Include="System.Management.Automation" Version="7.4.0" />
<PackageReference Include="Microsoft.EntityFrameworkCore.Sqlite" Version="8.0.0" />
<PackageReference Include="Microsoft.EntityFrameworkCore.Tools" Version="8.0.0" />
<PackageReference Include="Microsoft.WindowsAppSDK" Version="1.5.0" />
```

---

## 🎯 Core Components

### 1. Tweak System

The tweak system is powered by JSON manifests that define system modifications:

**Example: performance.json**
```json
[
  {
    "id": "PERF_001",
    "title": "Enable Ultimate Performance Plan",
    "description": "Activates the 'Ultimate Performance' power plan",
    "category": "Performance",
    "targetOS": ["Windows 10", "Windows 11"],
    "isDangerous": false,
    "actions": {
      "apply": [
        {
          "type": "powershell",
          "command": "powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61"
        }
      ],
      "revert": [
        {
          "type": "powershell",
          "command": "powercfg -delete e9a42b02-d5df-448d-aa00-03f14749eb61"
        }
      ]
    }
  }
]
```

### 2. Services Layer

#### TweakService
- Loads and parses JSON manifests from `TweakManifests/` folder
- Deserializes tweaks into `Tweak` model objects
- Provides async API for tweak retrieval

#### PowerShellRunner
- Executes PowerShell scripts asynchronously
- Captures output and error streams
- Provides real-time execution feedback

#### WingetService
- Wraps Windows Package Manager (winget.exe)
- Parses command-line output into structured data
- Provides search and installation capabilities

#### MaintenanceService
- Executes system maintenance commands (SFC, DISM)
- Provides live output streaming
- Requires administrator privileges

#### DatabaseContext (Entity Framework)
- SQLite database for change tracking
- Stores applied tweaks with revert actions
- Enables complete rollback functionality

---

## 🚀 Getting Started

### Prerequisites

- **Windows 10 (1809+)** or **Windows 11**
- **Visual Studio 2022** (17.8+) with:
  - .NET Desktop Development workload
  - Universal Windows Platform development workload
- **.NET 7.0 SDK** or later
- **PowerShell 7+** (for development/testing)

### Building the Project

1. **Clone the repository**
   ```bash
   git clone https://github.com/KaizerAE/KaizerTechWindowsUtility.git
   cd KaizerTechWindowsUtility
   ```

2. **Open in Visual Studio**
   ```bash
   start KTWU.Core.sln
   ```

3. **Restore NuGet packages**
   - Right-click solution → Restore NuGet Packages

4. **Setup database migrations** (Package Manager Console)
   ```powershell
   Add-Migration InitialCreate
   Update-Database
   ```

5. **Build and Run**
   - Press `F5` to build and launch
   - **Note**: Some features require administrator privileges

### Running as Administrator

For full functionality (system tweaks, maintenance tools), run as administrator:

1. Right-click project → Properties
2. Application → Manifest Tool → Input and Output
3. UAC Execution Level → `requireAdministrator`

---

## 📋 Usage Guide

### System Tweaks

1. Navigate to **Tweaks** page
2. Browse available optimizations by category
3. Select desired tweaks (dangerous ones are marked with ⚠️)
4. Click **Apply Selected Tweaks**
5. Changes are automatically logged to history

### Package Installation

1. Navigate to **Install** page
2. Search for applications (e.g., "PowerToys")
3. Select packages from search results
4. Click **Install Selected**
5. Monitor real-time installation progress

### System Maintenance

1. Navigate to **Maintenance** page
2. Choose maintenance tool:
   - **SFC Scan**: System File Checker
   - **DISM Restore**: Windows Image repair
3. View live output in console window

### Change History & Rollback

1. Navigate to **History** page
2. View all applied tweaks with timestamps
3. Click **Revert** on any entry to undo changes
4. Confirmation required for destructive operations

---

## 🔒 Security Considerations

### Safety Features

- ✅ All PowerShell scripts are sandboxed
- ✅ Registry modifications are validated before execution
- ✅ Dangerous operations require explicit user confirmation
- ✅ Complete audit trail in SQLite database
- ✅ Rollback capability for all changes

### Best Practices

- Always create a system restore point before applying tweaks
- Review tweak descriptions carefully
- Test on non-critical systems first
- Keep database backups (`ktwu_history.db`)

---

## 🛠️ Development

### Adding New Tweaks

1. Create/edit JSON file in `TweakManifests/`
2. Follow the schema:
   ```json
   {
     "id": "UNIQUE_ID",
     "title": "Tweak Name",
     "description": "What this does",
     "category": "Category Name",
     "targetOS": ["Windows 10", "Windows 11"],
     "isDangerous": false,
     "actions": {
       "apply": [{ "type": "powershell", "command": "..." }],
       "revert": [{ "type": "powershell", "command": "..." }]
     }
   }
   ```
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
- PowerShell team for System.Management.Automation
- Entity Framework Core team
- Windows Package Manager (winget) team

---

## 📧 Contact

**Kaizer AE**  
GitHub: [@KaizerAE](https://github.com/KaizerAE)

---

## ⚠️ Disclaimer

This tool modifies system settings. While designed with safety in mind:

- Always backup your system before use
- Use at your own risk
- The developers are not responsible for any damage or data loss
- Test thoroughly on non-production systems

---

**Made with ❤️ by Kaizer Tech**
