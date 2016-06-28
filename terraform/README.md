sudo useradd -G airflow airflow
sudo pip install awscli --ignore-installed six

sudo pip install requirements.txt

git Clone
mv setup/upstart/ /etc/init/
