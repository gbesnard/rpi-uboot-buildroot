#!/bin/bash

cd buildroot
make savedefconfig BR2_DEFCONFIG=../khbx_brconfig/configs/khbxrpi0w_defconfig
cd -
