##########################################################################
# @file install_touchegg.sh
# @author Jack (chengjunjie.jack@gmail.com)
# @brief Install touchegg
# @version 0.1
# @date 2022-05-05
#########################################################################

#!/usr/bin/env bash

set -e

version=2.0.14
arch=amd64

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

command -v touchegg &> /dev/null || {
    wget "https://github.com/JoseExposito/touchegg/releases/download/2.0.14/touchegg_${version}_${arch}.deb" -O "/tmp/touchegg_${version}_${arch}.deb"
    sudo apt install "/tmp/touchegg_${version}_${arch}.deb"
    rm "/tmp/touchegg_${version}_${arch}.deb"
}

touchegg_config_dir=~/.config/touchegg
touchegg_config_file="${touchegg_config_dir}/touchegg.conf"
if [[ ! -d "${touchegg_config_file}" ]]; then
    mkdir -p ~/.config/touchegg
fi
if [[ -L "${touchegg_config_file}" ]]; then
    unlink "${touchegg_config_file}"
fi
if [[ -f "${touchegg_config_file}" ]]; then
    mv "${touchegg_config_file}" "${touchegg_config_file}.bak"
fi
if [[ ! -f "${touchegg_config_file}" ]]; then
    ln -s "${SCRIPT_DIR}/.config/touchegg/touchegg.conf" "${touchegg_config_file}"
fi