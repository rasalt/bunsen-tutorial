# HealtheDatalab 

This repository contains 2 types of resources for running healthedatalab on Google Cloud Platform:  

1. [notebooks](https://github.com/rasalt/hdl-demo/tree/master/notebooks "Jupyter Notebooks") contains jupyter notebooks for various phases involved to take patient healthcare data, transform it and eventually use it to train and evaluate a Machine Learning model.  

2. [scripts](https://github.com/rasalt/hdl-demo/tree/master/scripts "Shell scripts") contains various scripts to provision an environment on Google Cloud Platform to setup a dataproc cluster connected to a persistent HIVE metastore.  

We have provided scripts to add ingress firewall rules required to setup an ssh tunnel between your local machine and Cloud Datalab running on GCP. This will enable a chrome web browser to securely access Cloud datalab over SSH tunnel.  

## Provisiong a Dataproc cluster

Please create your env.sh file based on the skeleton provided in 
 ./scripts/provisioning/env.sh.
Source the environment file you've created
Be aware that the bucketname needs to be unique. If that bucketname already exists then the script will partially fail but subsequent steps will fail.
```bash
eg. source ./myenv.sh
```

Run the 01-prep.sh file
This creates the persistent hive metastore
```
./01-prep.sh
```

Then run the 02-cluster.sh file
```
./02-cluster.sh
```
Helper scripts:
Ensure a firewall rule is opened for sshtunnel creations
firewall_ssh.sh

Open an ssh tunnel to the master node
sshtunnel.sh

Open a jupyter notebook on a MAC.
./jupyterconnect.sh:- This opens up the jupyter notebook on localhost:<port>


Click on the URL displayed at the bottom of the screen and Jupyter will open in your web browser. From there, navigate to work/getting_started.ipynb. From there, just follow the instructions in that notebook!

First-time users can simply read the instructions and execute the cells. As you become familiar with the system, feel free to experiment by editing queries or code and seeing what happens. Any changes you make will be saved to your copy of the notebooks themselves.
