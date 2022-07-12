import { Table, Col, Row, Container } from "react-bootstrap";
import '../styles/InfoContainers.css'


function ExamInfoContainer(props)
{
    return (
        <Container className='information-container rounded overflow-auto' style={{"height" : "40rem", "width" : "75rem"}}>
            <Row className='mt-2'>
                <Col className='align-column'>
                    <h1><b>Resultados de test</b></h1>
                </Col>
            </Row>
            <Row className='mt-4'>
                <Col><h4><b><u>Resultado de personalidad</u>:</b> {props.resultadosTest.acronimo}</h4></Col> 
            </Row>
            <Row className='mt-3'>
                <Col><h5><b>Comunicación: </b>{props.resultadosTest["Comunicación"]}</h5></Col>
            </Row>
            <Row className='mt-3'>
                <Col><h5><b>Gestión de cambios: </b>{props.resultadosTest["Gestión de cambios"]}</h5></Col>
            </Row>
            <Row className='mt-3'>
                <Col><h5><b>Gestión de conflictos: </b>{props.resultadosTest["Gestión de conflictos"]}</h5></Col>
            </Row>
            <Row className='mt-3'>
                <Col><h5><b>Toma de decisiones: </b>{props.resultadosTest["Toma de decisiones"]}</h5></Col>
            </Row>
            <Row className='mt-4'>
                <Col><h4><b><u>Respuestas del test</u>:</b></h4></Col>
            </Row>
            <Container className='mt-3'>
                <Table striped bordered hover variant='light'>
                    <thead>
                        <tr>
                        <th>#</th>
                        <th>Pregunta</th>
                        <th>Respuesta</th>
                        <th>Criterio</th>
                        </tr>
                    </thead>
                    <tbody>{
                        props.respuestas.map((respuesta) => (
                            <tr>
                                <td>{respuesta["numPregunta"] ? respuesta["numPregunta"] : 'cargando'}</td>
                                <td>{respuesta["pregunta"] ? respuesta["pregunta"] : 'cargando'}</td>
                                <td>{respuesta["respuesta"]? respuesta["respuesta"] : 'cargando'}</td>
                                <td>{respuesta["criterioPregunta"] ? respuesta["criterioPregunta"] : 'cargando'}</td>
                            </tr>
                        ))
                    }</tbody>
                </Table>
            </Container>
            <Row className='mt-4'>
                <Col><h5><b>Fecha contestado: </b>{props.fechaContestado}</h5></Col>
            </Row>
            <Row className='mt-3'>
                <Col><h5><b>Puntaje: </b>{props.puntaje}</h5></Col>
            </Row>
            <Row className='mt-3'>
                <Col><h5><b>Tiempo de juego: </b>{props.tiempoJuego}</h5></Col>
            </Row>
        </Container>
    );
}

export default ExamInfoContainer