from flask import Flask, render_template

import webbrowser
import conection_db

app = Flask(__name__)

@app.route("/")
def login():
    return render_template("login.html")

if __name__ == "__main__":
    webbrowser.open("http://127.0.0.1:5000/")
    app.run(debug=True)
