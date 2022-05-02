from flask import Blueprint, request, jsonify
from flask_jwt_extended import create_access_token, get_jwt_identity, jwt_required
from API.Models.Administrador import Administrador
from API.Models.Usuario import Usuario
from .. import db, flask_bcrypt


admin_bp = Blueprint('admin', __name__)


@admin_bp.route('/register_admin', methods=['POST'])
def registerAdmin():
    new_admin_data = request.json

    if new_admin_data['password'] != new_admin_data['validatePassword']:
        return jsonify({'success' : False, 'message' : 'Las contraseñas son diferentes'}), 400

    new_admin = Administrador(
        email = new_admin_data['email'],
        hashPassword = flask_bcrypt.generate_password_hash(new_admin_data['password']).decode('utf-8'),
        telefono = new_admin_data['telefono'],
        primerNombre = new_admin_data['primerNombre'],
        segundoNombre = new_admin_data['segundoNombre'],
        apellidoPaterno = new_admin_data['apellidoPaterno'],
        apellidoMaterno = new_admin_data['apellidoMaterno']
    )

    db.session.add(new_admin)
    db.session.commit()

    return jsonify({'success' : True, 'message' : 'Administrador creado correctamente'}), 201


@admin_bp.route('/login', methods=['POST'])
def login():
    # Get user information
    email = request.json.get("email")
    password = request.json.get("password")

    # Verificar que correo y contraseña fueron proveidos
    if email is None:
        return jsonify({"success" : False, "message" : "Debes proveer un correo"}), 400
    elif password is None:
        return jsonify({"success" : False, "message" : "Debes proveer una contraseña"}), 400

    # Verificar que el correo exista
    admin = Administrador.query.filter_by(email=email).first()
    if not admin:
        return jsonify({"success" : False, "message" : "El usuario no fue encontrado"}), 404

    # Asegurarse de que es correcta la contraseña
    if not flask_bcrypt.check_password_hash(admin.hashPassword, password):
        return jsonify({"success" : False, "message" : "La contraseña no coincide"}), 404

    # Crear y regresar token
    access_token = create_access_token(identity=admin.AdminID)
    return jsonify(access_token=access_token), 200


@admin_bp.route('/add_user', methods=['POST'])
@jwt_required()
def addUser():
    new_user_data = request.json

    # Asegurarse de que contraseña y correo sean proveidos
    if not new_user_data['password']:
        return jsonify({'success' : False, 'message' : 'ERROR: Por favor inserte una contraseña'}), 400
    elif not new_user_data['validatePassword']:
        return jsonify({'success' : False, 'message' : 'ERROR: Por favor inserte una contraseña'}), 400
    elif not new_user_data['email']:
        return jsonify({'success' : False, 'message' : 'ERROR: Debe proveer un correo'}), 400

    # Asegurarse de que las contraseñas coincidan
    if new_user_data['password'] != new_user_data['validatePassword']:
        return jsonify({'success' : False, 'message' : 'ERROR: Las contraseñas son diferentes'}), 400

    # Ensure email is not already in the database
    if not Usuario.query.filter_by(email=new_user_data['email']):
        return {'success' : False, 'message' : 'ERROR: Este correo ya se encuentra en uso.'}, 400

    # Crear nuevo usuario
    new_user = Usuario(
        email = new_user_data['email'],
        hashPassword = flask_bcrypt.generate_password_hash(new_user_data['password']).decode('utf-8'),
        telefono = new_user_data['telefono'],
        primerNombre = new_user_data['primerNombre'],
        segundoNombre = new_user_data['segundoNombre'],
        apellidoPaterno = new_user_data['apellidoPaterno'],
        apellidoMaterno = new_user_data['apellidoMaterno'],
        Linkedin = new_user_data['Linkedin'],
        fechaNacimiento = new_user_data['fechaNacimiento'],
        hasPendingExam = 1,
        managedBy = get_jwt_identity()
    )

    # Añadirlo a la base de datos
    db.session.add(new_user)
    db.session.commit()

    return jsonify({'success' : True, 'message' : 'Usuario creado correctamente'}), 201


@admin_bp.route('/delete_user', methods=['GET'])
@jwt_required()
def deleteUser():
    # Obtener usuario
    userID = request.args.get('userID')
    user_to_delete = Usuario.query.filter_by(UserID=userID).first()

    if not user_to_delete:
        return jsonify({'success' : False, 'message' : 'No se encontró el usuario a borrar'}), 404

    # Eliminar ususario
    db.session.delete(user_to_delete)
    db.session.commit()

    return jsonify({'success' : True, 'message' : 'Usuario eliminado correctamente'}), 200


@admin_bp.route('/get_candidatos', methods=['GET'])
@jwt_required()
def getCandidatesManagedByAdmin():

    # Consultar candidatos manejados por el administrador de la sesion
    adminID = get_jwt_identity()

    candidatesList = []
    query_candidates = Usuario.query.filter_by(managedBy=adminID)

    for candidate in query_candidates:
        candidatesList.append(
            {
                'id' : candidate.UserID,
                'email' : candidate.email,
                'primerNombre' : candidate.primerNombre,
                'segundoNombre' : candidate.segundoNombre,
                'apellidoPaterno' : candidate.apellidoPaterno,
                'apellidoMaterno' : candidate.apellidoMaterno,
                'examenNoContestado' : candidate.hasPendingExam,
            }
        )

    return jsonify(candidatos=candidatesList), 200


@admin_bp.route('/getIdentity', methods=['POST'])
@jwt_required()
def getIdentity():
    current_user = get_jwt_identity()
    return jsonify(logged_in_as=current_user), 200