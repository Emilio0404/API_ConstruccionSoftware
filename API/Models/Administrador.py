import flask
from .. import db

class Administrador(db.Model):
    __tablename__ = 'Administrador'
    AdminID = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(255))
    hashPassword =  db.Column(db.String(255))
    telefono =  db.Column(db.String(40))
    primerNombre =  db.Column(db.String(255))
    segundoNombre =  db.Column(db.String(255))
    apellidoPaterno =  db.Column(db.String(255))
    apellidoMaterno =  db.Column(db.String(255))