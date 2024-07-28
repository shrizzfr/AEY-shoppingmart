package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import service.UserDAO;

@WebServlet("/profileView")
public class ViewProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
        Integer userID = (Integer) session.getAttribute("userID");

        if (userID == null) {
            response.sendRedirect("ViewLogin"); 
            // Redirect to login page if needed
            return;
        }
    	
        String email = (String) request.getSession().getAttribute("userEmail");
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByEmail(email);
        request.setAttribute("user", user);
        request.getRequestDispatcher(ViewPages.userprofilePage).forward(request, response);
    }
}
