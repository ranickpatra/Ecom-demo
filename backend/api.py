# from flask import Flask

# from dbcommunicator import database


# app = Flask(__name__)

# @app.route('/')
# def hello_world():
#    database.init()
#    return ''


# if __name__ == '__main__':
#    app.run(port=8000, debug=True)

from dbcommunicator import databae

db = databae.DATABSE()
db.init()