if [[ $# -eq 0 ]] ; then
    echo "This deployment will not use an Hive metastore"
    echo "If you do want to use an a hive metastore with this deployment please pass in argument 'hivemeta'"
fi

#Create persistent hive metadata store

#Reference link
gsutil mb gs://$bucketname

gsutil cp ../datalab/* gs://$bucketname/scripts/
gsutil ls gs://$bucketname/scripts/

#Create the sql database if you want to leverage an sql hive metasstore 
if [[ "$1" == "hivemeta" ]] ; then
    gsutil ls gs://$hivebucketname
    if [ $? -eq 0 ]; then
      echo "Bucket $hivebucketname exists and the dataproc cluster will leverage this existing bucket"
    else
      gsutil mb gs://$hivebucketname
    fi
    gcloud sql instances create $hivedbname --database-version="MYSQL_5_7" --activation-policy=ALWAYS --gce-zone $ZONE
fi
