<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    .company-name {
        text-align: center;
        margin: 20px 0;
        color: #000000;
    }

    .form-container {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
        background: #fff;
        border-radius: 8px;
        box-shadow: 4px 4px 6px rgba(0, 0, 0, 0.1), -4px -4px 6px rgba(0, 0, 0, 0.1);
        margin-top: 20px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    .form-group input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box; /* Ensures padding and border are included in total width */
    }

    .btn {
        background-color: #5cb85c;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        display: block;
        margin: 20px auto; /* Centers the button and adds gap */
    }

    .btn:hover {
        background-color: #4cae4c;
    }

    .form-group a {
        color: #007bff;
        text-decoration: none;
        display: block;
        text-align: center;
        margin-top: 10px; /* Adds gap between the button and the link */
    }

    .form-group a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
<%@ include file="navBar.jsp" %> 

<div class="company-name">
    <h1>Update Profile</h1>
</div>

<div class="form-container">
    <form action="<%=request.getContextPath()%>/userUpdate" method="post">
        <div class="form-group">
            <label for="firstName">First Name</label>
            <input type="text" id="firstName" name="firstName" value="${user.firstName}" required>
        </div>
        <div class="form-group">
            <label for="lastName">Last Name</label>
            <input type="text" id="lastName" name="lastName" value="${user.lastName}" required>
        </div>
        <div class="form-group">
            <label for="phoneNumber">Phone Number</label>
            <input type="text" id="phoneNumber" name="phoneNumber" value="${user.phoneNumber}" required>
        </div>
        <div class="form-group">
            <label for="emailAddress" style="color:#C7C7CA;">Email Address</label>
            <input type="email" id="emailAddress" name="emailAddress" value="${user.emailAddress}" readonly>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="********" required>
        </div>
        <button type="submit" class="btn">Update</button>
    </form>
</div>

<% 
String errorMessage = (String) request.getAttribute("error");
if (errorMessage != null) { 
%>
    <script type="text/javascript">
        alert("<%= errorMessage %>");
    </script>
<% 
} 
%>

</body>
</html>
