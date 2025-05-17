#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

URL="$1"

RESPONSE_CODE=$(curl -o /dev/null -s -w "%{http_code}" "$URL")

echo "HTTP Status Code: $RESPONSE_CODE"


if [[ "$STATUS_CODE" -ge 200 && "$STATUS_CODE" -lt 300 ]]; then
    echo "Success: The website is reachable "
elif [[ "$STATUS_CODE" -ge 300 && "$STATUS_CODE" -lt 400 ]]; then
    echo "Redirection: Redirecting to another page."
elif [[ "$STATUS_CODE" -ge 400 && "$STATUS_CODE" -lt 500 ]]; then
    echo "Client Error: The request was invalid or the page doesn't exist."
elif [[ "$STATUS_CODE" -ge 500 && "$STATUS_CODE" -lt 600 ]]; then
    echo "Server Error: Server failed the request."
else
    echo "Unexpected status code "
fi

