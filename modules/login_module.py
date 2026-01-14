from conection_db import get_db_connection

def get_next_user_id():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT IFNULL(MAX(ID_User), 0) + 1 FROM Usuario")
    next_id = cursor.fetchone()[0]
    conn.close()
    return next_id

# -------- Login --------
def login_user(nombre, password):
    conn = get_db_connection()
    if not conn:
        return None

    cursor = conn.cursor()
    query = """
        SELECT ID_User, nombre
        FROM Usuario
        WHERE TRIM(IFNULL(nombre, '')) = %s
          AND TRIM(IFNULL(contrasena, '')) = %s
    """

    cursor.execute(query, (nombre, password))
    user = cursor.fetchone()
    conn.close()
    return user



# -------- REGISTER --------
def register_user(nombre, email):
    conn = get_db_connection()
    if not conn:
        return False

    cursor = conn.cursor()

    new_id = get_next_user_id()

    query = """
        INSERT INTO Usuario
        (ID_User, nombre, email, contrasena, imagen, descripcion)
        VALUES (%s, %s, %s, %s, %s, %s)
    """

    cursor.execute(
        query,
        (
            new_id,
            nombre,
            email,
            '123456',        # contraseña por defecto
            'default.png',   # imagen por defecto
            ''               # descripcion
        )
    )

    conn.commit()
    conn.close()
    return True

