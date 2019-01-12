#Create persistent hive metadata store
#Reference link

gsutil cp ../datalab/* gs://$bucketname/scripts/
gcloud sql instances create $clustername --database-version="MYSQL_5_7" --activation-policy=ALWAYS --gce-zone $ZONE
