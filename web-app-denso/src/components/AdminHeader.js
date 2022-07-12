import { Button, Col, Row } from "react-bootstrap";
import { useNavigate } from "react-router-dom";
import '../styles/AdminHeader.css'

function AdminHeader()
{
    let navigate = useNavigate();

    const logout = () =>
    {
        localStorage.removeItem("token");
        navigate('/login', { replace: true })
    }

    return (
        <Row className="header-style">
            <Col>
                <Row><h1>DENSO</h1></Row>
                <Row><h6>Crafting the Core</h6></Row>
            </Col>
            <Col><Button variant="light" style={{float: 'right'}} size="lg" onClick={logout}>Cerrar Sesión</Button></Col>
        </Row>
    );
}

export default AdminHeader