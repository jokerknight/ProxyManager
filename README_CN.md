中文 [English](README.md)
# 代理管理脚本

一个轻量级、功能强大的代理管理脚本，适用于 Bash 和 Zsh，一键配置 http_proxy,https_proxy,socks5_proxy,all_proxy. 带有一个 cli 快捷切换.

## 功能

- 🚀 一键启动/停止/切换代理设置  
- 🔍 自动检测代理端口 (支持7890, 7891, 7892,7893, 8888, 8080)  
- 📊 显示详细的代理状态信息  
- 🌐 测试互联网和代理连接  
- ⚙️ 支持设置自定义代理地址  
- 🔄 一键切换代理状态  

## 安装方法

### 一行命令安装

```bash
bash <(curl -Ls https://raw.githubusercontent.com/jokerknight/ProxyManager/main/install.sh)
```

### 手动安装

1. 克隆仓库:
   ```bash
   git clone https://github.com/jokerknight/ProxyManager.git
   cd ProxyManager
   ```

2. 运行安装脚本:
   ```bash
   ./install.sh
   ```

3. 重新加载您的 shell:
   ```bash
   source ~/.zshrc  # 或 source ~/.bashrc
   ```

## 使用方法

| 命令       | 描述             | 示例                |
|------------|------------------|---------------------|
| `pstart`   | 启用代理         | `pstart`            |
| `pstop`    | 禁用代理         | `pstop`             |
| `ptoggle`  | 切换代理状态     | `ptoggle`           |
| `pstatus`  | 显示代理状态     | `pstatus`           |
| `pset`     | 设置自定义代理   | `pset 192.168.1.100:8888` |
| `phelp`    | 显示帮助信息     | `phelp`             |

## 卸载方法

```bash
./install.sh uninstall
```

## 支持环境

- ✔️ macOS (Terminal, iTerm2)
- ✔️ Linux (Ubuntu, Debian, CentOS 等)
- ✔️ Windows Subsystem for Linux (WSL)

## 项目结构

```
ProxyManager/
├── LICENSE                 # MIT 许可证
├── README.md               # 中英文双语文档
├── README_CN.md            # 中文文档
├── install.sh               # 安装脚本
└── src/
    └── proxy-setup.sh      # 核心代理管理脚本
```

## 贡献

欢迎提交 issue 或 pull request 来改进本项目。

[在 GitHub 上查看](https://github.com/jokerknight/ProxyManager)

## 许可证

本项目基于 MIT 许可证。查看 [LICENSE](LICENSE) 文件了解更多信息。