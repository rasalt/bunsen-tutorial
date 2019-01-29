# ML on GCP Datalab

Clone this repository using the following command:
```bash
git clone https://github.com/rasalt/hdl-demo.git
```

This repository contains 2 types of resources for running HealtheDatalab demo on Google Cloud Platform (GCP):  

1. [notebooks](https://github.com/rasalt/hdl-demo/tree/master/notebooks "Jupyter Notebooks") contains jupyter notebooks for various phases involved to take patient healthcare data, transform it and eventually use it to train and evaluate a Machine Learning model.  

2. [scripts](https://github.com/rasalt/hdl-demo/tree/master/scripts "Shell scripts") contains various scripts to provision an environment on GCP to setup a dataproc cluster connected to a persistent HIVE metastore.  

Additionally, we have included scripts to add ingress firewall rules required to open an ssh connection from your local machine to Cloud Datalab running on GCP. This will enable a Chrome web browser to securely access Cloud datalab over SSH tunnel.  

## Provision a Dataproc cluster on GCP

You will need a [GCP Project](https://cloud.google.com/storage/docs/projects). Either you identify a preexisting project or create a new one using [GCP console](https://cloud.google.com/compute/docs/console) first.  
You will also need [Google Cloud SDK.](https://cloud.google.com/sdk/install)  
[Initialize](https://cloud.google.com/sdk/docs/initializing) Google Cloud SDK and select the GCP Project where you want to provision the cluster.

Update your env.sh file based on the sample provided in [env.sh]( ./scripts/provisioning/env.sh) .  

Source the environment file you've created. Be aware that the bucket name needs to be unique. If the bucket already exists then the script will not fail.

```bash
eg. source ./myenv.sh
```

Run the [01-prep.sh](./scripts/provisioning/01-prep.sh) script to move the cluster initialization scripts to Google cloud storage bucket
This script will also create a persistent hive metastore (CloudSQL instance) .

If you get 'AccessDeniedException: 403" please make sure the bucket exist or the bucket name specifed in your env.sh file is unique.

```
cd {path}/hdl-demo/scripts/provisioning
./01-prep.sh
```

Then run the [02-cluster.sh](./scripts/provisioning/02-cluster.sh) file to create a new dataproc cluster
```
./02-cluster.sh
```

Then run the [03-load-training-data.sh](./scripts/provisioning/03-load-training-data.sh) file to upload training dataset (FHIR bundles in TFRecord) to GCS bucket
```
./03-load-training-data.sh
```

## Access Cloud Datalab over a secure SSH tunnel
Use the following helper scripts to access Cloud Datalab from your local machine:  

[firewall_ssh.sh](./scripts/provisioning/firewall_ssh.sh) script adds an ingress firewall rule required for establishing ssh tunnel between your local machine and Cloud Datalab running on GCP.  
```
./firewall_ssh.sh {your env file}
```

[sshtunnel.sh](./scripts/provisioning/sshtunnel.sh) script opens up an ssh tunnel to the master node. This will enable a Chrome web browser to securely access Cloud datalab over SSH tunnel. Run
this script in a separate terminal or in the background.
```
./sshtunnel.sh {your env file}
```

[jupyterconnect.sh](./scripts/provisioning/jupyterconnect.sh) script opens a jupyter notebook inside a Chrome web browser on a MAC.  
```
./jupyterconnect.sh {your env file}
```
This opens up the Cloud Datalab notebook in Chrome web browser. Cloud datalab runs on the master node of the Cloud Dataproc cluster.
Upload [bunsen_getting_started.ipynb](./notebooks/bunsen_getting_started.ipynb) and run it. Just follow the instructions in the notebook!
Upload [bunsen_de_tutorial.ipynb](./notebooks/bunsen_de_tutorial.ipynb) and run it. Just follow  instructions in the notebook!
Upload [demo_notebook.ipynb](./notebooks/demo_notebook.ipynb) and run it. Just follow instructions in the notebook!

First-time users can simply read the instructions and execute the cells. As you become familiar with the system, feel free to experiment by editing queries or code and seeing what happens. Any changes you make will be saved to your copy of the notebooks themselves. This notebook will use and create datasets (Files) in GCS bucket you specified earlier in myenv.sh
