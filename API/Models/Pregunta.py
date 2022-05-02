from .. import db

class Pregunta(db.Model):
    __tablename__ = 'Pregunta'
    PreguntaID = db.Column(db.Integer, primary_key=True)
    pregunta = db.Column(db.String(500))
    opcionA = db.Column(db.String(500))
    opcionB = db.Column(db.String(500))
    opcionC = db.Column(db.String(500))
    opcionD = db.Column(db.String(500))
    valorOpcionA = db.Column(db.Float)
    valorOpcionB = db.Column(db.Float)
    valorOpcionC = db.Column(db.Float)
    valorOpcionD = db.Column(db.Float)
    criterio = db.Column(db.Integer, db.ForeignKey('CriteriosPreguntas.CriterioID'))