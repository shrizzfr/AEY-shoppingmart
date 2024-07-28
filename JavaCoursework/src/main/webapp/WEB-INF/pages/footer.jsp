<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
@charset "UTF-8";

/**shipping section styles**/
.shipping-highight{
    background-color: #f5f5f5;
}
.shipping-icon-block{
    display: flex;
}
.shipping-item{
    width: 33.33%;
    display: flex;
    padding: 0 20px;
}
.icon-wrap img{
    width: 60px;
    height: 60px;
}
.icon-content{
    padding-left: 20px;
}
.icon-content h4{
    margin-top: 0;
    margin-bottom: 5px;
    font-weight: 600;
}
.icon-content p{
    font-size: 14px;
    margin-top: 10px;
    margin-bottom: 0;
}
/**footer styles**/
.footer{
    padding: 25px 0 10px;
    /*margin-top: 35%;*/
    background-color: #ffffff;
}
.footer-info{
    display: flex;
}
.footer-item{
    width: 25%;
    padding: 0 20px;
}
.footer-item h4{
    margin-top: 0;
    margin-bottom: 10px;
    font-weight: 600;
}
.footer-info li{
    list-style: none;
}
.footer-info a{
    padding: 12px 0;
    text-decoration: none;
    color: #1a1a1a;
    font-size: 14px;
}
.footer-info a:hover{
    text-decoration: none;
    color: #2a85b0;
}
.footer-info h3{
    text-transform: uppercase;
    font-size: 18px;
    padding: 10px;
}
.footer-info img{
    height: 170px;
    width: 170px;
}
.footer-info ul{
    padding: 0;
    margin: 0;
}

</style>
<body>
	<footer class="footer">
            <div class="container">
                <div class="footer-info">
                    <div class="footer-item">
                        <img src="resources/images/logo.png">
                    </div>
                    <div class="footer-item">
                        <h4>CONTACTS</h4>
                        <ul class="contact">
                            <li><a>New Baneshwor-10</a></li>
                            <li><a>+977-9804443434</a></li>
                        </ul>
                    </div>
                    <div class="footer-item">
                        <h4>COMPANY</h4>
                        <ul class="company">
                            <li><a href="<%=request.getContextPath()%>/aboutusView">About us</a></li>
                            <li> <a href="#">Privacy & Policy</a></li>
                        </ul>
                    </div>
                    <div class="footer-item">
                        <h4>RESOURCES</h4>
                        <ul class="resources">
                            <li> <a href="#">Research</a> </li>
                        </ul>
                    </div>
                    <div class="footer-item">
                        <h4>SOCIALS</h4>
                        <ul class="socials">
                            <li><a href="#">Facebook</a></li>
                            <li><a href="#">Instagram</a></li>
                            <li><a href="#"> twitter</a></li>
                            <li><a href="#">LinkedIN</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
</body>
</html>