import { useEffect, useState } from "react";
import { Modal, Button, Col, Row, Container } from "react-bootstrap";
import { useNavigate } from "react-router-dom";
import AdminHeader from '../components/AdminHeader.js'
import CandidatePreview from '../components/CandidatePreview'
import '../styles/Applicants.css'
import axios from 'axios'

function Applicants()
{
    const [candidatos, setCandidatos] = useState([]);

    let navigate = useNavigate();

    // Get candidates of logged in admin
    useEffect(() => {

        const BASE_URL = 'http://127.0.0.1:5000';
        const API = axios.create({
                baseURL: BASE_URL
        });

        API.defaults.headers.common["Authorization"] = `Bearer ${localStorage.getItem("token")}` 

        // Call for candidates managed by this user
        API.get('/get_candidatos')
            .then(function (response) {
                if (response.status === 200)
                {
                    setCandidatos(response.data.candidatos)
                }
                else if (response.status === 401)
                {
                    navigate('/login', { replace: true })
                }
            })
            .catch(function(error) {
                console.log(error);
                if (error.response.status === 401)
                {
                    navigate('/login', { replace: true })
                }
        });
    }, [])


    // Handle add user modal
    const [show, setShow] = useState(false);
    const handleClose = () => { setShow(false); }
    const handleOpen = () => { setShow(true); }

    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [validatePassword, setValidatePassword] = useState('');
    const [telefono, setTelefono] = useState('');
    const [primerNombre, setPrimerNombre] = useState('');
    const [segundoNombre, setSegundoNombre] = useState('');
    const [apellidoPaterno, setApellidoPaterno] = useState('');
    const [apellidoMaterno, setApellidoMaterno] = useState('');
    const [Linkedin, setLinkedin] = useState('');
    const [fechaNacimiento, setFechaNacimiento] = useState('');


    // Add user
    const addUser = () =>
    {
        const BASE_URL = 'http://127.0.0.1:5000';
        const API = axios.create({
                baseURL: BASE_URL
        });

        API.defaults.headers.common["Authorization"] = `Bearer ${localStorage.getItem("token")}` 

        let user_data = {
            email : email,
            password : password,
            validatePassword : validatePassword,
            telefono : telefono,
            primerNombre : primerNombre,
            segundoNombre : segundoNombre,
            apellidoPaterno : apellidoPaterno,
            apellidoMaterno : apellidoMaterno,
            Linkedin : Linkedin,
            fechaNacimiento : fechaNacimiento
        };

        API.post('/add_user', user_data)
            .then(function (response) {
                if (response.status === 201)
                {
                    console.log('Added user successfully')
                    window.location.reload();
                }
            })
            .catch(function(error) {
                console.log(error.response.data.message);
        });
    }


    return (
        <div className='background'>
            <div className='main-container'>
                <AdminHeader></AdminHeader>
                <div className='my-auto mt-4'>
                    <Row className='candidate-options'>
                        <Col sm={1}></Col>
                        <Col className='pt-2'><h4>Candidatos actuales</h4></Col>
                        <Col md={{offset:6}} className="text-center"><Button onClick={handleOpen} size="lg" variant="light">Añadir Usuario</Button></Col>
                        <Col className='pt-2'><h4><u>Filtrar</u></h4></Col>
                    </Row>
                    <Row className='mt-3'>
                        <Container className="rounded candidates-container overflow-auto">
                            <CandidatePreview candidatos={candidatos}></CandidatePreview>
                        </Container>
                    </Row>
                </div>
            </div>

            <Modal show={show} onHide={handleClose}>
                <Modal.Header closeButton>
                    <Modal.Title>Añadir Usuario</Modal.Title>
                </Modal.Header>
                    <Modal.Body>
                        <input type='email' value={email} className='input form-control' placeholder='email@example.com' onChange={(e) => setEmail(e.target.value)}></input>
                        <input type='password' value={password} className='input form-control' placeholder='Contraseña' onChange={(e) => setPassword(e.target.value)}></input>
                        <input type='password' value={validatePassword} className='input form-control' placeholder='Valida la contraseña' onChange={(e) => setValidatePassword(e.target.value)}></input>
                        <input type='text' value={telefono} className='input form-control' placeholder='Telefono' onChange={(e) => setTelefono(e.target.value)}></input>
                        <input type='text' value={primerNombre} className='input form-control' placeholder='Primer Nombre' onChange={(e) => setPrimerNombre(e.target.value)}></input>
                        <input type='text' value={segundoNombre} className='input form-control' placeholder='Segundo Nombre' onChange={(e) => setSegundoNombre(e.target.value)}></input>
                        <input type='text' value={apellidoPaterno} className='input form-control' placeholder='Apellido Paterno' onChange={(e) => setApellidoPaterno(e.target.value)}></input>
                        <input type='text' value={apellidoMaterno} className='input form-control' placeholder='Apellido Materno' onChange={(e) => setApellidoMaterno(e.target.value)}></input>
                        <input type='text' value={Linkedin} className='input form-control' placeholder='Usuario de Linkedin' onChange={(e) => setLinkedin(e.target.value)}></input>
                        <input type='date' value={fechaNacimiento} className='input form-control' placeholder='YYYY-MM-DD' onChange={(e) => setFechaNacimiento(e.target.value)}></input>
                    </Modal.Body>
                <Modal.Footer>
                <Button variant="secondary" onClick={handleClose}>Cerrar</Button>
                <Button variant="primary" onClick={addUser}>Añadir Usuario</Button>
                </Modal.Footer>
            </Modal>

        </div>
    );
}

export default Applicants;