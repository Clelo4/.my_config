##########################################################################
# @file utils.sh
# @author Jack (chengjunjie.jack@gmail.com)
# @brief 
# @version 0.1
# @date 2022-05-05
#########################################################################

#!/usr/bin/env bash

function install_software()
(
    echo "Installing $@"
    sudo apt-get install $@
) 1> /dev/null
