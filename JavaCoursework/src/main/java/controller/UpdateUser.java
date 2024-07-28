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
import utils.PasswordHash;

@WebServlet("/userUpdate")
public class UpdateUser extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
        Integer userID = (Integer) session.getAttribute("userID");

        if (userID == null) {
            response.sendRedirect("ViewLogin"); 
            // Redirect to login page if needed
            return;
        }
    	
    	// Assuming user email is stored in session
        String email = (String) request.getSession().getAttribute("userEmail");
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByEmail(email);
        request.setAttribute("user", user);
        request.getRequestDispatcher(ViewPages.userUpdatePage).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phoneNumber = request.getParameter("phoneNumber");
        String emailAddress = request.getParameter("emailAddress");
        String password = request.getParameter("password");
        String hashedPassword = PasswordHash.getPasswordHash(password);
        
        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setPhoneNumber(phoneNumber);
        user.setEmailAddress(emailAddress);
        user.setPassword(hashedPassword);
        
        UserDAO userDAO = new UserDAO();
        userDAO.updateUser(user);
        
        response.sendRedirect(request.getContextPath() + "/indexView");
    }
}
