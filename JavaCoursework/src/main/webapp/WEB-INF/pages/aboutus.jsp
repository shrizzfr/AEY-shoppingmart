<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Information</title>
<style>
body {
    padding: 0;
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
}

.box {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 20px;
}

.info-card {
    display: flex;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    width: 80%;
    max-width: 600px;
    margin-bottom: 20px;
    overflow: hidden;
    padding: 20px;
}

.info-card img {
    width: 100px;
    height: 100px;
    object-fit: cover;
    border-radius: 50%;
    margin-right: 20px;
}

.info-card .info {
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.info-card .info h3 {
    margin: 0;
    font-size: 18px;
    color: #333;
}

.info-card .info p {
    margin: 5px 0;
    color: #777;
}
</style>
</head>
<body>
    <%@include file="navBar.jsp" %>
    <h1 style="text-align:center;">About Us Page</h1>
    <div class="box">
        <div class="info-card">
            <img src="<%=request.getContextPath()%>/resources/images/user1.jpg" alt="Sample Image">
            <div class="info">
                <h3>Shrijal Dangol</h3>
                <p>Address: Thamel, Kathmandu</p>
                <p>Phone: 9861485986</p>
                <p>Email: dagolshreejal@gmail.com</p>
            </div>
        </div>
        <div class="info-card">
            <img src="<%=request.getContextPath()%>/resources/images/user2.jpg" alt="Sample Image">
            <div class="info">
                <h3>Shubham Tandukar</h3>
                <p>Address: Sanepa, Lalitpur</p>
                <p>Phone: 9840527620</p>
                <p>Email: shubhamtandukar@gmail.com</p>
            </div>
        </div>
        <div class="info-card">
            <img src="<%=request.getContextPath()%>/resources/images/user3.jpg" alt="Sample Image">
            <div class="info">
                <h3>Shreya Kalika</h3>
                <p>Address: Pepsicola, Bhaktapur</p>
                <p>Phone: 9812457829</p>
                <p>Email: shreyakalika@gmail.com</p>
            </div>
        </div>
        <div class="info-card">
            <img src="<%=request.getContextPath()%>/resources/images/user4.jpg" alt="Sample Image">
            <div class="info">
                <h3>Sadichchha Mahaju</h3>
                <p>Address: Swoyambhu, Kathmandu</p>
                <p>Phone: 9856734672</p>
                <p>Email: sadichchhaamahaju@gmail.com</p>
            </div>
        </div>
    </div>
</body>
</html>
