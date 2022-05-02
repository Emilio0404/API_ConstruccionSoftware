from .. import db

class Usuario(db.Model):
    __tablename__ = 'Usuario'
    UserID = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(255))
    hashPassword =  db.Column(db.String(255))
    telefono =  db.Column(db.String(40))
    primerNombre =  db.Column(db.String(255))
    segundoNombre =  db.Column(db.String(255))
    apellidoPaterno =  db.Column(db.String(255))
    apellidoMaterno =  db.Column(db.String(255))
    Linkedin = db.Column(db.String(255))
    fechaNacimiento = db.Column(db.Date)
    hasPendingExam = db.Column(db.Integer)
    managedBy = db.Column(db.Integer, db.ForeignKey('Administrador.AdminID'))