FROM jupyter/all-spark-notebook

USER root

# Install google storage connector
# RUN cd /usr/local/spark/jars && \
    wget -q https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-hadoop3-latest.jar

# Ensure we overwrite the kernel config so that toree connects to cluster
RUN jupyter toree install --sys-prefix --spark_opts="--master yarn --deploy-mode client --driver-memory 2g  --executor-memory 6g  --executor-cores 4 --driver-java-options -Dhdp.version=2.5.3.0-37 --conf spark.hadoop.yarn.timeline-service.enabled=false"

COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}
USER ${NB_USER}
