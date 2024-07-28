<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
body {
    display: flex;
    flex-direction: column;
    align-items: center;
    height: 100vh;
    margin: 0;
    font-family: Arial, sans-serif;
}

.navbar-container {
    width: 100%;
}

.company-name {
    text-align: center;
    margin: 20px 0;
    color: #000000;
}

.form-container {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: -250px;
    width: 100%;
    flex: 1;
}

form {
    background-color: #ffffff;
    padding: 2em;
    border-radius: 8px;
    box-shadow: 4px 4px 6px rgba(0, 0, 0, 0.1), -4px -4px 6px rgba(0, 0, 0, 0.1);
    max-width: 400px;
    width: 100%;
    text-align: center;
}

.form-group {
    margin-bottom: 1.5em;
}

.label {
    display: block;
    margin-bottom: 0.5em;
    font-weight: bold;
    color: #333;
}

.input-field {
    width: calc(100% - 2em);
    padding: 0.5em;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 1em;
    box-sizing: border-box;
}

.btn {
    background-color: #ff7e5f;
    color: #ffffff;
    border: none;
    padding: 0.75em 1.5em;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1em;
    transition: background-color 0.3s ease;
}

.btn:hover {
    background-color: #feb47b;
}

.register {
    color: #feb47b;
    text-decoration: none;
    margin-left: 0.5em;
}

.register:hover {
    text-decoration: underline;
}

.message {
    margin: 10px 0;
    color: #e74c3c;
}

.success {
    color: #2ecc71;
}
</style>
</head>
<body>
    <%@ include file="navBar.jsp" %>
    <div class="company-name">
        <h1>Login Portal</h1>
    </div>
    <div class="form-container">
        <form action="<%= request.getContextPath() %>/ViewLogin" method="post">
            <!-- Display success or error messages -->
            <c:if test="${not empty error}">
                <div class="message">${error}</div>
            </c:if>
            <c:if test="${not empty loginMessage}">
                <div class="message success">${loginMessage}</div>
            </c:if>
            
            <div class="form-group">
                <label for="email" class="label">Email</label>
                <input type="email" id="email" class="input-field" name="email" placeholder="Enter Your Email" required>
            </div>
            <div class="form-group">
                <label for="password" class="label">Password</label>
                <input type="password" id="password" class="input-field" name="password" placeholder="********" required>
            </div>
            <button type="submit" class="btn">Login</button>
            <p>Don't have an account? <a href="<%= request.getContextPath() %>/ViewRegister" class="register">Register</a></p>
        </form>
    </div>
</body>
</html>
