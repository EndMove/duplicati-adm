#!/bin/sh

echo "duplicati-adm: --== pre-uninstall ==--"

# Save the user configuration if package is updating
[ "$APKG_PKG_STATUS" = 'upgrade' ] && cp -arf "$APKG_PKG_DIR"/config/* "$APKG_TEMP_DIR"/ 2>&1

exit 0