package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Product;
import utils.DatabaseConnectivity;

import javax.servlet.RequestDispatcher;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String category = request.getParameter("category");
        
        List<Product> products = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseConnectivity.openConnection();
            String sql = "SELECT * FROM product";
            if (category != null && !category.equals("All")) {
                sql += " WHERE productCategory = ?";
            }

            statement = connection.prepareStatement(sql);
            if (category != null && !category.equals("All")) {
                statement.setString(1, category);
            }

            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Product product = new Product();
                product.setProductID(resultSet.getInt("productID"));
                product.setProductName(resultSet.getString("productName"));
                product.setProductCategory(resultSet.getString("productCategory"));
                product.setProductPrice(resultSet.getInt("productPrice"));
                products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DatabaseConnectivity.closeConnection(connection);
        }

        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher(ViewPages.indexPage);
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
