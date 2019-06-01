#!/bin/bash

# Query current public ip address
CURRENT_IP=$(curl -s https://ipinfo.io/ip)
AUTH="Authorization: sso-key <API_KEY>"
DOMAIN="<DOMAIN>"
NOW=`date`
# query current DNS A Record of the domain
DNS=$(curl https://api.godaddy.com/v1/domains/$DOMAIN/records/A/@ -s \
 -H "$AUTH" \
 | jq '.[0] | .data' | tr -d '"') && \

if [ "$CURRENT_IP" != "$DNS" ];
then
	echo "==================================";
	echo "Updating DNS Record";
	echo "From: $DNS";
	echo "To: $CURRENT_IP";

  curl -s --request PUT \
    --url https://api.godaddy.com/v1/domains/$DOMAIN/records/A \
    --header "$AUTH" \
    --header 'content-type: application/json' \
    --data '[
      {
        "data": "'$CURRENT_IP'",
        "name": "@",
        "ttl": 600,
        "type": "A"
      }
    ]' && \
  echo "Done on $NOW"
  echo "=================================="
fi