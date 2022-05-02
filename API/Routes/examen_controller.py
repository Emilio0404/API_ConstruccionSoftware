from flask import Blueprint, request, jsonify
import sqlalchemy
from API.Models.PreguntasExamen import PreguntasExamen
from API.Models.Pregunta import Pregunta
from API.Models.Examen import Examen
from API.Models.TiposExamen import TiposExamen
from API.Models.InstanciaExamen import InstanciaExamen
from API.Models.CriteriosPreguntas import CriteriosPreguntas
from flask_jwt_extended import get_jwt_identity, jwt_required
from .. import db

examen_bp = Blueprint('pregunta', __name__)


#@jwt_required()
@examen_bp.route('/get_preguntas', methods=['GET'])
def getPreguntasDeExamen():
    # Obtener Examen ID
    examID = request.args.get('examenID')

    # Obtener los ids de las preguntas que están en el examen solicitado (identificado por examID)
    query_ids_preguntas = PreguntasExamen.query.with_entities(PreguntasExamen.PreguntaID).filter_by(ExamenID=examID)

    # Añadir los ids a una lista
    ids_preguntas = []
    for row in query_ids_preguntas:
        ids_preguntas.append(row.PreguntaID)

    # Asegurarse de que haya preguntas en el examen
    if len(ids_preguntas) == 0:
        return {'success' : False, "message" : 'ERROR: No hay preguntas en este examen'}, 400

    # Obtener la inforamción de las preguntas que estén en el examen recibido
    query_get_preguntas = Pregunta.query.filter(Pregunta.PreguntaID.in_(ids_preguntas))
    
    # Regresar datos de las preguntas en un arreglo de diccionarios
    preguntas = []
    for row in query_get_preguntas:
        preguntas.append({
            'PreguntaID' : row.PreguntaID,
            'Pregunta' : row.pregunta,
            'OpcionA' : row.opcionA,
            'OpcionB' : row.opcionB,
            'OpcionC' : row.opcionC,
            'OpcionD' : row.opcionD
        })
    
    return jsonify({'preguntas' : preguntas}), 201


@examen_bp.route('/post_examen', methods=['POST'])
@jwt_required()
def publicarExamen():

    # Guardar parametros del post request
    IdExamen = request.json.get("IdExamen")
    IdUsuario = get_jwt_identity()
    puntaje = request.json.get("puntaje")
    tiempoDeJuego = request.json.get("tiempoJuego")
    idsPreguntas = request.json.get("idsPreguntas")
    respuestas = request.json.get("respuestas")

    # Checar que vengan todos los parametros y que respuestas y idsPreguntas sean del mismo tamaño

    # Ejecutar stores procedure pasando los parametros
    db.session.execute(sqlalchemy.text("EXEC PublicarInstanciaExamen @IdExamen = :examenID, @IdUsuario = :usuarioID, @puntaje = :puntajeUsuario, @tiempoDeJuego = :tiempoJuego"),
        { "examenID":IdExamen, "usuarioID":IdUsuario, "puntajeUsuario":puntaje, "tiempoJuego":tiempoDeJuego }
    )
    
    idInstancia = InstanciaExamen.query.filter_by(ExamenID=IdExamen, UserID=IdUsuario, tiempoJuego=tiempoDeJuego).first()

    for idPregunta, respuesta in zip(idsPreguntas, respuestas):
        db.session.execute(sqlalchemy.text("EXEC PublicarRespuestaExamen @IdInstancia = :InstanciaID, @IdPregunta = :PreguntaID, @Respuesta = :letraRespuesta"),
            { "InstanciaID":idInstancia.InstanciaID, "PreguntaID":idPregunta, "letraRespuesta":respuesta }
        )

    db.session.commit()

    return jsonify({'success' : True, 'message' : 'Examen publicado correctamente'}), 201