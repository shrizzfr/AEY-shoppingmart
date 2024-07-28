package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.UserDAO;
import model.User;
import utils.PasswordHash;

@WebServlet("/ViewLogin")
public class ViewLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(ViewPages.loginPage).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByEmail(email);

        if (user != null && PasswordHash.verifyPassword(password, user.getPassword())) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);  // Store User object

            // Also store userID separately if needed
            session.setAttribute("userID", user.getUserID());

            // Set a successful login message
            request.setAttribute("loginMessage", "Login successful!");

            response.sendRedirect("indexView");
        } else {
            // Set an error message for failed login
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher(ViewPages.loginPage).forward(request, response);
        }
    }
}
