#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="manaplus"
rp_module_desc="manaplus - 2D MMORPG Client"
rp_module_menus="4+"
rp_module_flags="!x86 !mali"

function depends_manaplus() {
    getDepends libsdl1.2-dev libsdl-mixer1.2-dev libsdl-image1.2-dev libsdl-net1.2-dev libcurl4-gnutls-dev libpng12-dev libxml2-dev cmake libguichan-dev patch autoconf libtool libsdl-ttf2.0-dev libsdl-gfx1.2-dev gettext libgl1-mesa-dev libenet-dev libphysfs-dev libxml2-dev zlib1g-dev xorg
}

function sources_manaplus() {
    gitPullOrClone "$md_build" https://gitlab.com/manaplus/manaplus.git
}

function build_manaplus() {
    cmake . -DCMAKE_INSTALL_PREFIX:PATH="$md_inst"
    make
}

function install_manaplus() {
    make install
}

function configure_manaplus() {
    mkRomDir "ports"
    mkRomDir "ports/manaplus"
    moveConfigDir "$home/.config/mana" "$configdir/manaplus"

    addPort "$md_id" "manaplus" "manaplus - 2D MMORPG Client" "xinit $md_inst/bin/manaplus" 
}