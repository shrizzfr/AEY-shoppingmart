package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CartItem;
import utils.DatabaseConnectivity;

public class CartDAO {

    public void addOrUpdateProductInCart(int productID, int quantity) {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = DatabaseConnectivity.openConnection();
            String query = "INSERT INTO cart_items (cartID, productID, quantity) VALUES (1,?, ?) "
                           + "ON DUPLICATE KEY UPDATE quantity = quantity + ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, productID);
            statement.setInt(2, quantity);
            statement.setInt(3, quantity); // Update the quantity if the item already exists
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions properly
        } finally {
            DatabaseConnectivity.closeConnection(connection);
        }
    }

    public List<CartItem> getCartItems() {
        List<CartItem> cartItems = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DatabaseConnectivity.openConnection();
            String query = "SELECT ci.productID, ci.quantity, p.productName, p.productPrice, p.productCategory "
                           + "FROM cart_items ci JOIN product p ON ci.productID = p.productID";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                CartItem item = new CartItem();
                item.setProductID(resultSet.getInt("productID"));
                item.setQuantity(resultSet.getInt("quantity"));
                item.setProductName(resultSet.getString("productName"));
                item.setProductPrice(resultSet.getDouble("productPrice"));
                item.setProductCategory(resultSet.getString("productCategory"));
                cartItems.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions properly
        } finally {
            DatabaseConnectivity.closeConnection(connection);
        }
        return cartItems;
    }

    public void removeProductFromCart(int productID) {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = DatabaseConnectivity.openConnection();
            String query = "DELETE FROM cart_items WHERE productID = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, productID);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions properly
        } finally {
            DatabaseConnectivity.closeConnection(connection);
        }
    }

    public double calculateTotalPrice() {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        double totalPrice = 0.0;
        try {
            connection = DatabaseConnectivity.openConnection();
            String query = "SELECT ci.quantity, p.productPrice FROM cart_items ci JOIN product p ON ci.productID = p.productID";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int quantity = resultSet.getInt("quantity");
                double price = resultSet.getDouble("productPrice");
                totalPrice += quantity * price;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions properly
        } finally {
            DatabaseConnectivity.closeConnection(connection);
        }
        return totalPrice;
    }
    public void updateProductQuantityInCart(int productID, int quantity) {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = DatabaseConnectivity.openConnection();
            String query = "UPDATE cart_items SET quantity = ? WHERE productID = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, quantity);
            statement.setInt(2, productID);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions properly
        } finally {
            DatabaseConnectivity.closeConnection(connection);
        }
    }
    public void clearCart() {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DatabaseConnectivity.openConnection();
            String query = "DELETE FROM cart_items"; // Clears all items from the cart
            statement = connection.prepareStatement(query);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions properly
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            DatabaseConnectivity.closeConnection(connection);
        }
    }


}
