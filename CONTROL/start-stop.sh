#!/bin/sh

# Environment variables
DUPLICATI_PID=/var/run/duplicati-server.pid
DUPLICATI_TMP=$APKG_PKG_DIR/tmp
MONO_RUN=/usr/local/bin/mono

case "$1" in
	start)
		# Starting duplicati
		echo "duplicati-adm: Starting service..."
		cd $APKG_PKG_DIR || exit 1
		if [ ! -d $DUPLICATI_TMP ]; then
		  mkdir $DUPLICATI_TMP
		fi
		$MONO_RUN $APKG_PKG_DIR/Duplicati.Server.exe --webservice-port=3200 --webservice-interface=* --webservice-allowed-hostnames=* --log-retention=30D --server-datafolder=$APKG_PKG_DIR/config --tempdir=$DUPLICATI_TMP > /dev/null &
		echo $! > $DUPLICATI_PID
		echo "done."
		;;
	stop)
		# Stopping duplicati
		echo "duplicati-adm: Stopping service..."
		kill -9 "$(cat $DUPLICATI_PID)" 2 > /dev/null
		rm -rf $DUPLICATI_PID
		echo "done."
		;;
	*)
		echo "usage: $0 {start|stop}"
		exit 1
		;;
esac

exit 0
