<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }

    .company-name {
        text-align: center;
        margin: 20px 0;
        color: #000000;
    }

    .profile-container {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
        background: #fff;
        border-radius: 8px;
        box-shadow: 4px 4px 6px rgba(0, 0, 0, 0.1), -4px -4px 6px rgba(0, 0, 0, 0.1);
        margin-top: 20px;
    }

    .profile-group {
        margin-bottom: 15px;
    }

    .profile-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    .profile-group p {
        margin: 0;
        padding: 10px;
        background: #f4f4f4;
        border: 1px solid #ddd;
        border-radius: 4px;
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
        margin: 20px auto;
        text-align: center;
        text-decoration: none;
    }

    .btn:hover {
        background-color: #4cae4c;
    }
</style>
</head>
<body>
<%@ include file="navBar.jsp" %>

<div class="profile-container">
    <h1>User Profile</h1>
    <div class="profile-details">
        <p><strong>First Name:</strong> <c:out value="${user.firstName}" /></p>
        <p><strong>Last Name:</strong> <c:out value="${user.lastName}" /></p>
        <p><strong>Phone Number:</strong> <c:out value="${user.phoneNumber}" /></p>
        <p><strong>Email Address:</strong> <c:out value="${user.emailAddress}" /></p>
        <!-- Optionally include an update profile link -->
        <a href="<%=request.getContextPath()%>/userUpdate" class="btn">Update Profile</a>
    </div>
</div>
</body>
</html>
