#!/usr/bin/env bash

# Updating existing symbolic links and cleanup existing spark-1.6 binaries
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
ln -s /usr/hdp/current/spark2-client /usr/hdp/current/spark-client


echo "export SPARK_HOME=/usr/hdp/current/spark2-client" >> /home/sshuser/.bashrc
echo "export PYTHONPATH=$SPARK_HOME/python/:$PYTHONPATH" >> /home/sshuser/.bashrc
echo "export PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.10.3-src.zip:$PYTHONPATH" >> /home/sshuser/.bashrc
echo "export PYSPARK_PYTHON=/usr/bin/python" >> /home/sshuser/.bashrc
#export PYTHONPATH=/usr/hdp/current/spark2-client/python/lib/pyspark.zip:/usr/hdp/current/spark2-client/python/lib/py4j-0.10.3-src.zip


pip install --upgrade pip

# Updating PATH with spark bin
NEWPATH=$PATH:/usr/hdp/current/spark2-client/bin
sed -i "s|^PATH=.*|PATH=\"$NEWPATH\"|g" /etc/environment


source /home/sshuser/.bashrc