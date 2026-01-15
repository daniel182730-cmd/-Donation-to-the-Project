from flask import Blueprint, request, jsonify, session
from modules.login_module import login_user, register_user

auth = Blueprint('auth', __name__)

# Controller login
@auth.route('/api/login', methods=['POST'])
def login():
    try:
        data = request.get_json()
        print("DATA RECIBIDA:", data)

        nombre = data.get('nombre')
        password = data.get('password')

        user = login_user(nombre, password)
        print("USUARIO:", user)

        if not user:
            return jsonify({"success": False, "message": "Credenciales incorrectas"}), 401

        session['user_id'] = user[0]
        session['user_name'] = user[1]

        return jsonify({"success": True, "redirect": "/Reeva"})

    except Exception as e:
        print("ERROR EN LOGIN:", e)
        return jsonify({
            "success": False,
            "error": str(e)
        }), 500

# Controller Registrar
@auth.route('/api/register', methods=['POST'])
def register():
    try:
        data = request.get_json()
        print("REGISTER DATA:", data)

        nombre = data.get('nombre')
        email = data.get('email')
        password = data.get('password')

        success = register_user(nombre, email, password)

        if not success:
            return jsonify({"success": False, "message": "Error al registrar"}), 500

        return jsonify({"success": True, "redirect": "/Reeva"})

    except Exception as e:
        print("ERROR EN REGISTER:", e)
        return jsonify({
            "success": False,
            "error": str(e)
        }), 500
