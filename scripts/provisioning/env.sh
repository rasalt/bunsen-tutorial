export PROJECT="<<GCP Project ID>>"
export REGION="<<GCP Region>>"
export ZONE="<<GCP Zone>>"
export clustername="<<Cluster Name>>"
export bucketname=$clustername"-bkt"

#Sql hive metastore information .. optional 
export hivebucketname="" #Unique sqlhive bucketname please note: this bucket is created once
export hivedbname="" #Set the database name
#Information output
echo "Using "$clustername " with the following bucket $bucketname"
echo "Using "$clustername " with the following bucket sql hive bucketname $hivebucketname"
