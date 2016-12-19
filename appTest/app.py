from flask import Flask
import socket
app = Flask(__name__)

@app.route("/")
def hello():
     str1 = " Hello World from: " + socket.gethostname()
     return "Hello World!"

if __name__ == "__main__":
    app.run()

