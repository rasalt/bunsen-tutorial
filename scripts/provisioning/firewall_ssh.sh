if [[ $# -eq 0 ]] ; then
    echo 'Usage: ./firewall_ssh.sh {path to your env file}'
    exit 1
fi

source $1

gcloud compute --project=$PROJECT firewall-rules create allowsshall --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:22 --source-ranges=0.0.0.0/0 --target-tags=dataproc
