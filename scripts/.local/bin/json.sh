#!/usr/bin/env zsh


if [ $# -ne 1 ]; then
        echo "Usage: $0 <url>"
        exit 1
fi
ip=$(dig +short $1)
res=$(curl -s ipinfo.io/$ip)
country=$(echo $res | jq -r '.country')
region=$(echo $res | jq -r '.region')
echo "Country: $country"
echo "Region: $region"

