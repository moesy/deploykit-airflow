#!/bin/bash

NAME="airflow_webserver"                             # Name of the application
AIRFLOW_HOME=/home/ubuntu/airflow                 # Django project directory

echo "Starting $NAME as `whoami`"

# Activate the virtual environment
cd $AIRFLOW_HOME
source env/bin/activate
export AIRFLOW_HOME=$AIRFLOW_HOME
export PYTHONPATH=$AIRFLOW_HOME:$PYTHONPATH

# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
exec env/bin/airflow webserver
