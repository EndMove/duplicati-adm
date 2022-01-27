#!/bin/sh

# Environment variables
ADM_SSL_KEY='/usr/builtin/etc/certificate/ssl.key'
ADM_SSL_CRT='/usr/builtin/etc/certificate/ssl.crt'

# Checking the validity of the certificate, and synchronising with the ADM certificate
if [ ! -e "$DUPLICATI_CRT" ] || [ "$DUPLICATI_CRT" -ot $ADM_SSL_CRT ]; then
  echo "duplicati-adm: Regeneration of SSL certificate ssl.pfx..."
  openssl pkcs12 -export -inkey $ADM_SSL_KEY -in $ADM_SSL_CRT -out "$DUPLICATI_CRT" -passin pass:"$DUPLICATI_CRT_PWD" -passout pass:"$DUPLICATI_CRT_PWD" > /dev/null
  echo "done."
fi

exit 0