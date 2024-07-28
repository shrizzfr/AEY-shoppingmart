package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DatabaseConnectivity;

public class CartItemDAO {

    public void addOrUpdateCartItem(int userId, int productId, int quantity) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DatabaseConnectivity.openConnection();

            // Check if the item already exists in the cart
            String selectSQL = "SELECT * FROM cart_items WHERE userID = ? AND productID = ?";
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, productId);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // Item already in cart, update quantity
                String updateSQL = "UPDATE cart_items SET quantity = ? WHERE userID = ? AND productID = ?";
                preparedStatement = connection.prepareStatement(updateSQL);
                preparedStatement.setInt(1, quantity);
                preparedStatement.setInt(2, userId);
                preparedStatement.setInt(3, productId);
                preparedStatement.executeUpdate();
            } else {
                // Item not in cart, insert new entry
                String insertSQL = "INSERT INTO cart_items (userID, productID, quantity) VALUES (?, ?, ?)";
                preparedStatement = connection.prepareStatement(insertSQL);
                preparedStatement.setInt(1, userId);
                preparedStatement.setInt(2, productId);
                preparedStatement.setInt(3, quantity);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConnectivity.closeConnection(connection);
        }
    }
}
