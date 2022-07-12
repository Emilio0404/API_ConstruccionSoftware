import React from "react";
import { useState } from "react";
import { Modal, Row, Col, Alert, Button} from "react-bootstrap";
import axios from 'axios'
import { Link } from 'react-router-dom'


function CandidatePreview(props)
{
    const BASE_URL = 'http://127.0.0.1:5000';
    const API = axios.create({
            baseURL: BASE_URL
    });

    API.defaults.headers.common["Authorization"] = `Bearer ${localStorage.getItem("token")}` 

    const [show, setShow] = useState(false);
    const [userIdToDelete, setIdToDelete] = useState(-1)

    const closeDelete = () => 
    {
        setIdToDelete(-1);
        setShow(false);
    }

    const confirmDelete = (_userID) =>
    {
        setIdToDelete(_userID);
        setShow(true);
    }

    const deleteUser = () =>
    {
        API.get('/delete_user?userID=' + userIdToDelete)
            .then(function (response) {
                if (response.status === 200)
                {
                    window.location.reload();
                }
            })
            .catch(function(error) {
                console.log(error.response.data.message);
        });
    }


    return (
        <>
        <React.Fragment>
        {
            props.candidatos.map((infoCandidato) => (
            <Alert className="opacity-100" variant={'light'}>
                <Row className="alert-content-style">
                    <Col md={2}><Link to={'candidato?userID=' + infoCandidato.id}>
                        <Button variant="link-dark"><u>
                            { (infoCandidato.primerNombre ? infoCandidato.primerNombre : '' ) + ' ' +
                            (infoCandidato.segundoNombre ? infoCandidato.segundoNombre : '' ) + ' ' +
                            (infoCandidato.apellidoPaterno ? infoCandidato.apellidoPaterno : '' ) + ' ' +
                            (infoCandidato.apellidoMaterno ? infoCandidato.apellidoMaterno : '' )
                            }</u>
                        </Button></Link>
                    </Col>
                    <Col md={6} className="pt-2">
                        {infoCandidato.email}
                    </Col>
                    <Col  className="pt-2">
                        {infoCandidato.examenNoContestado ? <b>Examen no contestado</b> : 'Examen Contestado'}
                        </Col>
                    <Col>
                        <Button variant="link-dark" onClick={() => confirmDelete(infoCandidato.id)}><u>Eliminar candidato</u></Button>
                    </Col>
                </Row>
            </Alert>
        ))}
        </React.Fragment>

        <Modal show={show} onHide={closeDelete}>
                <Modal.Header closeButton>
                    <Modal.Title>Eliminar candidato</Modal.Title>
                </Modal.Header>
                    <Modal.Body>¿Estás seguro de que quieres eliminar a este candidato?</Modal.Body>
                <Modal.Footer>
                <Button variant="secondary" onClick={closeDelete}>Cerrar</Button>
                <Button variant="danger" onClick={deleteUser}>Sí, estoy seguro</Button>
                </Modal.Footer>
        </Modal>
        </>
    );
}

export default CandidatePreview;