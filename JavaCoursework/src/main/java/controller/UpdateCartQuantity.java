package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CartDAO;

@WebServlet("/UpdateCartQuantity")
public class UpdateCartQuantity extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the productID and quantity from the request
        String productID = request.getParameter("productID");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Update the product quantity in the cart
        CartDAO cartDAO = new CartDAO();
        cartDAO.updateProductQuantityInCart(Integer.parseInt(productID), quantity);

        // Redirect back to the ViewCart servlet
        response.sendRedirect("ViewCart");
    }
}
