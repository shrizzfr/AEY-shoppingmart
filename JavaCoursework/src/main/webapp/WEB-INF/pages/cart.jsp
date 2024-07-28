<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            display: flex;
            flex-direction: column;
            height: 100%;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .cart-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            flex: 1; /* Ensures it takes up the available space */
        }
        .cart-item {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            overflow: hidden;
            margin-bottom: 20px;
            width: 80%;
            max-width: 800px;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .cart-item img {
            max-width: 150px;
            max-height: 150px;
            object-fit: cover;
            margin-right: 20px;
        }
        .cart-item-details {
            flex: 1;
        }
        .cart-item-details h2 {
            margin: 0;
            font-size: 18px;
            color: #333;
        }
        .cart-item-details p {
            margin: 5px 0;
            color: #777;
        }
        .cart-item-price {
            font-size: 20px;
            font-weight: bold;
            color: #333;
        }
        .total-price {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            text-align: right;
            margin-top: 20px;
        }
        .delete-button {
            background: #e74c3c;
            color: #fff;
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 5px;
        }
        .quantity-controls {
            display: flex;
            align-items: center;
        }
        .quantity-controls button {
            background: #ddd;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            margin: 0 5px;
        }
        .quantity-controls input {
            width: 40px;
            text-align: center;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 5px;
        }
        .checkout-button {
            background: #2ecc71;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            font-size: 18px;
            margin-top: 20px;
        }
        /* Add the sticky footer styles */
        html, body {
            height: 100%;
        }
        .main-content {
            flex: 1;
        }
        footer {
            margin-top: auto;
        }
    </style>
</head>
<body>
    <%@ include file="navBar.jsp" %>
    <div class="main-content">
        <h1>Your Cart</h1>
        <div class="cart-container">
            <c:forEach var="item" items="${cartItems}">
                <div class="cart-item">
                    <img src="resources/images/${item.productID}.jpg" alt="${item.productName}">
                    <div class="cart-item-details">
                        <h2>${item.productName}</h2>
                        <p>Category: ${item.productCategory}</p>
                        <div class="quantity-controls">
                            <form action="UpdateCartQuantity" method="post" style="display: flex; align-items: center;">
                                <input type="hidden" name="productID" value="${item.productID}" />
                                <input type="hidden" name="quantity" id="quantity-${item.productID}-hidden" value="${item.quantity}" />
                                <button type="button" class="quantity-btn" onclick="updateQuantity('${item.productID}', -1)">-</button>
                                <input type="text" id="quantity-${item.productID}" value="${item.quantity}" readonly />
                                <button type="button" class="quantity-btn" onclick="updateQuantity('${item.productID}', 1)">+</button>
                                <button type="submit" class="delete-button">Update</button>
                            </form>
                        </div>
                    </div>
                    <div class="cart-item-price">
                        $${item.productPrice * item.quantity}
                    </div>
                    <form action="RemoveFromCart" method="post">
                        <input type="hidden" name="productID" value="${item.productID}" />
                        <button type="submit" class="delete-button">Remove</button>
                    </form>
                </div>
            </c:forEach>
            <c:if test="${not empty cartItems}">
                <div class="total-price">
                    Total: $<c:out value="${totalPrice}"/>
                </div>
                <form action="Checkout" method="post">
                    <button type="submit" class="checkout-button">Checkout</button>
                </form>
            </c:if>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
    <script>
        function updateQuantity(productID, change) {
            var quantityInput = document.getElementById('quantity-' + productID);
            var hiddenQuantityInput = document.getElementById('quantity-' + productID + '-hidden');
            var currentQuantity = parseInt(quantityInput.value, 10);
            var newQuantity = Math.max(currentQuantity + change, 1); // Ensure quantity doesn't go below 1
            quantityInput.value = newQuantity;
            hiddenQuantityInput.value = newQuantity; // Update the hidden field
        }
    </script>
</body>
</html>
