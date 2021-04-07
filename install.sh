#!/bin/sh

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
VIM_DIR="${HOME}/.vim"
DATE=$(date +%d%m%Y_%H%M%S)

OLD_VIM_DIR="${HOME}/_old_dot_vim_${DATE}"

VIMRC="${HOME}/.vimrc"
OLD_VIMRC="${HOME}/_old_dot_vimrc_${DATE}"

function die()
{
    echo "$1"
    exit 1
}

if [ -d "${VIM_DIR}" ]; then
	echo "${VIM_DIR} -> ${OLD_VIM_DIR}"
    mv "${VIM_DIR}" "${OLD_VIM_DIR}" || die "Can't backup .vim directory!"
fi

if [ -e "${VIMRC}" ]; then
	echo "${VIMRC} -> ${OLD_VIMRC}"
    mv "${VIMRC}" "${OLD_VIMRC}" || die "Can't backup .vimrc file!"
fi

mkdir -p "${VIM_DIR}" && \
cp -a "${SCRIPT_DIR}/"* "${VIM_DIR}" && \
echo "Installation was successfull!"
