#!/bin/sh

echo "duplicati-adm: --== post-install ==--"

case "$APKG_PKG_STATUS" in
	install)
	  # Updating of certificates in case of installation
	  echo "duplicati-adm: updating certificates..."
    cd $APKG_PKG_DIR/ && /usr/local/AppCentral/mono/bin/mozroots --sync --quiet || exit 1
    echo "done."
		;;
	upgrade)
	  # Restoring the backup in case of an update
	  echo "duplicati-adm: Restoring backup..."
		cp -arf $APKG_TEMP_DIR/* $APKG_PKG_DIR/config/
		echo "done."
		;;
esac

exit 0