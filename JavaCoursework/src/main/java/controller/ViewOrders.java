package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.OrderDAO;

@WebServlet("/ViewOrders")
public class ViewOrders extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
        Integer userID = (Integer) session.getAttribute("userID");

        if (userID == null) {
            response.sendRedirect("ViewLogin"); 
            // Redirect to login page if needed
            return;
        }
    	
    	// No need to check userID now
        OrderDAO orderDAO = new OrderDAO();
        // Retrieve all orders
        var orders = orderDAO.getAllOrders();
        request.setAttribute("orders", orders);

        request.getRequestDispatcher(ViewPages.orderPage).forward(request, response);
    }
}
