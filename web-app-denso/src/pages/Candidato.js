import { Col, Row } from "react-bootstrap";
import { useState, useEffect } from "react";
import { useNavigate, useSearchParams } from 'react-router-dom'
import AdminHeader from '../components/AdminHeader.js'
import CandidateInfoContainer from '../components/CandidateInfoContainer.js';
import ExamInfoContainer from '../components/ExamInfoContainer.js';
import '../styles/Candidate.css'
import axios from 'axios'

function Candidato()
{
    // Obtener parametro de id usuario de la url
    const [searchParams] = useSearchParams();
    let navigate = useNavigate();


    // Variables de información de usuario
    const [email, setEmail] = useState('');
    const [nombreCompleto, setNombreCompleto] = useState('');
    const [telefono, setTelefono] = useState('');
    const [linkedin, setLinkedin] = useState('');
    const [fechaNacimiento, setFechaNacimiento] = useState('');
    const [fechaContestado, setFechaContestado] = useState('');
    const [puntaje, setPuntaje] = useState(-1);
    const [tiempoJuego, setTiempoJuego] = useState('');
    const [resultadosTest, setResultadosTest] = useState(-1);
    const [respuestas, setResultadosRespuestas] = useState([]);

    // Obtener informacion de candidato al cargar pagina
    useEffect(() => {
        const BASE_URL = 'http://127.0.0.1:5000';
        const API = axios.create({
                baseURL: BASE_URL
        });

        API.defaults.headers.common["Authorization"] = `Bearer ${localStorage.getItem("token")}`;

        // Call for candidates managed by this user
        API.get('/user/get_informacion_usuario_examen?userID=' + searchParams.get("userID"))
            .then(function (response) {
                if (response.status === 200)
                {
                    
                    console.log('tyeof response', typeof(response.data.respuestas))
                    console.log(response.data.respuestas)
                    setNombreCompleto(
                        (response.data.primerNombre ? response.data.primerNombre + ' ' : '') +
                        (response.data.segundoNombre ? response.data.segundoNombre  + ' ' : '') + 
                        (response.data.apellidoPaterno ? response.data.apellidoPaterno  + ' ' : '') +
                        (response.data.apellidoMaterno ? response.data.apellidoPaterno : '')
                    );
                    setEmail(response.data.email ? response.data.email : 'Dato no disponible');
                    setTelefono(response.data.telefono ? response.data.telefono : 'Dato no disponible');
                    setLinkedin(response.data.linkedin ? response.data.linkedin : 'Dato no disponible');
                    setFechaNacimiento(response.data.fechaNacimiento ? response.data.fechaNacimiento : 'Dato no disponible');
                    setFechaContestado(response.data.fechaContestado);
                    setPuntaje(response.data.puntajeJuego);
                    setTiempoJuego(response.data.tiempoJuego);
                    setResultadosTest(response.data.resultadosTest);
                    setResultadosRespuestas(response.data.respuestas);
                }
            })
            .catch(function(error) {
                console.log(error);
                if (error.response.status === 401)
                {
                    navigate('/login', { replace: true })
                }
        });
    }, []);


    return (
        <div className='background'>
        <div className='main-container'>
            <AdminHeader></AdminHeader>
            <Row className='my-auto mt-5'>
                <Col>
                    <CandidateInfoContainer
                        nombreCompleto={nombreCompleto}
                        email={email}
                        telefono={telefono}
                        linkedin={linkedin}
                        fechaNacimiento={fechaNacimiento}>
                    </CandidateInfoContainer>
                </Col>
                <Col>
                    <ExamInfoContainer
                        fechaContestado={fechaContestado}
                        puntaje={puntaje}
                        tiempoJuego={tiempoJuego}
                        resultadosTest={resultadosTest}
                        respuestas={respuestas}>
                    </ExamInfoContainer>
                </Col>
                <Col></Col>
            </Row>
        </div>
        </div>
    );
}

export default Candidato;