#!/bin/bash
cat > /home/biqu/printer_data/config/scripts/generate-shaper-graph-x.sh <<'EOF'
NEWY=$(ls -Art /tmp/resonances_x_*.csv | tail -n 1)
DATE=$(date +'%Y-%m-%d-%H%M%S')

if [ -z "$NEWY" ]; then
  echo "Nenhum arquivo /tmp/resonances_x_*.csv encontrado." >&2
  exit 1
fi

if [ ! -d "/home/biqu/printer_data/config/input_shaper" ]; then
    mkdir -p /home/biqu/printer_data/config/input_shaper
    chown biqu:biqu /home/biqu/printer_data/config/input_shaper
fi

/home/biqu/klipper/scripts/calibrate_shaper.py "$NEWY" -o /home/biqu/printer_data/config/input_shaper/resonances_x_"$DATE".png
EOF

chmod +x /home/biqu/printer_data/config/scripts/generate-shaper-graph-x.sh


