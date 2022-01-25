#!/bin/sh

echo "duplicati-adm: --== pre-uninstall ==--"

# If upgrading
if [ "$APKG_PKG_STATUS" = 'upgrade' ]; then
  # Backup the all config directory content
  cp -arf $APKG_PKG_DIR/config/* $APKG_TEMP_DIR/ 2>&1
fi

exit 0