from .. import db

class InstanciaExamen(db.Model):
    __tablename__ = 'InstanciaExamen'
    InstanciaID = db.Column(db.Integer, primary_key=True)
    ExamenID = db.Column(db.Integer, db.ForeignKey('Examen.ExamenID'))
    UserID = db.Column(db.Integer, db.ForeignKey('Usuario.UserID'))
    fechaContestado = db.Column(db.DateTime)
    puntajeJuego = db.Column(db.Float)
    tiempoJuego = db.Column(db.Time)