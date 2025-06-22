#!/bin/bash
# Proxy Manager Installer
# Licensed under MIT License (https://github.com/jokerknight/proxy-manager/blob/main/LICENSE)
# Proxy Manager Installer
# 代理管理器安装程序

# Project repository URL
# 项目仓库URL
REPO_URL="https://github.com/jokerknight/proxy-manager"

# Installer version
# 安装程序版本
INSTALLER_VERSION="v1.1"

# Installation directory
# 安装目录
INSTALL_DIR="${HOME}/.proxy-manager"

# Source script location
# 源脚本位置
SOURCE_FILE="${INSTALL_DIR}/src/proxy-setup.sh"

# Colors for better output
# 用于更好输出的颜色
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Print colorized message
# 打印彩色消息
print_color() {
  local color=$1
  local msg=$2
  case $color in
    red)    printf "${RED}%s${NC}\n" "$msg" ;;
    green)  printf "${GREEN}%s${NC}\n" "$msg" ;;
    yellow) printf "${YELLOW}%s${NC}\n" "$msg" ;;
    *)      printf "%s\n" "$msg" ;;
  esac
}

# Detect user's shell
# 检测用户的shell
detect_shell() {
  case $SHELL in
    */bash) echo "bash" ;;
    */zsh)  echo "zsh" ;;
    *)      echo "unknown" ;;
  esac
}

# Find shell configuration file
# 查找shell配置文件
find_shell_config() {
  local shell_type=$1
  
  case $shell_type in
    bash)
      # Check for .bashrc, .bash_profile, .profile
      if [ -f "${HOME}/.bashrc" ]; then
        echo "${HOME}/.bashrc"
      elif [ -f "${HOME}/.bash_profile" ]; then
        echo "${HOME}/.bash_profile"
      elif [ -f "${HOME}/.profile" ]; then
        echo "${HOME}/.profile"
      else
        # Create .bashrc if none exists
        touch "${HOME}/.bashrc"
        echo "${HOME}/.bashrc"
      fi
      ;;
    zsh)
      if [ -f "${HOME}/.zshrc" ]; then
        echo "${HOME}/.zshrc"
      else
        # Create .zshrc if none exists
        touch "${HOME}/.zshrc"
        echo "${HOME}/.zshrc"
      fi
      ;;
    *)
      echo "unknown"
      ;;
  esac
}

# Install proxy manager
# 安装代理管理器
install_manager() {
  local shell_type=$(detect_shell)
  
  # Check if already installed
  # 检查是否已安装
  if [ -d "$INSTALL_DIR" ]; then
    print_color yellow "Proxy Manager seems to be already installed."
    print_color yellow "代理管理器似乎已经安装过了。"
  else
    # Create installation directory
    # 创建安装目录
    mkdir -p "$INSTALL_DIR/src"
  fi
  
  # Download latest version from GitHub
  # 从GitHub下载最新版本
  print_color yellow "Downloading Proxy Manager..."
  print_color yellow "下载代理管理器中..."
  
  # Download installer files
  # 下载安装文件
  curl -sL https://raw.githubusercontent.com/yourusername/proxy-manager/main/src/proxy-setup.sh -o "$SOURCE_FILE"
  chmod +x "$SOURCE_FILE"
  
  # Add to shell config file
  # 添加到shell配置文件
  local config_file=$(find_shell_config "$shell_type")
  
  if [ -f "$config_file" ]; then
    # Add source line if not already present
    # 如果尚不存在，添加源代码行
    if ! grep -q "SOURCE_FILE" "$config_file"; then
      echo -e "\n# Proxy Manager Configuration" >> "$config_file"
      echo "[ -f \"$SOURCE_FILE\" ] && source \"$SOURCE_FILE\"" >> "$config_file"
      print_color green "Added to $config_file"
      print_color green "已添加到 $config_file"
    else
      print_color yellow "Already configured in $config_file"
      print_color yellow "已在 $config_file 中配置过"
    fi
  fi
  
  print_color green "✅ Installation complete! Please restart your terminal or run:"
  print_color green "✅ 安装完成！请重启终端或运行："
  print_color green "source \"$SOURCE_FILE\""
}

# Uninstall proxy manager
# 卸载代理管理器
uninstall_manager() {
  local shell_type=$(detect_shell)
  local config_file=$(find_shell_config "$shell_type")
  
  # Remove source lines from config
  # 从配置中删除源代码行
  if [ -f "$config_file" ]; then
    sed -i '/Proxy Manager Configuration/d' "$config_file"
    sed -i '/SOURCE_FILE/d' "$config_file"
    print_color green "Removed from $config_file"
    print_color green "已从 $config_file 中移除"
  fi
  
  # Remove installation directory
  # 删除安装目录
  if [ -d "$INSTALL_DIR" ]; then
    rm -rf "$INSTALL_DIR"
    print_color green "Removed installation directory"
    print_color green "已删除安装目录"
  fi
  
  # Remove aliases from current session
  # 从当前会话中删除别名
  unset detect_proxy start_proxy stop_proxy proxy_status
  unset toggle_proxy set_proxy phelp
  unalias pstart pstop ptoggle pstatus pset phelp 2>/dev/null
  
  print_color green "✅ Uninstall complete!"
  print_color green "✅ 卸载完成！"
}

# Show help information
# 显示帮助信息
show_help() {
  echo "Proxy Manager Installer $INSTALLER_VERSION"
  echo "代理管理器安装程序 $INSTALLER_VERSION"
  echo "Usage: install.sh [option]"
  echo "用法: install.sh [选项]"
  echo
  echo "Options:"
  echo "选项:"
  echo "  install    - Install proxy manager (default)"
  echo "              - 安装代理管理器(默认)"
  echo "  uninstall  - Uninstall proxy manager"
  echo "              - 卸载代理管理器"
  echo "  help       - Show this help message"
  echo "              - 显示此帮助信息"
}

# Main script logic
# 主要脚本逻辑
case "$1" in
  help|--help|-h)
    show_help
    ;;
  uninstall|remove|--uninstall)
    uninstall_manager
    ;;
  *)
    install_manager
    ;;
esac