#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "$(realpath -- "${BASH_SOURCE[0]}")" )" &> /dev/null && pwd )

shellcheck source =. /configuration/scripts/common.sh
source "$SCRIPT_DIR"/common.sh

NEWX=$(find /tmp -name "resonances_y _*. csv" -printf '%T@ %p\n' 2> /dev/null | sort -n | tail -1 | cut -f2- -d" ")
DATE=$(date +'%Y-%m-%d-%H%M%S' )
outdir="${PRINTER_DATA_DIR}"/config/input_shaper
if [ ! -d "${outdir}" ]
then
mkdir "${outdir}"
chown "${USERNAME}:${USERGROUP]" "${outdir}"
fi

"${KLIPPER_DIR}"/scripts/calibrate_shaper.py "$NEWX" -o "${outdir}/resonances_y_${DATE}.png"