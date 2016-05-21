# Microservices Project Make File

VIRTUALENV = $(shell which virtualenv)

clean: shutdown
	rm -fr microservices.egg-info
	rm -fr env

env:
	$(VIRTUALENV) env/ --no-site-packages

install: clean env
	. env/bin/activate; source ./config.sh
	. env/bin/activate; pip install -r requirements.txt


init: shutdown
	. env/bin/activate; source ./config.sh
	. env/bin/activate; airflow initdb

launch: env shutdown
	. env/bin/activate; source ./config.sh
	. env/bin/activate; airflow webserver

shutdown:
	ps gx | grep 'airflow'
	ps -ef | grep "gunicorn" | grep -v grep | awk '{print $$2}' | xargs kill
