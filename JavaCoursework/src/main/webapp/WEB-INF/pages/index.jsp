<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Java</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styleIndex.css">
</head>
<body>
    <%@ include file="navBar.jsp" %>

    <section class="hero-banner-wrapper">
        <div class="container">
            <div class="hero-main-wrapper">
                <div class="category-sidebar-wrapper">
                    <div class="list-items">
                        <form action="<%= request.getContextPath() %>/ProductServlet" method="get" id="categoryForm">
                            <ul id="category-list">
                                <li><button type="submit" name="category" value="All">All</button></li>
                                <li><button type="submit" name="category" value="Processor">Processor</button></li>
                                <li><button type="submit" name="category" value="GPU">Graphic Card</button></li>
                                <li><button type="submit" name="category" value="Monitor">Monitor</button></li>
                                <li><button type="submit" name="category" value="Storage">Storage</button></li>
                                <li><button type="submit" name="category" value="Mouse">Mouse</button></li>
                                <li><button type="submit" name="category" value="Headphone">Headphone</button></li>
                                <li><button type="submit" name="category" value="Motherboard">Motherboard</button></li>
                            </ul>
                        </form>
                    </div>
                </div>
                <div class="hero">
                    <img name="slide" class="slide-image" alt="Slideshow">
                </div>
            </div>
        </div>
    </section>

    <section class="top-selling-list-wrapper">
        <div class="container">
            <div class="section-header">
                <h1 style="margin-left:20px;">Shop Here</h1>
            </div>
            <div class="product-container" id="product-container">
                <c:forEach var="product" items="${products}" varStatus="status">
                    <div class="product-item" data-category="${product.productCategory}">
                        <img src="<%= request.getContextPath() %>/resources/images/${product.productID}.jpg" alt="${product.productName}">
                        <h3>${product.productName}</h3>
                        <p class="category">${product.productCategory}</p>
                        <p class="price">${product.productPrice}</p>
                        <button onclick="addToCart(${product.productID}, 1)">Add to Cart</button>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <section class="shipping-highight">
        <div class="container">
            <div class="shipping-icon-block">
                <div class="shipping-item">
                    <div class="icon-wrap">
                        <img src="<%= request.getContextPath() %>/resources/images/free-delivery.png" alt="Free Shipping">
                    </div>
                    <div class="icon-content">
                        <h4>Free Shipping</h4>
                        <p>Free shipping on more than 5 Products order</p>
                    </div>
                </div>
                <div class="shipping-item">
                    <div class="icon-wrap">
                        <img src="<%= request.getContextPath() %>/resources/images/earth.png" alt="Growth Advice">
                    </div>
                    <div class="icon-content">
                        <h4>Growth Advice</h4>
                        <p>We give free business advice to our customers</p>
                    </div>
                </div>
                <div class="shipping-item">
                    <div class="icon-wrap">
                        <img src="<%= request.getContextPath() %>/resources/images/money.png" alt="Secure Payment">
                    </div>
                    <div class="icon-content">
                        <h4>Secure Payment</h4>
                        <p>Our payment process is fast, reliable and secured.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@ include file="footer.jsp" %>

    <script>
        function addToCart(productID, quantity) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "AddToCart", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onload = function () {
                if (xhr.status >= 200 && xhr.status < 300) {
                    var response = JSON.parse(xhr.responseText);
                    if (response.loginRequired) {
                        alert(response.message);
                        window.location.href = "ViewLogin";
                    } else {
                        alert(response.message);
                    }
                } else {
                    alert("Failed to add item to cart.");
                }
            };
            xhr.send("productID=" + encodeURIComponent(productID) + "&quantity=" + encodeURIComponent(quantity));
        }    

        // Internal JavaScript for customer slideshow
        var i = 0;
        var images = [];
        var time = 1500;

        images[0] = '<%=request.getContextPath() %>/resources/images/1.png';
        images[1] = '<%=request.getContextPath() %>/resources/images/2.png';
        images[2] = '<%=request.getContextPath() %>/resources/images/3.png';
        images[3] = '<%=request.getContextPath() %>/resources/images/4.png';

        function changeImg() {
            document.getElementsByName('slide')[0].src = images[i];
            i = (i + 1) % images.length;
            setTimeout(changeImg, time);
        }

        window.onload = changeImg;
    </script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>
