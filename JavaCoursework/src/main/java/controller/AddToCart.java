package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CartDAO;

@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userID = (Integer) session.getAttribute("userID");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (userID == null) {
            // Send response indicating that the user needs to log in
            response.getWriter().write("{\"message\":\"You need to log in to add items to the cart.\", \"loginRequired\": true}");
            return;
        }

        // Retrieve the productID from the request
        String productID = request.getParameter("productID");
        String quantityStr = request.getParameter("quantity");

        // Default quantity to 1 if not specified
        int quantity = (quantityStr != null && !quantityStr.isEmpty()) ? Integer.parseInt(quantityStr) : 1;

        // Add or update the product in the global cart
        CartDAO cartDAO = new CartDAO();
        cartDAO.addOrUpdateProductInCart(Integer.parseInt(productID), quantity);

        // Send response indicating success
        response.getWriter().write("{\"message\":\"Item added to cart successfully!\", \"loginRequired\": false}");
    }
}
