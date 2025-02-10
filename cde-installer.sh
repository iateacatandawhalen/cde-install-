#!/bin/bash

# Function to install CDE
install_cde() {
    echo "Installing CDE (Common Desktop Environment)..."
    sudo pacman -S --noconfirm cde
    echo "CDE installation completed!"
    move_config_cde
}

# Function to move CDE configuration to ~/.config
move_config_cde() {
    echo "Moving CDE configuration to ~/.config..."
    if [ -d "$HOME/.afterstep" ]; then
        mv "$HOME/.afterstep" "$HOME/.config/"
        ln -s "$HOME/.config/.afterstep" "$HOME/.afterstep"
        echo "CDE configuration moved to ~/.config/.afterstep"
    else
        echo "No existing CDE configuration found."
    fi
}

# Function to install OpenLook (legacy)
install_openlook() {
    echo "Installing OpenLook..."
    # OpenLook package may need special handling; this is just a placeholder
    echo "OpenLook is a legacy environment and might not be available in modern repos."
    echo "Proceeding with potential workaround..."
    # This would require additional manual steps or patched repositories
    move_config_openlook
}

# Function to move OpenLook configuration to ~/.config
move_config_openlook() {
    echo "Moving OpenLook configuration to ~/.config..."
    if [ -d "$HOME/.openlook" ]; then
        mv "$HOME/.openlook" "$HOME/.config/"
        ln -s "$HOME/.config/.openlook" "$HOME/.openlook"
        echo "OpenLook configuration moved to ~/.config/.openlook"
    else
        echo "No existing OpenLook configuration found."
    fi
}

# Function to install AfterStep
install_afterstep() {
    echo "Installing AfterStep..."
    sudo pacman -S --noconfirm afterstep
    echo "AfterStep installation completed!"
    move_config_afterstep
}

# Function to move AfterStep configuration to ~/.config
move_config_afterstep() {
    echo "Moving AfterStep configuration to ~/.config..."
    if [ -d "$HOME/.afterstep" ]; then
        mv "$HOME/.afterstep" "$HOME/.config/"
        ln -s "$HOME/.config/.afterstep" "$HOME/.afterstep"
        echo "AfterStep configuration moved to ~/.config/.afterstep"
    else
        echo "No existing AfterStep configuration found."
    fi
}

# Function to install Window Maker
install_windowmaker() {
    echo "Installing Window Maker..."
    sudo pacman -S --noconfirm windowmaker
    echo "Window Maker installation completed!"
    move_config_windowmaker
}

# Function to move Window Maker configuration to ~/.config
move_config_windowmaker() {
    echo "Moving Window Maker configuration to ~/.config..."
    if [ -d "$HOME/.windowmaker" ]; then
        mv "$HOME/.windowmaker" "$HOME/.config/"
        ln -s "$HOME/.config/.windowmaker" "$HOME/.windowmaker"
        echo "Window Maker configuration moved to ~/.config/.windowmaker"
    else
        echo "No existing Window Maker configuration found."
    fi
}

# Function to install Motif
install_motif() {
    echo "Installing Motif..."
    sudo pacman -S --noconfirm motif
    echo "Motif installation completed!"
    move_config_motif
}

# Function to move Motif configuration to ~/.config
move_config_motif() {
    echo "Moving Motif configuration to ~/.config..."
    if [ -f "$HOME/.Xresources" ]; then
        mv "$HOME/.Xresources" "$HOME/.config/"
        ln -s "$HOME/.config/.Xresources" "$HOME/.Xresources"
        echo "Motif configuration moved to ~/.config/.Xresources"
    else
        echo "No existing Motif configuration found."
    fi
}

# Function to install TWM (Tab Window Manager)
install_twm() {
    echo "Installing TWM (Tab Window Manager)..."
    sudo pacman -S --noconfirm twm
    echo "TWM installation completed!"
    move_config_twm
}

# Function to move TWM configuration to ~/.config
move_config_twm() {
    echo "Moving TWM configuration to ~/.config..."
    if [ -f "$HOME/.twmrc" ]; then
        mv "$HOME/.twmrc" "$HOME/.config/"
        ln -s "$HOME/.config/.twmrc" "$HOME/.twmrc"
        echo "TWM configuration moved to ~/.config/.twmrc"
    else
        echo "No existing TWM configuration found."
    fi
}

# Function to show menu
show_menu() {
    clear
    echo "--------------------------------------"
    echo " Classic desktop environment Installer"
    echo "--------------------------------------"
    echo "1) Install CDE (Common Desktop Environment)"
    echo "2) Install OpenLook (Legacy)"
    echo "3) Install AfterStep (NeXTSTEP inspired)"
    echo "4) Install Window Maker (NeXTSTEP inspired)"
    echo "5) Install Motif (Classic widget toolkit)"
    echo "6) Install TWM (Classic tab window manager)"
    echo "7) Exit"
    echo "--------------------------------------"
}

# Main installer function
main_installer() {
    while true; do
        show_menu
        read -p "Choose an option [1-7]: " choice
        case $choice in
            1)
                install_cde
                ;;
            2)
                install_openlook
                ;;
            3)
                install_afterstep
                ;;
            4)
                install_windowmaker
                ;;
            5)
                install_motif
                ;;
            6)
                install_twm
                ;;
            7)
                echo "Exiting installer. Goodbye!"
                exit 0
                ;;
            *)
                echo "Invalid option. Please choose a number between 1 and 7."
                ;;
        esac
    done
}

# Run the installer
main_installer
