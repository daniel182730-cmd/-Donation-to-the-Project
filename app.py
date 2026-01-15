from flask import Flask, render_template
import webbrowser
from controllers.login_controllers import auth

app = Flask(__name__)

app.secret_key = "reeva_secret_key_123"  


app.register_blueprint(auth)

@app.route("/")
def login():
    return render_template("Login.html")

@app.route("/Reeva")
def reeva():
    return render_template("Reeva.html")

@app.route("/Form")
def Form():
    return render_template("Formulario.html")

if __name__ == "__main__":
    webbrowser.open("http://127.0.0.1:5000/")
    app.run(debug=True)
