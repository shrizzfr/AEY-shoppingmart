package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.UserDAO;
import model.User;
import utils.PasswordHash;

@WebServlet("/ViewRegister")
public class ViewRegister extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(ViewPages.registerPage).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phoneNumber = request.getParameter("phoneNumber");
        String emailAddress = request.getParameter("emailAddress");
        String password = request.getParameter("password");
        String retypepassword = request.getParameter("retypePassword");

        // Check if passwords match
        if (!password.equals(retypepassword)) {
            request.setAttribute("error", "Passwords do not match");
            request.getRequestDispatcher(ViewPages.registerPage).forward(request, response);
            return; // Exit the method to prevent further processing
        }

        UserDAO userDAO = new UserDAO();
        // Check if email is already registered
        if (userDAO.getUserByEmail(emailAddress) == null) {
            String hashedPassword = PasswordHash.getPasswordHash(password);
            User newUser = new User();
            newUser.setFirstName(firstName);
            newUser.setLastName(lastName);
            newUser.setPhoneNumber(phoneNumber);
            newUser.setEmailAddress(emailAddress);
            newUser.setPassword(hashedPassword);

            userDAO.addUser(newUser);
            response.sendRedirect("ViewLogin");
        } else {
            request.setAttribute("error", "Email already registered");
            request.getRequestDispatcher(ViewPages.registerPage).forward(request, response);
        }
    }
}
