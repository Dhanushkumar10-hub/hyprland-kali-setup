# 🔥 Quick Start Guide - Cyberpunk Kali Linux Hyprland Setup

## If you're getting package errors, use this MANUAL method instead

This is the **guaranteed to work** approach that bypasses problematic packages.

---

## Step 1: Update Your System

```bash
sudo apt update
sudo apt upgrade -y
```

---

## Step 2: Install Only ESSENTIAL Packages

Copy and paste this ENTIRE command at once:

```bash
sudo apt install -y hyprland kitty zsh rofi waybar brightnessctl neofetch network-manager htop wl-clipboard swaylock swaybg fonts-jetbrains-mono papirus-icon-theme xdg-utils xdg-desktop-portal-hyprland
```

**This installs:**
- ✅ Hyprland (main DE)
- ✅ Kitty (terminal)
- ✅ Zsh (shell)
- ✅ Rofi (app launcher)
- ✅ Waybar (status bar)
- ✅ Essential utilities

**If ANY package fails to install, STOP and tell me which one.**

---

## Step 3: Install Starship Prompt

```bash
curl -sS https://starship.rs/install.sh | sh -s -- -y
```

---

## Step 4: Clone the Config Repository

```bash
cd ~
git clone https://github.com/Dhanushkumar10-hub/hyprland-kali-setup.git
cd hyprland-kali-setup
git checkout cyberpunk-kali
```

---

## Step 5: Create Config Directories

```bash
mkdir -p ~/.config/{hypr,waybar,rofi,kitty,starship}
```

---

## Step 6: Copy Configuration Files

```bash
cp configs/hypr/* ~/.config/hypr/
cp configs/waybar/* ~/.config/waybar/
cp configs/rofi/* ~/.config/rofi/
cp configs/kitty/* ~/.config/kitty/
cp configs/starship/starship.toml ~/.config/starship.toml
```

---

## Step 7: Set Zsh as Default Shell

```bash
sudo chsh -s $(which zsh) $USER
```

When asked for a password, enter your password and press Enter.

---

## Step 8: Rebuild Font Cache

```bash
fc-cache -fv
```

---

## Step 9: Reboot

```bash
sudo reboot
```

---

## Step 10: Select Hyprland at Login

1. **Wait for the login screen to appear**
2. **Look for a session selector** (usually bottom-left or gear icon)
3. **Select "Hyprland"** from the list
4. **Enter your username and password**
5. **Press Enter**

---

## 🎮 First Time Using Hyprland?

Once you log in, press these keys:

| Key Combination | What it does |
|---|---|
| `Super + Return` | Open Terminal |
| `Super + Space` | Open App Launcher |
| `Super + 1-9` | Switch Workspaces |
| `Super + Arrow Keys` | Move Windows |
| `Super + L` | Lock Screen |
| `Super + Q` | Close Hyprland |

---

## ❌ Hyprland Session Not Showing at Login?

Try this:

```bash
# Log in with whatever session is available
# Then open a terminal and run:

sudo apt install -y sddm
sudo systemctl enable sddm
sudo reboot
```

Then at the new login screen, you should see Hyprland as an option.

---

## 🔧 Troubleshooting

### "Hyprland command not found"
```bash
which hyprland
```
If it returns nothing, run:
```bash
sudo apt install -y hyprland
```

### "Kitty command not found"
```bash
sudo apt install -y kitty
```

### "Can't find wallpaper"
The wallpaper config points to `~/.config/hypr/wallpaper.jpg`

Either:
1. Add a wallpaper image there, or
2. Edit `~/.config/hypr/hyprland.conf` and remove/comment the wallpaper line:
```conf
# exec = swaybg -i ~/.config/hypr/wallpaper.jpg -m fill &
```

### "Rofi launcher not opening"
Test it manually:
```bash
rofi -show drun
```

If it works, check the keybind in `~/.config/hypr/hyprland.conf`

---

## 📝 Next Steps After Installation

1. **Customize colors**: Edit `~/.config/hypr/hyprland.conf`
2. **Customize keybinds**: Edit the same file
3. **Customize terminal**: Edit `~/.config/kitty/kitty.conf`
4. **Customize status bar**: Edit `~/.config/waybar/config.json`
5. **Customize launcher**: Edit `~/.config/rofi/config.rasi`

---

## 🎨 Changing Colors

Edit `~/.config/hypr/hyprland.conf` and find the color section:

```conf
# Colors
col.active_border = rgba(00ff66ff) rgba(00ffffff) 45deg
col.inactive_border = rgba(595959aa)
```

Change the hex colors:
- `00ff66` = Green
- `00ffff` = Cyan
- `ff0055` = Red/Pink

---

## ✅ Success!

If you can:
1. ✅ Log into Hyprland
2. ✅ Press Super and see Rofi launcher
3. ✅ Press Super+Return and get a terminal
4. ✅ See the status bar at the top

**Congratulations! Your setup is complete! 🎉**

---

## 🆘 Still Having Issues?

Reply with:
1. The exact error message you're getting
2. What step you're on
3. Output of: `uname -a`
4. Output of: `cat /etc/os-release`
5. Output of: `apt --version`

Then I can help you directly!
