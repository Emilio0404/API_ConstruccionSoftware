import { useState } from 'react';
import { useNavigate } from "react-router-dom";
import '../styles/Login.css'
import axios from 'axios'

function Login()
{
    let navigate = useNavigate();

    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');

    const BASE_URL = 'http://127.0.0.1:5000';
    const API = axios.create({
            baseURL: BASE_URL
    });


    const login = () =>
    {
        let user_data = {
            email : email,
            password : password
        };

        API.post('/login', user_data)
            .then(function (response) {
                if (response.status === 200)
                {
                    localStorage.setItem('token', response.data.access_token)
                    navigate('/', { replace: true })
                }
            })
            .catch(function(error) {
                console.log(error.response);
        });
    }


    return (
        <div className='full-screen-container'>
            <div className='center-input'>
                <div className='title'>
                    <h1 className='companyName'>DENSO</h1>
                    <h5 className='h5'>CRAFTING THE CORE</h5>
                </div>
                <div className='forms'>
                    <input type='email' value={email} className='input form-control' placeholder='youremail@example.com' onChange={(e) => setEmail(e.target.value)}></input>
                    <input type='password' value={password} className='input form-control' placeholder='Your password' onChange={(e) => setPassword(e.target.value)}></input>
                    <button onClick={login} className='buttonClass btn btn-light'>Login</button>
                </div>
            </div>
        </div>
    );
}

export default Login;