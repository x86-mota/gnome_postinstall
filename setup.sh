#!/usr/bin/env bash

# ==================================================
# Defining variables
# ==================================================
distro_id=""
install_package=""
remove_package=""

source /etc/os-release

function is_based_distro() {
    if [ -n "${ID_LIKE}" ]; then
        return 0
    else
        return 1
    fi
}

if is_based_distro; then
    distro_id="${ID_LIKE}"
else
    distro_id="${ID}" 
fi

case "${distro_id}" in
    arch)
    install_package="pacman -S --noconfirm"
    remove_package="pacman -Rns --noconfirm"
    ;;
    debian)
    install_package="apt install -y"
    remove_package="apt autoremove -y"
    ;;
    fedora)
    install_package="dnf install -y"
    remove_package="dnf remove -y"
    ;;
    *opensuse*)
    install_package="zypper install -y"
    remove_package="zypper remove -y"
    ;;
esac
