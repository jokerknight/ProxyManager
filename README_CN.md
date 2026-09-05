中文 [English](README.md)
# 代理管理脚本

一个轻量级、功能强大的代理管理脚本，适用于 Bash 和 Zsh，一键配置 http_proxy,https_proxy,socks5_proxy,all_proxy. 带有一个 cli 快捷切换.

## 功能

- 🚀 一键启动/停止/切换代理设置  
- 🔍 从本地监听端口自动识别 HTTP 和 SOCKS5 代理
- 📊 显示详细的代理状态信息  
- 🌐 测试互联网和代理连接  
- ⚙️ 支持设置自定义代理地址  
- 🔄 一键切换代理状态  

## 安装方法

### 一行命令安装

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/jokerknight/ProxyCli/main/install.sh)
```

### 一行命令卸载

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/jokerknight/ProxyCli/main/install.sh) --uninstall
```

### 手动安装

1. 克隆仓库:
   ```bash
   git clone https://github.com/jokerknight/ProxyCli.git
   cd ProxyCli
   ```

2. 运行安装脚本:
   ```bash
   bash install.sh
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
| `pset`     | 设置自定义 HTTP/SOCKS 代理 | `pset username:password@server:port` |
| `pset --auto` | 恢复自动识别 | `pset --auto` |
| `pports` | 查看或修改扫描端口 | `pports 7890 1080 8080` |
| `phelp`    | 显示帮助信息     | `phelp`             |

## 代理识别

`pstart` 会优先复用已有代理环境或上次识别成功的端口，然后依次检测常见代理进程监听的端口、配置的候选端口以及其他本地监听端口。每个候选端口都会分别验证 HTTP 和 SOCKS5 协议。

默认候选端口为 `7890 7891 7892 7893 8888 8080`。需要时可在当前 shell 中修改：

```bash
pports 7890 1080 8080
```

直接执行 `pports` 可查看当前列表，执行 `pports --reset` 可恢复预设端口。使用 `pset host:port` 跳过自动识别，使用 `pset --auto` 恢复自动模式。

## 卸载方法

```bash
bash install.sh uninstall
```

## 支持环境

- ✔️ macOS (Terminal, iTerm2)
- ✔️ Linux (Ubuntu, Debian, CentOS 等)
- ✔️ Windows Subsystem for Linux (WSL)

## 项目结构

```
ProxyCli/
├── LICENSE                 # MIT 许可证
├── README.md               # 英文文档
├── README_CN.md            # 中文文档
├── install.sh               # 安装脚本
├── src/
│   └── proxy-setup.sh      # 核心代理管理脚本
└── tests/
    └── test_proxy_setup.sh # 离线 shell 回归测试
```

## 贡献

欢迎提交 issue 或 pull request 来改进本项目。

[在 GitHub 上查看](https://github.com/jokerknight/ProxyCli)

## 许可证

本项目基于 MIT 许可证。查看 [LICENSE](LICENSE) 文件了解更多信息。
