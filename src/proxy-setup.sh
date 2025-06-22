#!/bin/bash
# Proxy Manager Installer
# Licensed under MIT License (https://github.com/jokerknight/ProxyManager/blob/main/LICENSE)
# ==================================================
# Proxy Management System v1.6
# 代理管理系统 v1.6
# 
# Description: A lightweight proxy manager for Bash and Zsh
# 描述：用于 Bash 和 Zsh 的轻量级代理管理器
# 
# Features:
# 功能:
#   - Start/stop/toggle proxy settings
#    启动/停止/切换代理设置
#   - Auto-detect proxy port
#    自动检测代理端口
#   - Connection testing
#    连接测试
#   - Customizable aliases
#    可自定义别名
# 
# Author: baixiaosheng
# 作者：百晓生
# Repository: https://github.com/jokerknight/ProxyManager
# 仓库地址：https://github.com/jokerknight/ProxyManager
# ==================================================

# Current proxy address (default: 127.0.0.1:7890)
# 当前代理地址 (默认: 127.0.0.1:7890)
PROXY_ADDRESS="http://127.0.0.1:7890"
SOCKS_ADDRESS="socks5://127.0.0.1:7890"

# Detect best proxy config automatically
# 自动检测最佳代理配置
detect_proxy() {
  # Test common proxy ports: 7890, 7891,  7892,7893,8888, 8080
  # 测试常见代理端口: 7890, 7891, 7892,7893,8888, 8080
  for port in {7890,7891,7892,7893,8888,8080}; do
    if curl -s --proxy "http://127.0.0.1:$port" https://example.com >/dev/null 2>&1; then
      PROXY_ADDRESS="http://127.0.0.1:$port"
      SOCKS_ADDRESS="socks5://127.0.0.1:$port"
      echo "[Proxy] Auto detected port: $port" >&2
      return
    fi
  done
  # If no proxy detected, keep default settings
  # 如果未检测到代理，保留默认设置
  echo "[Proxy] ⚠️ No proxy detected, using default settings" >&2
}

# Start proxy settings
# 启动代理设置
start_proxy() {
  # Detect best proxy configuration
  # 检测最佳代理配置
  detect_proxy
  
  # Set environment variables
  # 设置环境变量
  export http_proxy="$PROXY_ADDRESS"
  export HTTP_PROXY="$PROXY_ADDRESS"
  export https_proxy="$PROXY_ADDRESS"
  export HTTPS_PROXY="$PROXY_ADDRESS"
  export all_proxy="$SOCKS_ADDRESS"
  export ALL_PROXY="$SOCKS_ADDRESS"
  
  # Display status
  # 显示状态
  echo "[Proxy] ✔️ Active - using $PROXY_ADDRESS"

  proxy_status
}

# Stop proxy settings
# 停止代理设置
stop_proxy() {
  # Unset environment variables
  # 取消环境变量设置
  unset http_proxy HTTP_PROXY https_proxy HTTPS_PROXY all_proxy ALL_PROXY
  
  # Display status
  # 显示状态
  echo "[Proxy] ✖️ Disabled"
  proxy_status
}

# Show proxy status
# 显示代理状态
proxy_status() {
  if [ -n "$http_proxy" ]; then
    echo "[Proxy] Current Status: ACTIVE"
    echo " - HTTP:  $http_proxy"
    echo " - HTTPS: $https_proxy"
    echo " - SOCKS: $all_proxy"
  else
    echo "[Proxy] Current Status: INACTIVE"
  fi
  
  # Test basic internet connection
  # 测试基本网络连接
  echo "[Test] Checking connectivity:"
  if curl -Is --max-time 3 https://ip.sb >/dev/null; then
    echo "  ✔️ General internet access"
  else
    echo "  ❌ No internet access"
  fi
  
  # Test proxy connection (only if active)
  # 测试代理连接（仅在激活状态）
  if [ -n "$http_proxy" ]; then
    if curl -Is --proxy "$PROXY_ADDRESS" https://www.google.com >/dev/null 2>&1; then
      echo "  ✔️ Proxy working (Google accessible)"
    else
      echo "  ❌ Proxy not working (Google blocked)"
    fi
  fi

   echo "  - IP: $(curl -4 api.ipify.org)"

}

# Toggle proxy status
# 切换代理状态
toggle_proxy() {
  if [ -n "$http_proxy" ]; then
    stop_proxy
  else
    start_proxy
  fi
}

# Set custom proxy address
# 设置自定义代理地址
set_proxy() {
  if [ -n "$1" ]; then
    # Format: host:port
    # 格式: 主机:端口
    PROXY_ADDRESS="http://$1"
    SOCKS_ADDRESS="socks5://$1"
    echo "[Proxy] Set to: $PROXY_ADDRESS"
    
    # Start with new settings
    # 使用新设置启动
    start_proxy
  else
    echo "Usage: set_proxy [host:port]"
    echo "Current: ${PROXY_ADDRESS#http://}"
  fi
}

# Display help information
# 显示帮助信息
show_help() {
  echo "Proxy Management Commands (代理管理命令):"
  echo "  pstart    - Enable proxy (启用代理)"
  echo "  pstop     - Disable proxy (禁用代理)"
  echo "  ptoggle   - Toggle proxy (切换代理状态)"
  echo "  pstatus   - Show proxy status (显示代理状态)"
  echo "  pset      - Set custom proxy address (设置自定义代理)"
  echo "  phelp     - Show this help (显示帮助信息)"
  echo ""
  echo "Quick Start (快速开始):"
  echo "  pstart      # Enable proxy (启用代理)"
  echo "  pstatus     # Check status (查看状态)"
  echo "  pset 192.168.1.100:8888 # Set custom proxy (设置代理)"
}

# Configure aliases for quick access
# 为快速访问配置别名
alias pstart='start_proxy'
alias pstop='stop_proxy'
alias ptoggle='toggle_proxy'
alias pstatus='proxy_status'
alias pset='set_proxy'
alias phelp='show_help'

# 添加到提示符 (可选)
proxy_prompt() {
  if [[ -n "$http_proxy" ]]; then
    echo "[PROXY]"
  else
    echo ""
  fi
}

# 自定义终端提示符，显示代理状态
if [ -n "$ZSH_VERSION" ]; then
  # 对于Zsh用户:
  PROMPT='%B%F{green}%(?.✔.%F{red}✘)%f%b %F{blue}%1~%f %F{yellow}$(proxy_prompt)%f%# '
fi
if [ -n "$BASH_VERSION" ]; then
  # 对于Bash用户:
  PROMPT_COMMAND='PS1="\[\e[32m\]\$(if [[ -n \$http_proxy ]]; then echo ✔; else echo ✘; fi) \[\e[34m\]\w \[\e[33m\]\$(proxy_prompt)\[\e[0m\] \$ "'
fi


# Initial message when loaded
# 加载时显示初始消息
echo "[Proxy] Manager loaded. Type 'phelp' for commands."
echo "[代理] 管理器已加载。输入 'phelp' 查看命令。"