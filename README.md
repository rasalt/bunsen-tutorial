# HealtheDatalab 

This repository contains 2 sets of resources for running healthedatalab:
./notebooks: This contains jupyter notebooks for various phases involved to take patient healthcare data, transform it and eventually train an ML model.
./scripts: This contains various scripts to provision an environment on Google Cloud Platform to setup a dataproc cluster connected to a persistent HIVE metastore.
   There are convenience scripts to open firewall rules and open an ssh tunnel over which one can access their jupyter notebooks.

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
