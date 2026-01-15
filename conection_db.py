import mysql.connector

def get_db_connection():
    try:
        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="S@lmon182730",
            database="kickstarter",
            autocommit=True
        )
        print("✅ Conectado a MySQL")
        return conn
    except mysql.connector.Error as e:
        print("Error MySQL:", e)
        return None
