#!/bin/bash

################################################################################
# Cyberpunk Kali Linux Hyprland Setup Installer
# 
# This script automates the complete installation and configuration of a
# modern, neon-themed Hyprland desktop environment on Kali Linux
################################################################################

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Functions
print_header() {
    echo -e "\n${CYAN}╔════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${NC}  $1"
    echo -e "${CYAN}╚════════════════════════════════════════════════╝${NC}\n"
}

print_step() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

# Check if running on Kali Linux
if ! grep -qi "kali" /etc/os-release; then
    print_warning "This script is designed for Kali Linux"
    print_warning "It may work on other Debian-based distros, but use at your own risk"
    read -p "Continue anyway? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_error "Installation cancelled"
        exit 1
    fi
fi

# Check if running as root or with sudo
if [[ $EUID -ne 0 ]]; then
   print_error "This script must be run as root or with sudo"
   exit 1
fi

print_header "CYBERPUNK KALI LINUX HYPRLAND SETUP INSTALLER"
echo -e "${CYAN}Setting up your neon-lit hacker paradise...${NC}\n"

# Step 1: System Update
print_header "STEP 1: System Update"
print_step "Updating package lists..."
apt update -qq
print_step "Upgrading system packages..."
apt upgrade -y -qq

# Step 2: Install Core Dependencies
print_header "STEP 2: Installing Core Dependencies"
print_step "Installing build tools and development libraries..."
apt install -y -qq \
    git curl wget unzip build-essential gcc make pkg-config \
    libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev

# Step 3: Install Hyprland
print_header "STEP 3: Installing Hyprland Window Manager"
print_step "Installing Hyprland and Wayland support..."
apt install -y -qq \
    hyprland \
    xdg-desktop-portal-hyprland \
    xdg-utils \
    polkit-kde-agent

# Step 4: Install Terminal & Shell Tools
print_header "STEP 4: Installing Terminal & Shell Tools"
print_step "Installing Kitty terminal..."
apt install -y -qq kitty

print_step "Installing Zsh shell..."
apt install -y -qq zsh

print_step "Installing Starship prompt..."
curl -sS https://starship.rs/install.sh | sh -s -- -y > /dev/null 2>&1 || print_warning "Starship installation had issues"

# Step 5: Install Launcher & Bar
print_header "STEP 5: Installing Launcher & Status Bar"
print_step "Installing Rofi application launcher..."
apt install -y -qq rofi

print_step "Installing Waybar status bar..."
apt install -y -qq waybar

# Step 6: Install System Utilities
print_header "STEP 6: Installing System Utilities"
apt install -y -qq \
    brightnessctl \
    pamixer \
    pavucontrol \
    thunar \
    neofetch \
    fastfetch \
    network-manager \
    htop \
    btop \
    wl-clipboard \
    swaylock \
    swaybg \
    imagemagick

# Step 7: Install Fonts & Icons
print_header "STEP 7: Installing Fonts & Icon Themes"
print_step "Installing JetBrains Mono and FiraCode fonts..."
apt install -y -qq \
    fonts-jetbrains-mono \
    fonts-firacode \
    fonts-noto \
    fonts-noto-color-emoji

print_step "Installing Papirus icon theme..."
apt install -y -qq papirus-icon-theme adwaita-icon-theme

# Step 8: Copy Configuration Files
print_header "STEP 8: Copying Configuration Files"

# Get the script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if configs directory exists
if [ ! -d "$SCRIPT_DIR/configs" ]; then
    print_error "configs directory not found at $SCRIPT_DIR/configs"
    print_error "Make sure you're running this from the repository root"
    exit 1
fi

# Get current user (in case script is run with sudo)
if [ -n "$SUDO_USER" ]; then
    CURRENT_USER=$SUDO_USER
    USER_HOME=$(eval echo ~$SUDO_USER)
else
    CURRENT_USER=$USER
    USER_HOME=$HOME
fi

print_step "Creating config directories..."
mkdir -p $USER_HOME/.config/{hypr,waybar,rofi,kitty,starship}

