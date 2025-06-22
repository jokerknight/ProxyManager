# Proxy Management Script (代理管理脚本)

A lightweight, powerful proxy management script for Bash and Zsh, supporting auto-detection of proxy ports and easy commands.

一个轻量级、功能强大的代理管理脚本，适用于 Bash 和 Zsh，支持自动检测代理端口和简单命令操作。

## Features (功能)

- 🚀 Start/stop/toggle proxy settings with single commands  
  一键启动/停止/切换代理设置  
- 🔍 Auto-detect proxy port (7890, 7891, 8888, 8080)  
  自动检测代理端口 (7890, 7891, 8888, 8080)  
- 📊 Detailed proxy status information  
  详细的代理状态信息  
- 🌐 Test internet and proxy connections  
  测试互联网和代理连接  
- ⚙️ Set custom proxy address  
  设置自定义代理地址  
- 🔄 Toggle proxy status  
  切换代理状态  

## Installation (安装方法)

### One-line Install (一行命令安装)

```bash
bash <(curl -Ls https://raw.githubusercontent.com/yourusername/proxy-manager/main/install.sh)
```

### Manual Install (手动安装)

1. Clone repository:  
   克隆仓库:
   ```bash
   git clone https://github.com/yourusername/proxy-manager.git
   cd proxy-manager
   ```

2. Run installer:  
   运行安装程序:
   ```bash
   ./install.sh
   ```

3. Reload your shell:  
   重新加载您的 shell:
   ```bash
   source ~/.zshrc  # or source ~/.bashrc
   ```

## Usage (使用方法)

| Command (命令) | Description (描述) | Example (示例) |
|----------------|-------------------|---------------|
| `pstart`       | Enable proxy<br>启用代理 | `pstart` |
| `pstop`        | Disable proxy<br>禁用代理 | `pstop` |
| `ptoggle`      | Toggle proxy<br>切换代理状态 | `ptoggle` |
| `pstatus`      | Show proxy status<br>显示代理状态 | `pstatus` |
| `pset`         | Set custom proxy<br>设置自定义代理 | `pset 192.168.1.100:8888` |
| `phelp`        | Show help<br>显示帮助信息 | `phelp` |

## Uninstallation (卸载)

```bash
./install.sh uninstall
```

## Supported Environments (支持环境)

- ✔️ macOS (Terminal, iTerm2)
- ✔️ Linux (Ubuntu, Debian, CentOS, etc.)
- ✔️ Windows Subsystem for Linux (WSL)

## Project Structure (项目结构)

```
proxy-manager/
├── LICENSE                 # MIT License
├── README.md               # Bilingual documentation (中英文文档)
├── README_CN.md            # Chinese documentation (中文文档)
├── install.sh              # Installation script (安装脚本)
└── src/
    └── proxy-setup.sh      # Core proxy management (核心代理管理)
```

## Contributing (贡献)

Contributions are welcome! Please open an issue or submit a pull request.  
欢迎贡献！请提交 issue 或 pull request。

[View on GitHub](https://github.com/yourusername/proxy-manager)

## License (许可证)

This project is licensed under the MIT License.  
本项目基于 MIT 许可证。

See [LICENSE](LICENSE) for more information.  
查看 [LICENSE](LICENSE) 了解更多信息。