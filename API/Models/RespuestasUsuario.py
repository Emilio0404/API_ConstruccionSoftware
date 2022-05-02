from sqlalchemy import ForeignKeyConstraint
from .. import db
from flask_sqlalchemy import ForeignKeyConstraint

class RespuestasUsuario(db.Model):
    __tablebame__ = 'RespuestasUsuario'
    InstanciaID = db.Column(db.Integer, primary_key=True)
    PreguntaID = db.Column(db.Integer, primary_key=True)
    letraRespuesta = db.Column(db.String(1))
    ForeignKeyConstraint(['InstanciaID', 'PreguntaID'], ['InstanciaExamen.InstanciaID', 'Pregunta.PreguntaID'])