print_step "Copying Hyprland config..."
cp $SCRIPT_DIR/configs/hypr/* $USER_HOME/.config/hypr/ 2>/dev/null || print_warning "Some Hyprland configs may not exist yet"

print_step "Copying Waybar config..."
cp $SCRIPT_DIR/configs/waybar/* $USER_HOME/.config/waybar/ 2>/dev/null || print_warning "Some Waybar configs may not exist yet"

print_step "Copying Rofi config..."
cp $SCRIPT_DIR/configs/rofi/* $USER_HOME/.config/rofi/ 2>/dev/null || print_warning "Some Rofi configs may not exist yet"

print_step "Copying Kitty config..."
cp $SCRIPT_DIR/configs/kitty/* $USER_HOME/.config/kitty/ 2>/dev/null || print_warning "Some Kitty configs may not exist yet"

print_step "Copying Starship config..."
cp $SCRIPT_DIR/configs/starship/starship.toml $USER_HOME/.config/starship.toml 2>/dev/null || print_warning "Starship config may not exist yet"

# Step 9: Set Permissions
print_header "STEP 9: Setting Permissions"
print_step "Fixing file ownership..."
chown -R $CURRENT_USER:$CURRENT_USER $USER_HOME/.config/hypr
chown -R $CURRENT_USER:$CURRENT_USER $USER_HOME/.config/waybar
chown -R $CURRENT_USER:$CURRENT_USER $USER_HOME/.config/rofi
chown -R $CURRENT_USER:$CURRENT_USER $USER_HOME/.config/kitty
chown -R $CURRENT_USER:$CURRENT_USER $USER_HOME/.config/starship.toml

# Step 10: Set Zsh as Default Shell
print_header "STEP 10: Setting Zsh as Default Shell"
print_step "Changing default shell to Zsh..."
chsh -s $(which zsh) $CURRENT_USER

# Step 11: Copy wallpaper if it exists
if [ -f "$SCRIPT_DIR/configs/wallpaper.jpg" ]; then
    print_step "Copying wallpaper..."
    cp $SCRIPT_DIR/configs/wallpaper.jpg $USER_HOME/.config/hypr/ 2>/dev/null
    chown $CURRENT_USER:$CURRENT_USER $USER_HOME/.config/hypr/wallpaper.jpg
fi

# Step 12: Rebuild font cache
print_header "STEP 11: Rebuilding Font Cache"
print_step "This may take a moment..."
fc-cache -fv > /dev/null 2>&1

# Final message
print_header "✨ INSTALLATION COMPLETE! ✨"
echo -e "${GREEN}Your Cyberpunk Kali Linux Hyprland setup is ready!${NC}\n"
echo -e "${CYAN}Next Steps:${NC}"
echo -e "  1. ${YELLOW}Reboot your system:${NC}"
echo -e "     ${CYAN}reboot${NC}"
echo -e ""
echo -e "  2. ${YELLOW}At the login screen, select:${NC}"
echo -e "     ${CYAN}Hyprland${NC} (from the session selector)"
echo -e ""
echo -e "  3. ${YELLOW}Log in with your credentials${NC}"
echo -e ""
echo -e "  4. ${YELLOW}Press Super (Windows Key) to open the app launcher!${NC}"
echo -e ""
echo -e "${CYAN}Essential Keybinds:${NC}"
echo -e "  ${YELLOW}Super + Return${NC}    → Open Terminal"
echo -e "  ${YELLOW}Super + Space${NC}     → Open App Launcher (Rofi)"
echo -e "  ${YELLOW}Super + Arrow${NC}    → Move Windows"
echo -e "  ${YELLOW}Super + 1-9${NC}      → Switch Workspaces"
echo -e "  ${YELLOW}Super + L${NC}        → Lock Screen"
echo -e "  ${YELLOW}Super + Q${NC}        → Quit Hyprland"
echo -e ""
echo -e "${CYAN}Customize Your Setup:${NC}"
echo -e "  Edit config files in: ${YELLOW}~/.config/hypr/${NC}"
echo -e "  Edit Waybar config in: ${YELLOW}~/.config/waybar/${NC}"
echo -e "  Edit Rofi theme in: ${YELLOW}~/.config/rofi/${NC}"
echo -e ""
echo -e "${GREEN}Happy Hacking! 🔥${NC}\n"
