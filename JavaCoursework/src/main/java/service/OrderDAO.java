package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DatabaseConnectivity;
import model.Order;

public class OrderDAO {
    private Connection connection;

    public OrderDAO() {
        connection = DatabaseConnectivity.openConnection();
    }

    public void createOrder() {
        String insertOrderQuery = "INSERT INTO orders (orderDate) VALUES (CURRENT_TIMESTAMP)"; // Insert with default values
        String insertOrderItemsQuery = "INSERT INTO order_items (orderID, productID, quantity, price) "
                                     + "SELECT ?, c.productID, c.quantity, p.productPrice "
                                     + "FROM cart_items c "
                                     + "JOIN product p ON c.productID = p.productID"; // Use productPrice instead of price

        try {
            // Start transaction
            connection.setAutoCommit(false);

            // Insert into orders table
            try (PreparedStatement preparedStatement = connection.prepareStatement(insertOrderQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {
                preparedStatement.executeUpdate();

                // Get the generated orderID
                ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int orderID = generatedKeys.getInt(1);

                    // Insert into order_items table
                    try (PreparedStatement orderItemsStatement = connection.prepareStatement(insertOrderItemsQuery)) {
                        orderItemsStatement.setInt(1, orderID); // Set the orderID in the query
                        orderItemsStatement.executeUpdate();
                    }

                    // Commit transaction
                    connection.commit();
                } else {
                    throw new SQLException("Failed to create order, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                // Rollback in case of error
                connection.rollback();
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException autoCommitEx) {
                autoCommitEx.printStackTrace();
            }
        }
    }

    public List<Order> getAllOrders() {
        String query = "SELECT o.orderID, o.orderDate, i.productID, i.quantity, i.price, p.productName, p.productCategory "
                     + "FROM orders o "
                     + "JOIN order_items i ON o.orderID = i.orderID "
                     + "JOIN product p ON i.productID = p.productID";
        List<Order> orders = new ArrayList<>();

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Order order = new Order();
                order.setOrderID(resultSet.getInt("orderID"));
                order.setOrderDate(resultSet.getTimestamp("orderDate"));
                order.setProductID(resultSet.getInt("productID"));
                order.setQuantity(resultSet.getInt("quantity"));
                order.setPrice(resultSet.getBigDecimal("price"));
                order.setProductName(resultSet.getString("productName"));
                order.setProductCategory(resultSet.getString("productCategory"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }
}
