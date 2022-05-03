from flask import Blueprint, jsonify, request
from API.Models.Usuario import Usuario
from flask_jwt_extended import create_access_token, jwt_required
from .. import db, flask_bcrypt
import sqlalchemy


user_bp = Blueprint('user', __name__, url_prefix='/user')


@user_bp.route('/login', methods=['POST'])
def loginUser():
    # Get user information
    email = request.json.form("email")
    password = request.json.form("password")

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

    # Obtener informacion del examen y guardarla en row
    informacionExamen = db.session.execute(sqlalchemy.text("EXEC ObtenerInformacionUsuarioYResultadosDeUltimoExamenPresentadoPorUsuario @IdUsuario = :paramUsuarioID"),
        { "paramUsuarioID" : userID }).fetchall()
    row = informacionExamen[0]

    # Añadir la información del usuario
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
        "resultadosTest" : {
            "acronimo" : "",
            "Comunicación" : "",
            "Toma de decisiones" : "",
            "Gestión de cambios" : "",
            "Gestión de conflictos" : ""
        },
        "respuestas" : []
    }

    # Obtener respuestas examen
    preguntas_y_respuestas_examen = db.session.execute(sqlalchemy.text("EXEC ObtenerPreguntasRespuestadDeUltimoExamenPresentadoPorUsuario @IdUsuario = :paramUsuarioID"),
        { "paramUsuarioID" : userID }).fetchall()

    # Se agrega únicamente la información relevante al json a mandar (por ejemplo, la respuesta que escogió)
    for row in preguntas_y_respuestas_examen:
        informacionRelevanteDeFila = {}
        diccionarioDeFila = dict(row)

        informacionRelevanteDeFila["numPregunta"] = diccionarioDeFila["PreguntaID"]
        informacionRelevanteDeFila["pregunta"] = diccionarioDeFila["pregunta"]
        informacionRelevanteDeFila["criterioPregunta"] = diccionarioDeFila["nombreCriterio"]
        
        if diccionarioDeFila['letraRespuesta'] == 'A':
            informacionRelevanteDeFila['respuesta'] = diccionarioDeFila['OpcionA']
        elif diccionarioDeFila['letraRespuesta'] == 'B':
            informacionRelevanteDeFila['respuesta'] = diccionarioDeFila['OpcionB']
        elif diccionarioDeFila['letraRespuesta'] == 'C':
            informacionRelevanteDeFila['respuesta'] = diccionarioDeFila['OpcionC']
        elif diccionarioDeFila['letraRespuesta'] == 'D':
            informacionRelevanteDeFila['respuesta'] = diccionarioDeFila['OpcionD']

        datos_y_resultados["respuestas"].append(informacionRelevanteDeFila)

    # Calcular resultado del test
    acronimo = "1234"

    # Primera letra
    suma = calcularPuntajeCriterioTest(preguntas_y_respuestas_examen, 0, 1)
    if suma >= 45:
        acronimo = acronimo.replace('1', 'E')
        datos_y_resultados['resultadosTest']['Comunicación'] = 'Extrovertido'
    else:
        acronimo = acronimo.replace('1', 'I')
        datos_y_resultados['resultadosTest']['Comunicación'] = 'Introvertido'

    # Segunda letra
    suma = calcularPuntajeCriterioTest(preguntas_y_respuestas_examen, 1, 4)
    if suma >= 45:
        acronimo = acronimo.replace('2', 'S')
        datos_y_resultados['resultadosTest']['Toma de decisiones'] = 'Observador / Orientado a Sensación'
    else:
        acronimo = acronimo.replace('2', 'N')
        datos_y_resultados['resultadosTest']['Toma de decisiones'] = 'Basado en la intuición'

    # Tercera letra
    suma = calcularPuntajeCriterioTest(preguntas_y_respuestas_examen, 4, 7)
    if suma >= 45:
        acronimo = acronimo.replace('3', 'T')
        datos_y_resultados['resultadosTest']['Gestión de cambios'] = 'Gestionado por pensamiento'
    else:
        acronimo = acronimo.replace('3', 'F')
        datos_y_resultados['resultadosTest']['Gestión de cambios'] = 'Gestionado desde plano emocional'

    # Cuarta letra
    suma = calcularPuntajeCriterioTest(preguntas_y_respuestas_examen, 7, 10)
    if suma >= 45:
        acronimo = acronimo.replace('4', 'J')
        datos_y_resultados['resultadosTest']['Gestión de conflictos'] = 'Gestionado por medio de juicio'
    else:
        acronimo = acronimo.replace('4', 'P')
        datos_y_resultados['resultadosTest']['Gestión de conflictos'] = 'Gestionado por medio de percepcion'
    

    datos_y_resultados['resultadosTest']['acronimo'] = acronimo

    return jsonify(datos_y_resultados), 200


def calcularPuntajeCriterioTest(respuestasExamen, startIndex, endIndex):
    suma = 0

    for i in range(startIndex, endIndex):
        diccionarioPregunta = dict(respuestasExamen[i])
        letraRespuesta = diccionarioPregunta["letraRespuesta"]
        if letraRespuesta == 'A':
            suma += int(diccionarioPregunta["valorOpcionA"])
        elif letraRespuesta == 'B':
            suma += int(diccionarioPregunta["valorOpcionB"])
        elif letraRespuesta == 'C':
            suma += int(diccionarioPregunta["valorOpcionC"])
        elif letraRespuesta == 'D':
            suma += int(diccionarioPregunta["valorOpcionD"])

    return suma