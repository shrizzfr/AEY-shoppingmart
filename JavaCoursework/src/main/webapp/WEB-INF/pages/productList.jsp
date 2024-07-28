<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .product-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 40px;
        }
        .product-item {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 4px 4px 6px rgba(0, 0, 0, 0.1), -4px -4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 200px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-between;
            padding: 20px;
        }
        .product-item img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-bottom: 1px solid #ddd;
            margin-bottom: 10px;
        }
        .product-item h3 {
            margin: 0;
            font-size: 18px;
            color: #333;
        }
        .product-item p {
            margin: 5px 0;
            color: #777;
        }
        .product-item .price {
            font-size: 20px;
            font-weight: bold;
            color: #333;
        }
        .product-item button {
            color: #fff;
            background-color: #3588C5;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
        }
        .product-item button:hover {
            background-color: #49A1E1;
        }
    </style>
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
    </script>
</head>
<body>
    <%@ include file="navBar.jsp" %>
    
    <h1 style="margin-left:40px;">Product List</h1>
    
    <!-- Search Form -->
    <form method="get" action="Product" style="margin-left:40px;">
    <input type="text" name="search" placeholder="Search by product name" value="${param.search}" style="padding: 10px; width: 300px;">
    
    <select name="category" style="padding: 10px; width: 150px;">
        <option value="">All Categories</option>
        <option value="Monitor" ${param.category == 'Monitor' ? 'selected' : ''}>Monitor</option>
        <option value="Mouse" ${param.category == 'Mouse' ? 'selected' : ''}>Mouse</option>
        <option value="Headphone" ${param.category == 'Headphone' ? 'selected' : ''}>Headphone</option>
        <option value="Storage" ${param.category == 'Storage' ? 'selected' : ''}>Storage</option>
        <option value="Motherboard" ${param.category == 'Motherboard' ? 'selected' : ''}>Motherboard</option>
        <option value="GPU" ${param.category == 'GPU' ? 'selected' : ''}>GPU</option>
    </select>

    <button type="submit" style="padding: 10px; background-color: #3588C5; color: #fff; border: none; border-radius: 4px; cursor: pointer;">Search</button>
</form>
    
    <div class="product-container">
        <c:forEach var="product" items="${products}">
            <div class="product-item">
                <img src="<%= request.getContextPath() %>/resources/images/${product.productID}.jpg">
                <h3>${product.productName}</h3>
                <p>${product.productCategory}</p>
                <p class="price">${product.productPrice}</p>
                <button onclick="addToCart(${product.productID}, 1)">Add to Cart</button>
            </div>
        </c:forEach>
    </div>
    
    <%@ include file="footer.jsp" %>
</body>
</html>
