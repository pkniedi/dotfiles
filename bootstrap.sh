#!/bin/bash

# Function to install Ansible on Arch Linux
install_ansible_arch() {
    echo "Installing Ansible Core on Arch Linux..."
    sudo pacman -S --noconfirm ansible-core
}

# Function to install Ansible on macOS
install_ansible_macos() {
    echo "Installing Ansible Core on macOS..."
    if ! command -v brew &> /dev/null; then
        echo "Homebrew not found. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install ansible
}

# Function to install Ansible on Raspberry Pi (Raspberry Pi OS/Debian-based)
install_ansible_raspberry_pi() {
    echo "Installing Ansible Core on Raspberry Pi OS..."
    sudo apt update
    sudo apt install -y software-properties-common # used for adding PPAs (Personal Package Archives)
    sudo apt install -y ansible
}

# Detect the OS
OS=$(uname -s)
case "$OS" in
    Linux)
        # Check if it's Arch Linux
        if [ -f /etc/arch-release ]; then
            install_ansible_arch
        elif [ -f /etc/debian_version ]; then
            # Check if it's Raspberry Pi OS (Debian-based)
            if [ -f /proc/device-tree/model ] && grep -qi "raspberry pi" /proc/device-tree/model; then
                install_ansible_raspberry_pi
            else
                echo "Unknown Linux distribution. Exiting..."
                exit 1
            fi
        else
            echo "Unknown Linux distribution. Exiting..."
            exit 1
        fi
        ;;
    Darwin)
        # macOS
        install_ansible_macos
        ;;
    *)
        echo "Unsupported OS. Exiting..."
        exit 1
        ;;
esac

echo "Ansible Core installation complete!"

