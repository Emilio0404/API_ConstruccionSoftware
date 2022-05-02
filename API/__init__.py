# Is it necessary to create a model for each table
# What is flask cors
# How do sessions work exactly

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from flask_jwt_extended import JWTManager
from flask_cors import CORS
from datetime import timedelta
import urllib
import os

db = SQLAlchemy()
flask_bcrypt = Bcrypt()
jwt = JWTManager()

def create_app():
    app = Flask(__name__)

    # Enable hashing methods
    flask_bcrypt.init_app(app)

    # Set database access
    params = urllib.parse.quote_plus('DRIVER={SQL Server};SERVER=LAPTOP-0SAS4V0U;DATABASE=ContratacionDenso;Trusted_Connection=yes;')
    app.config['SQLALCHEMY_DATABASE_URI'] = "mssql+pyodbc:///?odbc_connect=%s" % params
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.init_app(app)

    # Enable CORS
    CORS(app)

    # Setup access tokens
    app.config['JWT_SECRET_KEY'] = os.environ.get('JWT_SECRET_KEY')
    app.config["JWT_ACCESS_TOKEN_EXPIRES"] = timedelta(hours=1)
    jwt.init_app(app)

    # Import blueprints to specify urls
    from API.Routes.usuario_controller import user_bp
    from API.Routes.examen_controller import examen_bp
    from API.Routes.admin_controller import admin_bp
    app.register_blueprint(user_bp)
    app.register_blueprint(examen_bp)
    app.register_blueprint(admin_bp)

    return app