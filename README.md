英文 [中文](README_CN) 
# Proxy Management Script

A lightweight, powerful proxy management script for Bash and Zsh, onekey config  http_proxy,https_proxy,socks5_proxy,all_proxy thought cli.

## Features

- 🚀 Start/stop/toggle proxy settings with single commands  
- 🔍 Auto-detect proxy port (7890, 7891, 7892,7893,8888, 8080)  
- 📊 Detailed proxy status information  
- 🌐 Test internet and proxy connections  
- ⚙️ Set custom proxy address  
- 🔄 Toggle proxy status  

## Installation 

### One-line Install 

```bash
bash <(curl -Ls https://raw.githubusercontent.com/jokerknight/ProxyManager/main/install.sh)
```

### Manual Install 

1. Clone repository:  

   ```bash
   git clone https://github.com/jokerknight/ProxyManager.git
   cd proxy-manager
   ```

2. Run installer:  

   ```bash
   ./install.sh
   ```

3. Reload your shell:  

   ```bash
   source ~/.zshrc  # or source ~/.bashrc
   ```

## Usage 

| Command  | Description| Example |
|----------------|-------------------|---------------|
| `pstart`       | Enable proxy<br> | `pstart` |
| `pstop`        | Disable proxy<br> | `pstop` |
| `ptoggle`      | Toggle proxy<br> | `ptoggle` |
| `pstatus`      | Show proxy status<br> | `pstatus` |
| `pset`         | Set custom proxy<br> | `pset 192.168.1.100:8888` |
| `phelp`        | Show help<br> | `phelp` |

## Uninstallation 

```bash
./install.sh uninstall
```

## Supported Environments

- ✔️ macOS (Terminal, iTerm2)
- ✔️ Linux (Ubuntu, Debian, CentOS, etc.)
- ✔️ Windows Subsystem for Linux (WSL)

## Project Structure

```
proxy-manager/
├── LICENSE                 # MIT License
├── README.md               # Bilingual documentation
├── README_CN.md            # Chinese documentation (中文文档)
├── install.sh              # Installation script
└── src/
    └── proxy-setup.sh      # Core proxy management 
```

## Contributing 

Contributions are welcome! Please open an issue or submit a pull request.  


[View on GitHub](https://github.com/jokerknight/ProxyManager)

## License 

This project is licensed under the MIT License.  

See [LICENSE](LICENSE) for more information.  
