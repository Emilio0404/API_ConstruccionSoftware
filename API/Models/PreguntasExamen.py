from .. import db

class PreguntasExamen(db.Model):
    __tablename__ = 'PreguntasExamen'
    ExamenID = db.Column(db.Integer, primary_key=True)
    PreguntaID = db.Column(db.Integer, primary_key=True)