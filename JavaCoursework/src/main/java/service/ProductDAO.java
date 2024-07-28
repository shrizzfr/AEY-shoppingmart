package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import utils.DatabaseConnectivity;

public class ProductDAO {

    public Product getProductById(int productID) {
        Product product = null;
        Connection connection = DatabaseConnectivity.openConnection();
        try {
            String sql = "SELECT * FROM product WHERE productID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, productID);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                product = new Product();
                product.setProductID(resultSet.getInt("productID"));
                product.setProductName(resultSet.getString("productName"));
                product.setProductPrice(resultSet.getInt("productPrice"));
                product.setProductCategory(resultSet.getString("productCategory"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConnectivity.closeConnection(connection);
        }
        return product;
    }

    public List<Product> selectAllProducts() {
        List<Product> products = new ArrayList<>();
        Connection connection = DatabaseConnectivity.openConnection();
        try {
            String sql = "SELECT * FROM product";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setProductID(resultSet.getInt("productID"));
                product.setProductName(resultSet.getString("productName"));
                product.setProductPrice(resultSet.getInt("productPrice"));
                product.setProductCategory(resultSet.getString("productCategory"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConnectivity.closeConnection(connection);
        }
        return products;
    }
    
    public List<Product> selectProducts(String searchQuery, String categoryQuery) {
        List<Product> products = new ArrayList<>();
        Connection connection = DatabaseConnectivity.openConnection();
        try {
            StringBuilder sql = new StringBuilder("SELECT * FROM product WHERE 1=1");
            
            if (searchQuery != null && !searchQuery.isEmpty()) {
                sql.append(" AND productName LIKE ?");
            }
            
            if (categoryQuery != null && !categoryQuery.isEmpty()) {
                sql.append(" AND productCategory = ?");
            }
            
            PreparedStatement preparedStatement = connection.prepareStatement(sql.toString());
            
            int paramIndex = 1;
            if (searchQuery != null && !searchQuery.isEmpty()) {
                preparedStatement.setString(paramIndex++, "%" + searchQuery + "%");
            }
            
            if (categoryQuery != null && !categoryQuery.isEmpty()) {
                preparedStatement.setString(paramIndex++, categoryQuery);
            }
            
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setProductID(resultSet.getInt("productID"));
                product.setProductName(resultSet.getString("productName"));
                product.setProductPrice(resultSet.getInt("productPrice"));
                product.setProductCategory(resultSet.getString("productCategory"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConnectivity.closeConnection(connection);
        }
        return products;
    }
}
