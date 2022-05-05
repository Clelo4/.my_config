##########################################################################
# @file install_touchegg.sh
# @author Jack (chengjunjie.jack@gmail.com)
# @brief Install touchegg
# @version 0.1
# @date 2022-05-05
#########################################################################

#!/usr/bin/env bash

version=2.0.14
arch=amd64

wget "https://github.com/JoseExposito/touchegg/releases/download/2.0.14/touchegg_${version}_${arch}.deb" -O "/tmp/touchegg_${version}_${arch}.deb"

sudo apt install "/tmp/touchegg_${version}_${arch}.deb"

rm "/tmp/touchegg_${version}_${arch}.deb"
