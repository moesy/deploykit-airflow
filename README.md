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

`
vagrant up
`

# Deploy on AWS
requirements:
- AWS Credentials

`
terraform plan
terraform apply
`

# Redis CLI
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make

sudo apt-get install tk8.5
src/redis-cli -h airflowcache.dyshhq.0001.usw2.cache.amazonaws.com -p 6379


git clone https://github.com/moesy/deploykit-airflow.git airflow
