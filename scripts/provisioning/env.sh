export PROJECT="<<GCP Project ID>>"
export REGION="<<GCP Region>>"
export ZONE="<<GCP Zone>>"
export clustername="<<Cluster Name>>"
export bucketname=$clustername"-bkt"
gsutil mb gs://$bucketname
