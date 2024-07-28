package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CartDAO;

@WebServlet("/RemoveFromCart")
public class RemoveFromCart extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the productID from the request
        String productID = request.getParameter("productID");

        // Remove the product from the global cart
        CartDAO cartDAO = new CartDAO();
        cartDAO.removeProductFromCart(Integer.parseInt(productID));

        // Redirect back to the ViewCart servlet
        response.sendRedirect("ViewCart");
    }
}
