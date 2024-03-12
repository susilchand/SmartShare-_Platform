package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Database;
import controller.FavoriteServlet;

public class FavoriteDAO {
   Connection connection=Database.getConnection();

    // Method to check if the post is favorited by the user
    public boolean checkIfPostIsFavorited(int userId, int postId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM favorites WHERE user_id = ? AND post_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            statement.setInt(2, postId);
            try (var resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        }
        return false;
    }

    // Method to add a favorite entry for the user and post
    public void addFavorite(int userId, int postId) throws SQLException {
        String sql = "INSERT INTO favorites (user_id, post_id) VALUES (?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            statement.setInt(2, postId);
            statement.executeUpdate();
        }
    }

    // Method to remove a favorite entry for the user and post
    public void removeFavorite(int userId, int postId) throws SQLException {
        String sql = "DELETE FROM favorites WHERE user_id = ? AND post_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            statement.setInt(2, postId);
            statement.executeUpdate();
        }
    }
}
