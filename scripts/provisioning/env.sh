export PROJECT="<<GCP Project ID>>"
export REGION="<<GCP Region>>"
export ZONE="<<GCP Zone>>"
export clustername="<<Cluster Name>>"
export bucketname=$clustername"-bkt"
export dbname=$clustername"-db"
echo "Using "$clustername " with following bucket:"
gsutil ls gs://$bucketname ||
gsutil mb gs://$bucketname
