#!/bin/bash

set -e

BOARD_DIR="$(dirname $0)"
GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

# Use our own version of config.txt 
cp "${BR2_EXTERNAL_KHBX_BR2_TREE_PATH}/board/rpi-boot-config.txt" "${BINARIES_DIR}/rpi-firmware/config.txt" 

# Gen U-Boot script
mkimage -A arm -O linux -T script -C none -n "${BR2_EXTERNAL_KHBX_BR2_TREE_PATH}/board/boot.scr" -d "${BR2_EXTERNAL_KHBX_BR2_TREE_PATH}/board/boot.scr" "${BINARIES_DIR}/boot.scr.uimg"

# Pass an empty rootpath. genimage makes a full copy of the given rootpath to
# ${GENIMAGE_TMP}/root so passing TARGET_DIR would be a waste of time and disk
# space. We don't rely on genimage to build the rootfs image, just to insert a
# pre-built one in the disk image.

trap 'rm -rf "${ROOTPATH_TMP}"' EXIT
ROOTPATH_TMP="$(mktemp -d)"

rm -rf "${GENIMAGE_TMP}"

genimage \
	--rootpath "${ROOTPATH_TMP}"   \
	--tmppath "${GENIMAGE_TMP}"    \
	--inputpath "${BINARIES_DIR}"  \
	--outputpath "${BINARIES_DIR}" \
	--config "${GENIMAGE_CFG}"

exit $?