from flask import Blueprint, jsonify, request
from API.Models.Usuario import Usuario
from flask_jwt_extended import create_access_token, get_jwt_identity, jwt_required
from .. import flask_bcrypt


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