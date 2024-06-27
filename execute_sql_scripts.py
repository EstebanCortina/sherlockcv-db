import mysql.connector
import os
import sys

# Configurar la conexión a la base de datos
db_host = os.getenv('DB_HOST')
db_port = os.getenv('DB_PORT')
db_user = os.getenv('DB_USER')
db_pass = os.getenv('DB_PASS')
db_name = os.getenv('DB_NAME')

conn = mysql.connector.connect(
    host=db_host,
    port=db_port,
    user=db_user,
    password=db_pass,
    database=db_name
)

cursor = conn.cursor()

# Leer archivos SQL modificados
changed_files_path = sys.argv[1]

try:
    with open(changed_files_path, 'r') as file:
        changed_files = file.read().splitlines()

    # Iterar sobre cada archivo de script SQL
    for script_path in changed_files:
        if script_path.endswith('.sql'):
            try:
                with open(script_path, 'r') as sql_file:
                    sql = sql_file.read()
                    cursor.execute(sql)
                    print(f"Ejecutando script SQL: {script_path}")

                    # Asegurarse de que la consulta se haya completado
                    while True:
                        if cursor.nextset():
                            break

            except FileNotFoundError as e:
                print(f"No se encontró el archivo SQL: {script_path}")
                raise e

            except Exception as e:
                print(f"Error al ejecutar el script SQL {script_path}: {str(e)}")
                raise e

except FileNotFoundError as e:
    print(f"No se encontró el archivo de scripts modificados: {changed_files_path}")
    raise e

except Exception as e:
    print(f"Error al leer el archivo de scripts modificados: {str(e)}")
    raise e

finally:
    if cursor:
        cursor.close()
    if conn:
        conn.commit()  # Asegurar que se realice el commit final
        conn.close()
