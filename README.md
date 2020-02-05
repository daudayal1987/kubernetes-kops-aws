# kubernetes-kops-aws
Launch kubernetes cluster on AWS using kops

# Steps to launch cluster
1. Clone this repo.
2. Copy `.env.sample` as `.env`.
3. Edit required settings in `.env` file. Uncomment optional parameter and fill value if required.
4. Execute script `1_setup.sh` as `bash 1_setup.sh` it will download and setup all the necessary dependencies (kops, kubectl, & awscli).
5. Execute script `2_configure-aws.sh` as `bash 2_configure-aws.sh` it will configure your instance to use aws credentials.
6. Execute script `3_launch_cluster.sh` as `bash 3_launch_cluster.sh` it will launch the actual cluster.

# Validate cluster
To check if cluster is in valid status run `bash validate-cluster.sh`

# Setup web ui dashboard
After validating the cluster run script `bash setup-cluster.sh` to setup web ui dashboard and use the url and credentials to listed by this script to access the dashboard.

# Destroy cluster
To destory the cluster use script `destroy-cluster.sh` and run it as `bash destroy-cluster.sh`

