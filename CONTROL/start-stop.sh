#!/bin/sh

echo "duplicati-adm: --== start-stop ==--"

# Environment variables
export DUPLICATI_CONFIG=$APKG_PKG_DIR/config
export DUPLICATI_CRT=$DUPLICATI_CONFIG/ssl.pfx
export DUPLICATI_TMP=$APKG_PKG_DIR/tmp
ADM_MONO=/usr/local/bin/mono

case "$1" in
	start)
		# Starting duplicati
		echo "duplicati-adm: Starting service..."
		# Move to the application directory and check that the tmp/ and config/ directories exist
		cd "$APKG_PKG_DIR" || exit 1;
		[ ! -d "$DUPLICATI_CONFIG" ] && mkdir "$DUPLICATI_CONFIG";
		[ ! -d "$DUPLICATI_TMP" ] && mkdir "$DUPLICATI_TMP";
		# Check/Regen pfx certificate
		sh ./CONTROL/certificate-manager.sh
		sleep 2
	  # Run duplicati
		$ADM_MONO "$APKG_PKG_DIR"/Duplicati.Server.exe --webservice-port=3200 --webservice-interface=* --webservice-allowed-hostnames=* --auto-update=false --log-retention=30D --log-file="$DUPLICATI_CONFIG/log-file.log" --server-datafolder="$DUPLICATI_CONFIG" --tempdir="$DUPLICATI_TMP" > /dev/null &
		echo "done."
		;;
	stop)
		# Stopping duplicati
		echo "duplicati-adm: Stopping service..."
		for i in $(ps -ef | grep duplicati | awk '{print $1}'); do
		    # SIGKILL all duplicati process
		    kill -s SIGTERM "$i" 2>/dev/null
		done
		echo "done."
		;;
	*)
		echo "usage: $0 {start|stop}"
		exit 1
		;;
esac

exit 0
