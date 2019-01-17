
if [[ $# -eq 0 ]] ; then
    echo 'Usage: ./sshtunnel.sh {path to your env file}'
    exit 1
fi

source $1

export MASTERNODE=${clustername}"-m"
export PORT=1082
gcloud compute ssh ${MASTERNODE} \
    --project=${PROJECT} --zone=${ZONE}  -- \
    -D ${PORT} -N
