#!/bin/bash
set -e

# shellcheck source=images/airflow/3.0.3/bootstrap/common.sh
source /bootstrap/common.sh

# Define an array of required packages
REQUIRED_PACKAGES=(
    "apache-airflow-providers-amazon[aiobotocore]"
    "apache-airflow[celery,statsd]==${AIRFLOW_VERSION}"
    "apache-airflow-providers-postgres"
    "apache-airflow-providers-fab"
    "celery[sqs]"
    "boto3-stubs[logs]"
    "boto3-stubs[sqs]"
    psycopg2
    pycurl
    watchtower
    virtualenv
    apache-airflow-providers-standard
    apache-airflow-providers-openlineage
    sagemaker-studio
)

# safe-pip-install always install all required packages, along with whatever
# the user provides, hence we don't need to provide anything here.
safe-pip-install -c "${AIRFLOW_CONSTRAINTS_FILE}" "${REQUIRED_PACKAGES[@]}" 
