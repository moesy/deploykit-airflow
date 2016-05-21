# Airflow

An airflow server.

System requirements:
RAM: 500mbs (error: command 'x86_64-linux-gnu-gcc' failed with exit status 4 http://ze.phyr.us/pandas-memory-crash/)


# Deploy Locally
make install
make launch


# Deploy Virtually
requirements:
- Vagrant
- VirtualBox

vagrant up

# Deploy on AWS
requirements:
- AWS Credentials

`
terraform plan
terraform apply
`
