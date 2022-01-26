#!/bin/sh

# Environment variables
DUPLICATI_TMP=$APKG_PKG_DIR/tmp
ADM_MONO=/usr/local/bin/mono

case "$1" in
	start)
		# Starting duplicati
		echo "duplicati-adm: Starting service..."
		cd $APKG_PKG_DIR || exit 1
		[ ! -d $DUPLICATI_TMP ] && mkdir $DUPLICATI_TMP
		$ADM_MONO $APKG_PKG_DIR/Duplicati.Server.exe --webservice-port=3200 --webservice-interface=* --webservice-allowed-hostnames=* --log-retention=30D --server-datafolder=$APKG_PKG_DIR/config --tempdir=$DUPLICATI_TMP > /dev/null
		echo "done."
		;;
	stop)
		# Stopping duplicati
		echo "duplicati-adm: Stopping service..."
		for i in $(ps -ef | grep duplicati | awk '{print $1}'); do
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
