# 🔥 Cyberpunk Kali Linux Desktop Environment

> A bleeding-edge, neon-lit Hyprland setup for maximum hacker aesthetic and productivity

![Status](https://img.shields.io/badge/Status-Active-brightgreen)
![Kali](https://img.shields.io/badge/OS-Kali%20Linux-blue)
![Hyprland](https://img.shields.io/badge/DE-Hyprland-purple)
![License](https://img.shields.io/badge/License-MIT-green)

## 🌟 Features

- **Lightning Fast**: Hyprland tiling window manager (ultra-low resource usage)
- **Cyberpunk Aesthetic**: Neon cyan/green with dark backgrounds
- **Fully Customizable**: All configs organized and easy to modify
- **Security-First**: Optimized for Kali Linux pentesting
- **Modern Tools**: Waybar, Rofi, Kitty, Zsh + Starship
- **One-Command Install**: Automated setup script

## 📦 What You Get

```
├── install.sh              # One-command installer
├── configs/
│   ├── hyprland.conf      # Main window manager config
│   ├── waybar/
│   │   ├── config.json    # Top bar configuration
│   │   └── style.css      # Neon theme styling
│   ├── rofi/
│   │   ├── config.rasi    # App launcher config
│   │   └── theme.rasi     # Cyberpunk color scheme
│   ├── kitty/
│   │   └── kitty.conf     # Terminal with neon colors
│   ├── starship/
│   │   └── starship.toml  # Shell prompt customization
│   └── wallpaper.jpg      # Default neon background
├── scripts/
│   ├── setup-theme.sh     # Theme installation
│   ├── keybinds.sh        # Keybinding helper
│   └── tweaks.sh          # Performance tuning
└── README.md              # This file
```

## ⚡ Quick Start (3 Steps)

### Step 1: Clone the Repository

```bash
git clone https://github.com/Dhanushkumar10-hub/hyprland-kali-setup.git
cd hyprland-kali-setup
git checkout cyberpunk-kali
```

### Step 2: Run the Installer

```bash
chmod +x install.sh
sudo ./install.sh
```

The installer will:
- ✅ Update system packages
- ✅ Install Hyprland and dependencies
- ✅ Install terminal tools (Kitty, Zsh, Starship)
- ✅ Install bar and launcher (Waybar, Rofi)
- ✅ Install fonts and themes
- ✅ Copy configs to your home folder
- ✅ Set permissions

### Step 3: Reboot and Login

```bash
reboot
```

After reboot:
1. At the login screen, select **Hyprland** session
2. Enter your credentials
3. Press **Super** (Windows key) to see the magic! ✨

---

## 🎮 Essential Keybindings

| Shortcut | Action |
|----------|--------|
| `Super + Return` | Open Terminal (Kitty) |
| `Super + Space` | Open App Launcher (Rofi) |
| `Super + D` | Show Desktop |
| `Super + 1-9` | Switch Workspace |
| `Super + Arrow Keys` | Move Windows |
| `Super + Ctrl + Arrow` | Resize Windows |
| `Super + F` | Fullscreen |
| `Super + V` | Toggle Floating |
| `Super + L` | Lock Screen |
| `Alt + F4` | Close Window |
| `Print` | Screenshot |
| `Super + Q` | Quit Hyprland |

---

## 🎨 Customization

### Change Color Scheme

Edit `~/.config/hypr/hyprland.conf`:

```conf
# Primary: Neon Cyan
$primary = rgb(00, 255, 255)

# Accent: Neon Green
$accent = rgb(00, 255, 100)

# Background: Deep Black
$background = rgb(10, 14, 20)
```

### Change Fonts

Edit `~/.config/kitty/kitty.conf`:

```conf
font_family      JetBrains Mono
font_size        11
```

Options: `FiraCode`, `Cascadia Code`, `Victor Mono`

### Change Wallpaper

```bash
cp /path/to/your/wallpaper.jpg ~/.config/hypr/wallpaper.jpg
```

Then restart Hyprland: `Super + Q` and log back in

---

## 📊 System Requirements

| Component | Minimum | Recommended |
|-----------|---------|-------------|
| RAM | 2GB | 4GB+ |
| CPU | Any modern | Multi-core |
| GPU | Integrated | Nvidia/AMD |
| Disk | 5GB | 20GB+ |
| Kernel | 5.15+ | 6.0+ |

---

## 🔧 Manual Installation (If Install Script Fails)

### 1. Update System

```bash
sudo apt update && sudo apt upgrade -y
```

### 2. Install Hyprland & Dependencies

```bash
sudo apt install -y \
  hyprland \
  xdg-desktop-portal-hyprland \
  rofi \
  waybar \
  kitty \
  zsh \
  brightnessctl \
  pavucontrol \
  thunar \
  neofetch \
  fastfetch \
  network-manager
```

### 3. Install Fonts & Themes

```bash
sudo apt install -y \
  fonts-jetbrains-mono \
  fonts-firacode \
  papirus-icon-theme \
  adwaita-icon-theme
```

### 4. Install Starship Prompt

```bash
curl -sS https://starship.rs/install.sh | sh
```

### 5. Copy Config Files

```bash
cd ~/hyprland-kali-setup
cp -r configs/hypr ~/.config/
cp -r configs/waybar ~/.config/
cp -r configs/rofi ~/.config/
cp -r configs/kitty ~/.config/
cp -r configs/starship ~/.config/
```

### 6. Set Zsh as Default Shell

```bash
chsh -s $(which zsh)
```

---

## 🐛 Troubleshooting

### Hyprland won't start

```bash
# Check for errors
HYPRLAND_LOG_WLR=1 hyprland 2>&1 | head -50

# Rebuild configs
rm ~/.config/hypr -rf
cp -r configs/hypr ~/.config/
```

### Waybar not showing

```bash
# Restart Hyprland
SuperKey + Q
# Log back in

# Or manually start
waybar &
```

### Rofi not launching

```bash
# Test rofi
rofi -show drun

# If error, reinstall
sudo apt reinstall rofi
```

### Terminal font looks weird

```bash
# Rebuild font cache
fc-cache -fv

# Restart Kitty
kill $(pgrep kitty)
kitty &
```

### GPU/Performance issues

Edit `~/.config/hypr/hyprland.conf`:

```conf
render {
    explicit_sync = 0
    direct_scanout = true
}
```

---

## 📚 Learn More

- [Hyprland Wiki](https://wiki.hyprland.org)
- [Waybar Documentation](https://github.com/Alexays/Waybar)
- [Rofi Manual](https://davatorium.github.io/rofi/)
- [Kitty Docs](https://sw.kovidgoyal.net/kitty/)
- [Kali Linux Docs](https://www.kali.org/docs/)

---

## 🤝 Contributing

Found a bug? Have a suggestion? Open an issue or PR!

```bash
git checkout -b feature/your-feature
git commit -m 'Add cool feature'
git push origin feature/your-feature
```

---

## 📄 License

MIT License - Feel free to use and modify!

---

## 🎯 Next Steps After Installation

1. **Customize Keybinds**: Edit `~/.config/hypr/hyprland.conf`
2. **Add Your Apps**: Edit Rofi config to include your tools
3. **Theme Everything**: Modify colors in all config files
4. **Add Widgets**: Extend Waybar with custom modules
5. **Optimize Performance**: Tweak Hyprland render settings

---

**Made with 💚 for Kali Linux hackers and pentesting professionals**
