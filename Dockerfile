# Используем базовый образ OpenJDK
FROM openjdk:8-jdk-slim


RUN apt-get update && \
    apt-get install -y python3 python3-pip curl procps && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Устанавливаем Spark
ARG SPARK_VERSION=3.3.2
ARG HADOOP_VERSION=3
ENV SPARK_HOME=/opt/spark
ENV PATH=$SPARK_HOME/bin:$PATH

RUN curl -L https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION.tgz \
    | tar xz -C /opt/ \
    && mv /opt/spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION $SPARK_HOME

# Скачиваем драйвер PostgreSQL
RUN curl -L https://jdbc.postgresql.org/download/postgresql-42.2.20.jar -o /opt/spark/jars/postgresql-42.2.20.jar


RUN pip3 install pyspark==${SPARK_VERSION} pandas psycopg2-binary

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем скрипты приложения
COPY .. /app
