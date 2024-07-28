package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;
import utils.DatabaseConnectivity;

public class UserDAO {

    public User getUserByEmail(String email) {
        User user = null;
        Connection connection = DatabaseConnectivity.openConnection();
        try {
            String sql = "SELECT * FROM users WHERE emailAddress = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user = new User();
                user.setFirstName(resultSet.getString("firstName"));
                user.setLastName(resultSet.getString("lastName"));
                user.setPhoneNumber(resultSet.getString("phoneNumber"));
                user.setEmailAddress(resultSet.getString("emailAddress"));
                user.setPassword(resultSet.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConnectivity.closeConnection(connection);
        }
        return user;
    }

    // Method to update user details by email
    public void updateUser(User user) {
        Connection connection = DatabaseConnectivity.openConnection();
        try {
            String sql = "UPDATE users SET firstName = ?, lastName = ?, phoneNumber = ?, emailAddress = ?, password = ? WHERE emailAddress = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setString(3, user.getPhoneNumber());
            preparedStatement.setString(4, user.getEmailAddress());
            preparedStatement.setString(5, user.getPassword());
            preparedStatement.setString(6, user.getEmailAddress()); // Use email to update the correct record
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConnectivity.closeConnection(connection);
        }
    }

    // Existing method to add a user
    public void addUser(User user) {
        Connection connection = DatabaseConnectivity.openConnection();
        try {
            String sql = "INSERT INTO users (firstName, lastName, phoneNumber, emailAddress, password) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setString(3, user.getPhoneNumber());
            preparedStatement.setString(4, user.getEmailAddress());
            preparedStatement.setString(5, user.getPassword());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConnectivity.closeConnection(connection);
        }
    }
}