package controller;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ProductDAO;
import model.Product;

@WebServlet(asyncSupported = true, urlPatterns = { "/Product" })
public class ViewProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public ViewProduct() {
        super();
        productDAO = new ProductDAO();
    }

    // Handles GET requests to display products
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch all products from the database using ProductDAO
        List<Product> products = productDAO.selectAllProducts();
        
        // Retrieve search and category query parameters from the request
        String searchQuery = request.getParameter("search");
        String categoryQuery = request.getParameter("category");

        // Filter products based on the search query if provided
        if (searchQuery != null && !searchQuery.isEmpty()) {
            products = products.stream()
                .filter(product -> product.getProductName().toLowerCase().contains(searchQuery.toLowerCase()))
                .collect(Collectors.toList());
        }
        
        // Filter products based on the category query if provided
        if (categoryQuery != null && !categoryQuery.isEmpty()) {
            products = products.stream()
                .filter(product -> product.getProductCategory().equalsIgnoreCase(categoryQuery))
                .collect(Collectors.toList());
        }

        // Set the filtered list of products as a request attribute and forward to the product page
        request.setAttribute("products", products);
        request.getRequestDispatcher(ViewPages.productPage).forward(request, response);
    }

    // Handles POST requests, which simply forwards the request to the doGet method
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
