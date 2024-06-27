import mysql.connector
import os
import sys

# Configurar la conexión a la base de datos
db_host = os.getenv('DB_HOST')
db_user = os.getenv('DB_USER')
db_pass = os.getenv('DB_PASS')
db_name = os.getenv('DB_NAME')

conn = mysql.connector.connect(
    host=db_host,
    user=db_user,
    password=db_pass,
    database=db_name
)

cursor = conn.cursor()

# Leer archivos SQL modificados
changed_files_path = sys.argv[1]

with open(changed_files_path, 'r') as file:
    changed_files = file.read().splitlines()

for script in changed_files:
    if script.endswith('.sql'):
        with open(script, 'r') as sql_file:
            sql = sql_file.read()
            cursor.execute(sql)
            conn.commit()

cursor.close()
conn.close()
