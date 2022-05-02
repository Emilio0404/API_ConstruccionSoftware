from .. import db

class CriteriosPreguntas(db.Model):
    CriterioID = db.Column(db.Integer, primary_key=True)
    nombreCriterio = db.Column(db.String(255))