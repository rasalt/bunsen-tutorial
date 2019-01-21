#Create persistent hive metadata store
#Reference link

gsutil cp ../datalab/* gs://$bucketname/scripts/
gcloud sql instances create $dbname --database-version="MYSQL_5_7" --activation-policy=ALWAYS --zone $ZONE
