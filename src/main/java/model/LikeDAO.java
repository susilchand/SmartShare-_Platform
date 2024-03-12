package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LikeDAO {
	
	// Method to check if the post is liked by the user
	public boolean checkIfPostIsLiked(int userId, int postId) throws SQLException {
		Connection conn = Database.getConnection();
	    String sql = "SELECT COUNT(*) FROM likes WHERE user_id = ? AND post_id = ?";
	    try (PreparedStatement statement = conn.prepareStatement(sql)) {
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

	
	public  void likePost(int userId, int postId) {
		try {
			Connection conn = Database.getConnection();
			String sql = "INSERT INTO likes (user_id, post_id) VALUES (?, ?)";
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setInt(1, userId);
				pstmt.setInt(2, postId);
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	    // Method to dislike a post
	    public  void dislikePost(int userId, int postId) {
	        try {
	            Connection conn = Database.getConnection();
	            String sql = "DELETE FROM likes WHERE user_id = ? AND post_id = ?";
	            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	                pstmt.setInt(1, userId);
	                pstmt.setInt(2, postId);
	                pstmt.executeUpdate();
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}
