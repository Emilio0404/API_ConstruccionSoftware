from .. import db

class Examen(db.Model):
    ExamenID = db.Column(db.Integer, primary_key=True)
    nombreExamen = db.Column(db.String(255))
    tipoExamenID = db.Column(db.Integer, db.ForeignKey('TiposExamen.TipoExamenID'))