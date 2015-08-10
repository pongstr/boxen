#!/usr/bin/env bash

# Specify where we will install
# the xip.io certificate
SSL_DIR="/etc/nginx/ssl"

# Set the wildcarded domain
# we want to use
DOMAIN="root-coder.dev"
SUB_DOMAIN="*.coder.dev"

# A blank passphrase
PASSPHRASE=""

# Set our CSR variables
DOMAIN_SUBJ="
C=PH
ST=PAMPANGA
O=
localityName=TORO LTD.
commonName=coder.dev
organizationalUnitName=FRONTEND
emailAddress=info@toro.io
"
# Set our CSR variables
SUB_DOMAIN_SUBJ="
C=PH
ST=PAMPANGA
O=
localityName=TORO LTD.
commonName=*.$SUB_DOMAIN
organizationalUnitName=FRONTEND
emailAddress=info@toro.io
"

# Create our SSL directory
# in case it doesn't exist
sudo mkdir -p "$SSL_DIR"

# Generate our Private Key, CSR and Certificate
sudo openssl genrsa -out "$SSL_DIR/$DOMAIN.key" 2048
sudo openssl genrsa -out "$SSL_DIR/$SUB_DOMAIN.key" 2048

sudo openssl req -new -subj "$(echo -n "$DOMAIN_SUBJ" | tr "\n" "/")" -key "$SSL_DIR/$DOMAIN.key" -out "$SSL_DIR/$DOMAIN.csr" -passin pass:$PASSPHRASE
sudo openssl req -new -subj "$(echo -n "$SUB_DOMAIN_SUBJ" | tr "\n" "/")" -key "$SSL_DIR/$SUB_DOMAIN.key" -out "$SSL_DIR/$SUB_DOMAIN.csr" -passin pass:$PASSPHRASE

sudo openssl x509 -req -extensions v3_req -days 365 -in "$SSL_DIR/$DOMAIN.csr" -signkey "$SSL_DIR/$DOMAIN.key" -out "$SSL_DIR/$DOMAIN.crt"
sudo openssl x509 -req -extensions v3_req -days 365 -in "$SSL_DIR/$SUB_DOMAIN.csr" -signkey "$SSL_DIR/$SUB_DOMAIN.key" -out "$SSL_DIR/$SUB_DOMAIN.crt"
