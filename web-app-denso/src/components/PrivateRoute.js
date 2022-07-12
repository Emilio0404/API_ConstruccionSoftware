import React from "react"
import { Navigate } from "react-router-dom";


export const PrivateRoute = ({ children }) => {

    // Check if user is logged in with a token
    const token = localStorage.getItem("token");
    if (token && token !== "" && token !== undefined)
    {
        return children
    }
      
    return <Navigate to="/login" replace={true}/>
}
export default PrivateRoute;