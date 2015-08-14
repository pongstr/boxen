#!/bin/bash
set -u
set -e

SSL_DIR="/etc/nginx/ssl"
ROOT_SSL_NAME="root-test.dev"
ROOT_SSL_FQDN="coder.dev"

SUB_SSL_NAME="coder.dev"
SUB_SSL_FQDN="*.coder.dev"


# Create Nginx SSL Dir if it does not exists.
if [ ! -d $SSL_DIR ]; then
  sudo mkdir -p $SSL_DIR
fi


# Create your very own Root Certificate Authority
sudo openssl genrsa \
  -out "$SSL_DIR/$ROOT_SSL_NAME.key" \
  2048

# Self-sign your Root Certificate Authority
# Since this is private, the details can be as bogus as you like
sudo openssl req \
  -x509 \
  -new \
  -sha256 \
  -nodes \
  -key "$SSL_DIR/$ROOT_SSL_NAME.key" \
  -days 3652 \
  -out "$SSL_DIR/$ROOT_SSL_NAME.crt" \
  -subj "/C=US/ST=Pampanga/L=TORO LTD./O=ACME Signing Authority Inc/CN=${ROOT_SSL_FQDN}"

# NOTE
# -nodes means "no-des" which means "no passphrase"
# -days 3652 means that this example will break about 10 years from now

sleep 1

# Create your very own Root Certificate Authority
sudo openssl genrsa \
  -out "$SSL_DIR/$SUB_SSL_NAME.key" \
  2048

# Self-sign your Root Certificate Authority
# Since this is private, the details can be as bogus as you like
sudo openssl req \
  -x509 \
  -new \
  -sha256 \
  -nodes \
  -key "$SSL_DIR/$SUB_SSL_NAME.key" \
  -days 3652 \
  -out "$SSL_DIR/$SUB_SSL_NAME.crt" \
  -subj "/C=US/ST=Pampanga/L=TORO LTD./O=ACME Signing Authority Inc/CN=${SUB_SSL_FQDN}"

sleep 1

sudo security add-trusted-cert \
  -d \
  -r trustRoot \
  -k "/Library/Keychains/System.keychain" "$SSL_DIR/$ROOT_SSL_NAME.crt"


sudo security add-trusted-cert \
  -d \
  -r trustRoot \
  -k "/Library/Keychains/System.keychain" "$SSL_DIR/$SUB_SSL_NAME.crt"
