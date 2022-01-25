#!/bin/sh

echo "duplicati-adm: --== post-install ==--"

# Environment variables
MONO_RUN=/usr/local/bin/mono

case "$APKG_PKG_STATUS" in
	install)
		# post install script here
    cd $APKG_PKG_DIR/
		/usr/local/AppCentral/mono/bin/mozroots --sync --quiet
		;;
	upgrade)
		# post upgrade script here (restore data)
		cp -arf $APKG_TEMP_DIR/* $APKG_PKG_DIR/config/ 
		;;
esac

exit 0