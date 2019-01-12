export PROJECT="de-test-224618"
export REGION="us-central1"
export ZONE="us-central1-c"
export clustername="cluster0110"
#gcloud sql instances create hive-metastorewip     --database-version="MYSQL_5_7"     --activation-policy=ALWAYS     --gce-zone $ZONE

gcloud dataproc clusters create $clustername \
    --scopes cloud-platform \
    --image-version 1.3 \
    --initialization-actions gs://healthedatalab/scripts/datalab_fhir.sh,gs://bunsen/init-script.sh \
    --initialization-action-timeout="20m" \
    --tags=dataproc1 \
    --region=us-central1
