from flask import Flask, redirect, url_for
app = Flask(__name__)
  
@app.route('/')
def hello_world():
   return "Hello World"


@app.route('/<name>')
def hello_name(name):
   return 'Hello %s!' % name
  
if __name__ == '__main__':
   app.run()