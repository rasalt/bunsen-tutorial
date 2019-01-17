
if [[ $# -eq 0 ]] ; then
    echo 'Usage: ./jupyterconnect.sh {path to your env file}'
    exit 1
fi

source $1

export MASTERNODE=${clustername}"-m"
export PORT=1082
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --proxy-server="socks5://localhost:${PORT}" \
  --user-data-dir=/tmp/${MASTERNODE} \
  --incognito http://$MASTERNODE:8080
