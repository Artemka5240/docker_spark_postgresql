from pyspark.sql import SparkSession
import time

# Создаем сессию Spark
spark = SparkSession.builder \
    .appName("PySpark PostgreSQL and ClickHouse Example") \
    .config("spark.jars", "/opt/spark/jars/postgresql-42.2.20.jar,/opt/spark/jars/clickhouse-jdbc-0.3.2-all.jar") \
    .getOrCreate()

# PostgreSQL настройки
postgres_url = "jdbc:postgresql://postgres:5432/pyspark_db"
postgres_properties = {
    "user": "pyspark_user",
    "password": "pyspark_password",
    "driver": "org.postgresql.Driver"
}

# ClickHouse настройки
clickhouse_url = "jdbc:clickhouse://clickhouse:8123/pyspark_db"
clickhouse_properties = {
    "user": "default",
    "password": "",
    "driver": "com.clickhouse.jdbc.ClickHouseDriver"
}

# Добавляем задержку для того, чтобы ClickHouse успел запуститься
time.sleep(10)

# Чтение данных из PostgreSQL
df_postgres = spark.read.jdbc(url=postgres_url, table="employee_data", properties=postgres_properties)
print("=== Данные из PostgreSQL ===")
df_postgres.show()

# Проверка данных из ClickHouse
df_clickhouse = spark.read \
    .format("jdbc") \
    .option("url", clickhouse_url) \
    .option("dbtable", "pyspark_db.employees") \
    .option("driver", "com.clickhouse.jdbc.ClickHouseDriver") \
    .load()

print("=== Данные из ClickHouse ===")
df_clickhouse.show()

# Остановка Spark-сессии
spark.stop()
