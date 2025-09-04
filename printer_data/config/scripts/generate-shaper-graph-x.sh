# salve como generate-shaper-graph-y.sh (ou o nome que preferir)
cat > /home/biqu/printer_data/config/scripts/generate-shaper-graph-y.sh <<'EOF'
#!/bin/bash
NEWY=$(ls -Art /tmp/resonances_y_*.csv | tail -n 1)
DATE=$(date +'%Y-%m-%d-%H%M%S')

if [ -z "$NEWY" ]; then
  echo "Nenhum arquivo /tmp/resonances_y_*.csv encontrado." >&2
  exit 1
fi

if [ ! -d "/home/biqu/printer_data/config/input_shaper" ]; then
    mkdir -p /home/biqu/printer_data/config/input_shaper
    chown biqu:biqu /home/biqu/printer_data/config/input_shaper
fi

/home/biqu/klipper/scripts/calibrate_shaper.py "$NEWY" -o /home/biqu/printer_data/config/input_shaper/resonances_y_"$DATE".png
EOF

chmod +x /home/biqu/printer_data/config/scripts/generate-shaper-graph-y.sh
