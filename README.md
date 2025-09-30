# Wokwi Automation Script

🚀 **Complete Wokwi automation toolkit with installer**

## 📁 Project Files

- **`wokwi.exe`** - Main executable (9.4 MB) 
- **`wokwi_cli.py`** - Python CLI source code
- **`wokwi_standalone.py`** - Standalone version source
- **`setup.cmd`** - **NEW!** Installation script for system-wide setup
- **`build.py`** - Build script for creating executables
- **`demo_test.cmd`** - Demo script to test all features
- **`test_url.txt`** - Sample URL file for testing
- **`wokwi.toml`** - Configuration file

## 🚀 Installation

### 🛠️ **System-wide Installation (Recommended)**
1. **Run as Administrator:** Right-click `setup.cmd` → "Run as administrator"
2. **Automatic installation** to `C:\Program Files\WokwiTool`
3. **Adds to PATH** - Use `wokwi` command from anywhere
4. **Restart command prompt** for PATH changes to take effect

### 📂 **Portable Usage**
- Just run `wokwi.exe` directly from any folder

## 🎯 Usage

### 💻 Basic Commands
```cmd
# Show version
wokwi.exe version

# Show help
wokwi.exe help

# Setup firmware (auto scan)
wokwi.exe setup

# Download diagram from url.txt
wokwi.exe diagram

# Download diagram from specific file
wokwi.exe diagram ./my_url.txt

# Download diagram from direct URL
wokwi.exe diagram https://wokwi.com/projects/442394281549660161
```

### 🚀 Quick Start
1. **Install system-wide:** Run `setup.cmd` as administrator
2. **Or copy `wokwi.exe`** to your project directory  
3. **Run setup:** `wokwi setup` to scan firmware
4. **Download diagram:** `wokwi diagram url.txt` if needed

### 📋 Full Demo
```cmd
# Run demo test to see all features
demo_test.cmd
```

## 🔧 Development

### 🏗️ **Building from Source**
```cmd
# Install dependencies
pip install requests toml pyinstaller

# Build executables
python build.py
```

### 📝 **Configuration**
Edit `wokwi.toml` to customize:
- Default directories
- File patterns  
- Upload settings

## 🌟 Features

### ✅ **Universal Firmware Scanner**
- 🔍 Auto scan STM32 (`Debug/` folders) 
- 🔍 Auto scan ESP32/PlatformIO (`.pio/build/` folders)
- 🎯 Smart project detection
- 📋 Multiple firmware groups support
- 📝 Auto generate `wokwi.toml` with full info

### ✅ **Wokwi Diagram Downloader** 
- 📦 Download `diagram.json` from Wokwi projects
- 📁 Support file input (`./url.txt`)
- 🌐 Support direct URL input
- 📊 Show diagram statistics

### ✅ **File Input Support**
```cmd
# File input examples
wokwi.exe diagram ./project_url.txt
wokwi.exe diagram ../configs/wokwi_url.txt
wokwi.exe diagram https://wokwi.com/projects/123456789

# URL file format (any of these formats):
https://wokwi.com/projects/442394281549660161
442394281549660161
```

## 🛠️ Technical Details

- **Size:** ~9.4 MB (standalone, no Python required)
- **Platform:** Windows 64-bit
- **Dependencies:** None (self-contained)
- **Python version:** Built with Python 3.13.7
- **Build tool:** PyInstaller 6.16.0

## 🎪 Advanced Examples

### Automation Scripts
```cmd
REM Batch script automation
wokwi.exe setup
if %errorlevel% equ 0 (
    echo Setup successful!
    wokwi.exe diagram
) else (
    echo Setup failed!
)
```

### Multiple Projects
```cmd
REM Project A
cd ProjectA
wokwi.exe setup
wokwi.exe diagram project_a_url.txt

REM Project B  
cd ..\ProjectB
wokwi.exe setup
wokwi.exe diagram project_b_url.txt
```

## 🆚 Comparison with Python Scripts

| Feature | wokwi.exe | Python Scripts |
|---------|-----------|----------------|
| **Installation** | ✅ Ready-to-use | ❌ Requires Python |
| **Dependencies** | ✅ Self-contained | ❌ Need libraries |
| **Size** | ⚠️ 9.4 MB | ✅ <100 KB |
| **Startup** | ⚠️ ~2-3s | ✅ Instant |
| **Portability** | ✅ Runs anywhere | ❌ Need Python env |
| **File Input** | ✅ Full support | ⚠️ Limited |

## 🔧 Troubleshooting

### ❌ "Windows protected your PC"
**Solution:** Click "More info" → "Run anyway"

### ❌ Slow startup
**Reason:** PyInstaller extracting libraries on first run
**Solution:** Wait 2-3 seconds for first run

### ❌ Antivirus false positive
**Solution:** Add wokwi.exe to whitelist

## 📝 Changelog

### v2.0 - Standalone Executable
- ➕ Self-contained executable
- ➕ File input support (`wokwi diagram ./file.txt`)
- ➕ Direct URL support (`wokwi diagram https://...`)
- ➕ Embedded firmware scanner & diagram downloader
- ➕ No external dependencies
- ➕ Professional CLI interface

---

**🎉 Ready to use! Just run `wokwi.exe help` to get started**