import pyodbc

# Database connection function
def get_db_connection():
    server = 'localhost'
    database = 'kickstarter'
    username = 'root'
    password = 'S@lmon182730'
    
    try:
        conn = pyodbc.connect(
            f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}'
        )
        print("Conexión exitosa a SQL Server")
        return conn
    except Exception as e:
        print(f"Error: {e}")
        return None