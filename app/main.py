from pyspark.sql import SparkSession

# Создаем сессию Spark
spark = SparkSession.builder \
    .appName("PySpark PostgreSQL Example") \
    .config("spark.jars", "/opt/spark/jars/postgresql-42.2.20.jar") \
    .getOrCreate()

# URL для подключения к PostgreSQL
jdbc_url = "jdbc:postgresql://postgres:5432/pyspark_db"

# Параметры подключения
connection_properties = {
    "user": "pyspark_user",
    "password": "pyspark_password",
    "driver": "org.postgresql.Driver"
}


df = spark.read.jdbc(url=jdbc_url, table="employee_data", properties=connection_properties)
print("=== Данные из таблицы employee_data ===")

df.show()

# Остановить Spark-сессию
spark.stop()
