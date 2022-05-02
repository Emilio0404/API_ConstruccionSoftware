from .. import db

class TiposExamen(db.Model):
    __tablename__ = 'TiposExamen'
    TipoExamenID = db.Column(db.Integer, primary_key=True)
    nombreTipo = db.Column(db.String(255))