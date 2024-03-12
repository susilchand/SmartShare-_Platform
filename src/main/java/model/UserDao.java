package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Database;

public class UserDao{

	public static boolean updateUserInformation(int userId, String updateUserName, 
			String updatePassword, String photoPath, String updateBio) {
		try {
            String sql = "UPDATE users SET username = ?, password_hash = ?, avatar_url=?,bio=? WHERE user_id = ?";
            try (Connection conn=Database.getConnection();
            		PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, updateUserName);
                pstmt.setString(2, updatePassword);
                pstmt.setString(3, photoPath);
                pstmt.setString(4, updateBio);
                pstmt.setInt(5, userId);

                int rowsUpdated = pstmt.executeUpdate();
                return rowsUpdated > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
	}
	
	public static List<User> searchByUserName(String userName) {
	    List<User> profiles = new ArrayList<>();

	    try {
	        Connection conn = Database.getConnection();
	        String sql = "SELECT * FROM users WHERE REPLACE(username, ' ', '') LIKE ?";
	        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            pstmt.setString(1, "%" + userName.replaceAll(" ", "") + "%");
	            ResultSet resultSet = pstmt.executeQuery();

	            while (resultSet.next()) {
	                int userId = resultSet.getInt("user_id");
	                String username = resultSet.getString("username");
	                String imgUrl = resultSet.getString("avatar_url");
	                String email = resultSet.getString("email");
	                
	                profiles.add(new User(userId, username, email, imgUrl));
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return profiles;
	}

	public static boolean forDeletingAllUser(int userId) {
	
		boolean success = false;
		try {
			Connection conn = Database.getConnection();
			String sql = "Delete from users where user_id=?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, userId);
                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    success = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

	
	
	public static List<User> selectingAllUser() {
	    List<User> profile = new ArrayList<User>();

	    try {
	        Connection conn = Database.getConnection();
	        String sql = "SELECT * FROM users";
	        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	          
	       
	            ResultSet resultSet = pstmt.executeQuery();

	            while (resultSet.next()) {
	         
	                int userId = resultSet.getInt("user_id");
	                String username = resultSet.getString("username");
	                String password=resultSet.getString("password_hash");
	                String imgUrl = resultSet.getString("avatar_url");
	                String email=resultSet.getString("email");
	                String bio=resultSet.getString("bio");
	               
	                profile.add(new User( userId, username,email,password, imgUrl,bio));
	            }
	           System.out.println();
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return profile;
	}
	
}
