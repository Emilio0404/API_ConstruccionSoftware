from flask import Blueprint, jsonify, request
from API.Models.Usuario import Usuario
from flask_jwt_extended import create_access_token, get_jwt_identity, jwt_required
from .. import db, flask_bcrypt
import sqlalchemy

user_bp = Blueprint('user', __name__, url_prefix='/user')


@user_bp.route('/login', methods=['POST'])
def loginUser():
    # Get user information
    email = request.json.get("email")
    password = request.json.get("password")

    # Verificar que correo y contraseña fueron proveidos
    if email is None:
        return jsonify({"success" : False, "message" : "ERROR: Debes proveer un correo"}), 404
    elif password is None:
        return jsonify({"success" : False, "message" : "ERROR: Debes proveer una contraseña"}), 404

    # Verificar que el correo exista
    user = Usuario.query.filter_by(email=email).first()
    if not user:
        return jsonify({"success" : False, "message" : "El usuario no fue encontrado"}), 404

    # Asegurarse de que es correcta la contraseña
    if not flask_bcrypt.check_password_hash(user.hashPassword, password):
        return jsonify({"success" : False, "message" : "La contraseña no coincide"}), 404

    # Crear y regresar token
    access_token = create_access_token(identity=user.UserID)
    return jsonify(access_token=access_token), 200


@user_bp.route('/get_informacion_usuario_examen', methods=['GET'])
@jwt_required()
def getInformacionUsuarioDeExamen():

    # Revisar que el usuario fuera proveido
    userID = request.args.get('userID')
    if not userID:
        return jsonify({"success" : False, "message" : "ERROR: Provide a userID"}), 400


    # Obtener informacion del examen
    informacionExamen = db.session.execute(sqlalchemy.text("EXEC ObtenerInformacionUsuarioYResultadosDeUltimoExamenPresentadoPorUsuario @IdUsuario = :paramUsuarioID"),
        { "paramUsuarioID" : userID }).fetchall()

    row = informacionExamen[0]

    datos_y_resultados = {
        "email" : row[0],
        "telefono" : row[1],
        "primerNombre" : row[2],
        "segundoNombre" : row[3],
        "apellidoPaterno" : row[4],
        "apellidoMaterno" : row[5],
        "linkedin" : row[6],
        "fechaNacimiento" : row[7],
        "fechaContestado" : row[8],
        "puntajeJuego" : row[9],
        "tiempoJuego" : row[10],
        "respuestas" : []
    }

    # Obtener respuestas examen
    preguntas_y_respuestas_examen = db.session.execute(sqlalchemy.text("EXEC ObtenerPreguntasRespuestadDeUltimoExamenPresentadoPorUsuario @IdUsuario = :paramUsuarioID"),
        { "paramUsuarioID" : userID }).fetchall()

    for row in preguntas_y_respuestas_examen:
        datos_y_resultados["respuestas"].append(dict(row))

    return jsonify(datos_y_resultados), 200