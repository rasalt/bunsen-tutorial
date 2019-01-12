"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --proxy-server="socks5://localhost:${PORT}" \
  --user-data-dir=/tmp/${MASTERNODE} \
  --incognito http://$MASTERNODE:8080 
