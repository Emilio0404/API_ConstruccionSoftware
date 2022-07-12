import { Image, Col, Row, Container } from "react-bootstrap";
import '../styles/InfoContainers.css'


function CandidateInfoContainer(props)
{

    return (
        <Container className='information-container rounded' style={{"height" : "40rem", "width" : "35rem"}}>
            <Row className='mt-2'>
                <Col className='align-column'>
                    <h1><b>Información del Candidato</b></h1>
                </Col>
            </Row>
            <Row className='mt-3'>
                <Col className='align-column'>
                    <Image style={{ display: "block", width: 200, padding: 15 }} src="https://cdn-icons-png.flaticon.com/512/943/943048.png"></Image>
                </Col>
            </Row>
            <Row className='mt-3'>
                <Col><h4><b>Nombre: </b>{props.nombreCompleto}</h4></Col> 
            </Row>
            <Row className='mt-2'>
                <Col><h4><b>Correo: </b>{props.email}</h4></Col>
            </Row>
            <Row className='mt-2'>
                <Col><h4><b>Telefono: </b>{props.telefono}</h4></Col>
            </Row>
            <Row className='mt-2'>
                <Col><h4><b>Linkedin: </b>{props.linkedin}</h4></Col>
            </Row>
            <Row className='mt-2'>
                <Col><h4><b>Fecha de nacimiento: </b>{props.fechaNacimiento}</h4></Col>
            </Row>
        </Container>
    );
}

export default CandidateInfoContainer