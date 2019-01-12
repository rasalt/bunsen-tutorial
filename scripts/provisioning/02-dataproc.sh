gcloud dataproc clusters create $clustername \
    --scopes cloud-platform \
    --image-version 1.3 \
    --initialization-actions gs://$bucketname/scripts/datalab_fhir.sh,gs://$bucketname/scripts/init-script.sh \
    --initialization-action-timeout="25m" \
    --tags=dataproc \
    --region=$REGION
