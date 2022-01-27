#!/bin/sh

echo "duplicati-adm: --== start-stop ==--"

# Environment variables
export DUPLICATI_CONFIG=$APKG_PKG_DIR/config
export DUPLICATI_CRT=$DUPLICATI_CONFIG/ssl.pfx
export DUPLICATI_CRT_PWD='root'
export DUPLICATI_TMP=$APKG_PKG_DIR/tmp
ADM_MONO=/usr/local/bin/mono

case "$1" in
	start)
		# Starting duplicati
		echo "duplicati-adm: Starting service..."
		cd "$APKG_PKG_DIR" || exit 1;
		# Check/regen pfx certificates
		sh ./CONTROL/certificate-manager.sh
		# Make tmp dir and start duplicati
		[ ! -d "$DUPLICATI_TMP" ] && mkdir "$DUPLICATI_TMP";
		$ADM_MONO "$APKG_PKG_DIR"/Duplicati.Server.exe --webservice-port=3200 --webservice-sslcertificatefile="$DUPLICATI_CRT" --webservice-sslcertificatepassword="$DUPLICATI_CRT_PWD" --webservice-interface=* --webservice-allowed-hostnames=* --log-retention=30D --auto-update=false --server-datafolder="$DUPLICATI_CONFIG" --tempdir="$DUPLICATI_TMP" > /dev/null
		echo "done."
		;;
	stop)
		# Stopping duplicati
		echo "duplicati-adm: Stopping service..."
		for i in $(ps -ef | grep duplicati | awk '{print $1}'); do
		    # SIGKILL all duplicati process
		    kill -9 "$i" 2>/dev/null
		done
		echo "done."
		;;
	*)
		echo "usage: $0 {start|stop}"
		exit 1
		;;
esac

exit 0
