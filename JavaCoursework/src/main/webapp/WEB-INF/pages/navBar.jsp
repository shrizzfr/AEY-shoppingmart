<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AEY Shopping Mart</title>
<style>
    @charset "UTF-8";
    /** Container styles **/
    .container {
        margin-right: auto;
        margin-left: auto;
    }
    @media (min-width: 1400px) {
        .container {
            max-width: 1140px;
        }
    }
    @media only screen and (max-width: 1300px) {
        .container {
            width: 95% !important;
            padding: 0 15px;
        }
    }
body {
    padding: 0;
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
}
    /** Header and navbar styles **/
    .main-header {
        position: relative;
        overflow: hidden;
        background-color: #2a85b0;
        top: 0;
        width: 100%;
        z-index: 999;
        padding: 0;
    }
    .navbar {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px 20px;
    }
    .logo-container {
        display: flex;
        align-items: center;
    }
    .logo-container img {
        width: 80px; /* Adjust width as needed */
        height: auto;
    }
    .logo-container h3 {
        font-size: 16px;
        color: white;
        font-weight: 500;
        margin-left: 10px;
    }
    .menu-container {
        display: flex;
    }
    .menu-container nav ul {
        list-style: none;
        display: flex;
        margin: 0;
        padding: 0;
    }
    .menu-container nav ul li {
        margin-left: 20px;
    }
    .menu-container nav ul li a {
        text-decoration: none;
        color: white;
        font-size: 14px;
        font-weight: 500;
        padding: 10px 15px;
    }
    .menu-container nav ul li a:hover {
        color: black;
    }
</style>
</head>
<body>
    <header class="main-header">
        <div class="container">
            <div class="navbar">
                <div class="logo-container">
                    <img src="<%=request.getContextPath()%>/resources/images/logo.png" alt="AEY Shopping Mart Logo">
                    <h3>AEY Shopping Mart</h3>
                </div>
                <div class="menu-container">
                    <nav>
                        <ul>
                            <li><a href="<%=request.getContextPath()%>/indexView">Home</a></li>
                            <li><a href="<%=request.getContextPath()%>/Product">Products</a></li>
                            <li><a href="<%=request.getContextPath()%>/aboutusView">About us</a></li>
                            <li><a href="<%=request.getContextPath()%>/ViewCart">Cart</a></li>
                            <li><a href="<%=request.getContextPath()%>/ViewOrders">Orders</a></li>
                            <c:choose>
                                <c:when test="${not empty sessionScope.user}">
                                    <!-- User is logged in -->
                                    <li><a href="<%=request.getContextPath()%>/profileView">UserProfile</a></li>
                                    <li><a href="<%=request.getContextPath()%>/userUpdate">UpdateProfile</a></li>
                                    <li><a href="<%=request.getContextPath()%>/Logout">Logout</a></li>
                                </c:when>
                                <c:otherwise>
                                    <!-- User is not logged in -->
                                    <li><a href="<%=request.getContextPath()%>/ViewLogin">Login</a></li>
                                    <li><a href="<%=request.getContextPath()%>/ViewRegister">Sign up</a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </header>
</body>
</html>
