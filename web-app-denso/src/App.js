import { BrowserRouter, Route, Routes } from 'react-router-dom'

import Login from './pages/Login.js'
import Applicants from './pages/Applicants.js'
import Candidato from './pages/Candidato.js'

import PrivateRoute from './components/PrivateRoute.js'
import './App.css';
import './styles/Login.css'


function App() {

  return (
    <div>
      <BrowserRouter>
        <Routes>
          <Route path='/' element={<PrivateRoute><Applicants/></PrivateRoute>}/>
          <Route path='/login' element={<Login/>}></Route>
          <Route path='/candidato' element={<PrivateRoute><Candidato/></PrivateRoute>}/>
        </Routes> 
      </BrowserRouter>
    </div>
  );

}

export default App;
