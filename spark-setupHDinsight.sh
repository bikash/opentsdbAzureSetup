#!/usr/bin/env bash

# Updating existing symbolic links and cleanup existing spark1 binaries
rm -r /usr/bin/pyspark
rm -r /usr/bin/spark-class
rm -r /usr/bin/spark-shell
rm -r /usr/bin/spark-sql
rm -r /usr/bin/spark-submit
rm -rf /usr/hdp/current/spark-client

ln -s /usr/hdp/current/spark2-client/bin/spark-sql /usr/bin/
ln -s /usr/hdp/current/spark2-client/bin/spark-class /usr/bin/
ln -s /usr/hdp/current/spark2-client/bin/spark-submit /usr/bin/
ln -s /usr/hdp/current/spark2-client/bin/spark-shell /usr/bin/
ln -s /usr/hdp/current/spark2-client/bin/pyspark /usr/bin/

export SPARK_HOME=/usr/hdp/current/spark2-client

sudo ln -s /usr/hdp/current/spark2-client /usr/hdp/current/spark-client

#wget --no-check-certificate  https://repo.continuum.io/archive/Anaconda2-5.1.0-Linux-x86_64.sh

#bash Anaconda2-5.1.0-Linux-x86_64.sh

#export PATH=/home/sshuser/anaconda2/bin:$PATH


export PYSPARK_PYTHON=/usr/bin/python
export PYTHONPATH=/usr/hdp/current/spark2-client/python/lib/pyspark.zip:/usr/hdp/current/spark2-client/python/lib/py4j-0.10.3-src.zip

pip install --upgrade pip
pip install pandas
pip install requests


# Updating PATH with spark bin
NEWPATH=$PATH:/usr/hdp/current/spark2-client/bin
sed -i "s|^PATH=.*|PATH=\"$NEWPATH\"|g" /etc/environment