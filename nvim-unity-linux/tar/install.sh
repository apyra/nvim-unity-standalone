
#!/bin/bash
set -e

INSTALL_DIR="/usr/local/bin"
ICON_DIR="/usr/share/icons/hicolor/512x512/apps"
DESKTOP_FILE="/usr/share/applications/nvimunity.desktop"

echo "Installing NvimUnity..."

sudo cp nvimunity.sh $INSTALL_DIR/nvimunity
sudo chmod +x $INSTALL_DIR/nvimunity

sudo mkdir -p "$ICON_DIR"
sudo cp icons/nvimunity.png "$ICON_DIR/nvimunity.png"

sudo cp nvimunity.desktop "$DESKTOP_FILE"

echo "Installation complete. You can find it in your application menu."

