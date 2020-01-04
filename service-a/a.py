from flask import Flask

app = Flask("service a")

@app.route("/")
def hello():
    return "Hello, World from service a!"

if __name__ == "__main__":
    app.run(host='127.0.0.1', port=2000)
