package model;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Timestamp;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import java.time.*;

import org.apache.jasper.tagplugins.jstl.core.Out;

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Database;

public class PostDao {

	public static List<Post> getStories() {
		List<Post> posts = new ArrayList<>();

		try {
			Connection conn = Database.getConnection();

			String sql = "SELECT DISTINCT post_id, title, user_id, content, category, created_at\r\n" + "FROM posts\r\n"
					+ "WHERE visibility = 'public'";
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
				ResultSet resultSet = pstmt.executeQuery();

				while (resultSet.next()) {

					int postId = resultSet.getInt("post_id");
					String title = resultSet.getString("title");
					String content = resultSet.getString("content");
					String category = resultSet.getString("category");
					String postImgUrl = resultSet.getString("postImgUrl");
					posts.add(new Post(postId, title, content, category, postImgUrl));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return posts;
	}

	public static Post getStoryById(int postId) {
		Post post = null;

		try {
			Connection conn = Database.getConnection();

			String sql = "SELECT post_id, title, content, category, storyImgUrl, visibility \r\n" + "FROM posts \r\n"
					+ "WHERE post_id = ?";
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setInt(1, postId);
				ResultSet resultSet = pstmt.executeQuery();

				if (resultSet.next()) {
					int postId1 = resultSet.getInt("post_id");
					String title = resultSet.getString("title");
					String content = resultSet.getString("content");
					String category = resultSet.getString("category");
					String postImgUrl = resultSet.getString("storyImgUrl");
					String visibility = resultSet.getString("visibility");

					post = new Post(postId1, title, content, category, visibility, postImgUrl);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return post;
	}

	public static boolean createStory(Post post) {

		try {

			try (Connection conn = Database.getConnection()) {

				String sql = "INSERT INTO posts (user_id, title, content, category, visibility,storyImgUrl) VALUES (?, ?, ?, ?, ?,?)";

				try (PreparedStatement pstmt = conn.prepareStatement(sql)) {

					pstmt.setInt(1, post.getUserId());
					pstmt.setString(2, post.getTitle());
					pstmt.setString(3, post.getContent());
					pstmt.setString(4, post.getCategory());
					pstmt.setString(5, post.getVisibility());
					pstmt.setString(6, post.getPostImgUrl());
					int affectedRows = pstmt.executeUpdate();

					return affectedRows > 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static List<Post> getStoriesByUserIds(int userId) {
		List<Post> posts = new ArrayList<>();

		try {

			Connection conn = Database.getConnection();

			String sql = "SELECT \r\n" + "    posts.*,\r\n" + "    users.*\r\n" + "FROM \r\n" + "    posts\r\n"
					+ "JOIN \r\n" + "    users ON posts.user_id = users.user_id\r\n" + "WHERE\r\n"
					+ "    users.user_id=? ORDER BY\r\n"
					+ "    posts.created_at DESC";
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setInt(1, userId);
				ResultSet resultSet = pstmt.executeQuery();

				while (resultSet.next()) {
					int postId = resultSet.getInt("post_id");
					String title = resultSet.getString("title");
					String content = resultSet.getString("content");
					String category = resultSet.getString("category");
					String visibility = resultSet.getString("visibility");
					String storyImgUrl = resultSet.getString("storyImgUrl");

					String username = resultSet.getString("username");
					String imgUrl = resultSet.getString("avatar_url");
					java.sql.Timestamp date = resultSet.getTimestamp("created_at");
					posts.add(new Post(postId, title, content, category, visibility, storyImgUrl, username, imgUrl,
							date));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return posts;
	}

	public static List<Post> getStoriesByOtherUserId(int userId) {
		List<Post> posts = new ArrayList<>();

		try {

			Connection conn = Database.getConnection();

			String sql = "SELECT \r\n" + "    posts.*,\r\n" + "    users.*\r\n" + "FROM \r\n" + "    posts\r\n"
					+ "JOIN \r\n" + "    users ON posts.user_id = users.user_id\r\n" + "WHERE\r\n"
					+ "    users.user_id = ?\r\n" + "    AND posts.visibility = 'public' ORDER BY\r\n"
							+ "    posts.created_at DESC";
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setInt(1, userId);
				ResultSet resultSet = pstmt.executeQuery();

				while (resultSet.next()) {
					int postId = resultSet.getInt("post_id");
					String title = resultSet.getString("title");
					String content = resultSet.getString("content");
					String category = resultSet.getString("category");
					String visibility = resultSet.getString("visibility");
					String storyImgUrl = resultSet.getString("storyImgUrl");

					String username = resultSet.getString("username");
					String imgUrl = resultSet.getString("avatar_url");
					java.sql.Timestamp date = resultSet.getTimestamp("created_at");
					posts.add(new Post(postId, title, content, category, visibility, storyImgUrl, username, imgUrl,
							date));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return posts;
	}

	public static Post sss(int onepostId) {
		Post posts = null;

		try {

			Connection conn = Database.getConnection();

			String sql = "SELECT \r\n" + "    posts.*,\r\n" + "    users.*\r\n" + "FROM \r\n" + "    posts\r\n"
					+ "JOIN \r\n" + "    users ON posts.user_id = users.user_id\r\n" + "WHERE\r\n"
					+ "    posts.post_id=?";
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setInt(1, onepostId);
				ResultSet resultSet = pstmt.executeQuery();

				while (resultSet.next()) {
					int postId = resultSet.getInt("post_id");
					String title = resultSet.getString("title");
					String content = resultSet.getString("content");
					String category = resultSet.getString("category");
					String visibility = resultSet.getString("visibility");
					String storyImgUrl = resultSet.getString("storyImgUrl");

					String username = resultSet.getString("username");
					String imgUrl = resultSet.getString("avatar_url");
					java.sql.Timestamp date = resultSet.getTimestamp("created_at");
					posts = new Post(postId, title, content, category, visibility, storyImgUrl, username, imgUrl, date);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return posts;
	}

	public static boolean updateStory(int storyId, int userId, String title, String content, String category,
			String visibility, String storyImgUrl) {
		try (Connection conn = Database.getConnection();
				PreparedStatement preparedStatement = conn.prepareStatement(
						"UPDATE posts SET title = ?, content = ?, category = ? , storyImgUrl=? ,visibility=? WHERE post_id = ? AND user_id = ?")) {

			preparedStatement.setString(1, title);
			preparedStatement.setString(2, content);
			preparedStatement.setString(3, category);
			preparedStatement.setString(4, storyImgUrl);
			preparedStatement.setString(5, visibility);
			preparedStatement.setInt(6, storyId);
			preparedStatement.setInt(7, userId);

			int rowsUpdated = preparedStatement.executeUpdate();

			// Check if the update was successful
			return rowsUpdated > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public static boolean deletePost(int postId, int userId) {
		try {
			// Assuming you have configured your database properly
			try (Connection conn = Database.getConnection();
					PreparedStatement preparedStatement = conn
							.prepareStatement("DELETE FROM posts WHERE post_id = ? AND user_id = ?")) {

				preparedStatement.setInt(1, postId);
				preparedStatement.setInt(2, userId);

				int rowsDeleted = preparedStatement.executeUpdate();

				// Check if the deletion was successful
				return rowsDeleted > 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public List<Post> getRandomPublicStory(int userid) {
		List<Post> posts = new ArrayList<>();

		try {
			Connection conn = Database.getConnection();
			String sql = "SELECT \r\n"
					+ "    posts.post_id,\r\n"
					+ "    posts.title,\r\n"
					+ "    posts.content,\r\n"
					+ "    posts.category,\r\n"
					+ "    posts.visibility,\r\n"
					+ "    posts.storyImgUrl AS post_image,\r\n"
					+ "    posts.created_at AS post_created_at,\r\n"
					+ "    users.user_id AS user_id,\r\n"
					+ "    users.username AS username,\r\n"
					+ "    users.avatar_url AS user_avatar,\r\n"
					+ "    COUNT(DISTINCT favorites.favorite_id) AS favorite_count,\r\n"
					+ "    MAX(favorites.user_id = ?) AS favorited_by_current_user\r\n"
					+ "FROM \r\n"
					+ "    posts\r\n"
					+ "JOIN \r\n"
					+ "    users ON posts.user_id = users.user_id\r\n"
					+ "LEFT JOIN\r\n"
					+ "    likes ON posts.post_id = likes.post_id\r\n"
					+ "LEFT JOIN\r\n"
					+ "    favorites ON posts.post_id = favorites.post_id\r\n"
					+ "WHERE\r\n"
					+ "    posts.visibility = 'public'\r\n"
					+ "GROUP BY\r\n"
					+ "    posts.post_id\r\n"
					+ "ORDER BY\r\n"
					+ "    posts.created_at DESC";
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
				int currentUserId = userid;
				pstmt.setInt(1, currentUserId);
				pstmt.setInt(2, currentUserId);
				ResultSet resultSet = pstmt.executeQuery();

				while (resultSet.next()) {
					int postId = resultSet.getInt("post_id");
					String title = resultSet.getString("title");
					String content = resultSet.getString("content");
					String category = resultSet.getString("category");
					String visibility = resultSet.getString("visibility");
					String storyImgUrl = resultSet.getString("post_image");
					int userId = resultSet.getInt("user_id");
					String username = resultSet.getString("username");
					String imgUrl = resultSet.getString("user_avatar");
					boolean favoritedByCurrentUser = resultSet.getBoolean("favorited_by_current_user");

					posts.add(new Post(postId, title, content, category, visibility, storyImgUrl, userId, username,
							imgUrl, favoritedByCurrentUser));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return posts;
	}

	public static List<Post> trendPosts() {
		List<Post> posts = new ArrayList<Post>();

		try {
			Connection conn = Database.getConnection();
			String sql = "SELECT \r\n" + "    posts.*,\r\n" + "    users.*\r\n" + "FROM \r\n" + "    posts\r\n"
					+ "JOIN \r\n" + "    users ON posts.user_id = users.user_id\r\n" + "WHERE\r\n"
					+ "    posts.visibility = 'public' ORDER BY\r\n"
					+ "    posts.created_at DESC";
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {

				ResultSet resultSet = pstmt.executeQuery();

				while (resultSet.next()) {
					int postId = resultSet.getInt("post_id");
					String title = resultSet.getString("title");
					String content = resultSet.getString("content");
					String category = resultSet.getString("category");
					String visibility = resultSet.getString("visibility");
					String storyImgUrl = resultSet.getString("storyImgUrl");
					int userId = resultSet.getInt("user_id");
					String username = resultSet.getString("username");
					String imgUrl = resultSet.getString("avatar_url");
					java.sql.Timestamp date = resultSet.getTimestamp("created_at");
					posts.add(new Post(postId, title, content, category, visibility, storyImgUrl, userId, username,
							imgUrl, date));
				}
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return posts;
	}

	public static List<Post> getByCategory(String onecategory) {
		List<Post> posts = new ArrayList<>();

		try {
			Connection conn = Database.getConnection();
			String sql = "SELECT \r\n" + "    posts.*,\r\n" + "    users.*\r\n" + "FROM \r\n" + "    posts\r\n"
					+ "JOIN \r\n" + "    users ON posts.user_id = users.user_id\r\n" + "WHERE\r\n"
					+ "    posts.visibility = 'public'\r\n" + "    AND posts.category = ? ORDER BY\r\n"
							+ "    posts.created_at DESC";
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {

				pstmt.setString(1, onecategory);
				ResultSet resultSet = pstmt.executeQuery();

				while (resultSet.next()) {
					int postId = resultSet.getInt("post_id");
					String title = resultSet.getString("title");
					String content = resultSet.getString("content");
					String category = resultSet.getString("category");
					String visibility = resultSet.getString("visibility");
					String storyImgUrl = resultSet.getString("storyImgUrl");
					int userId = resultSet.getInt("user_id");
					String username = resultSet.getString("username");
					String imgUrl = resultSet.getString("avatar_url");
					java.sql.Timestamp date = resultSet.getTimestamp("created_at");
					posts.add(new Post(postId, title, content, category, visibility, storyImgUrl, userId, username,
							imgUrl, date));
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return posts;
	}

	public static List<Post> getAllPublicPostsRandomly() {
		List<Post> posts = new ArrayList<>();

		try {
			Connection conn = Database.getConnection();
			String sql = "SELECT \r\n"
					+ "    posts.*,\r\n"
					+ "    users.*\r\n"
					+ "FROM \r\n"
					+ "    posts\r\n"
					+ "JOIN \r\n"
					+ "    users ON posts.user_id = users.user_id\r\n"
					+ "WHERE\r\n"
					+ "    posts.visibility = 'public'\r\n"
					+ "ORDER BY\r\n"
					+ "    posts.created_at DESC;";
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {

				ResultSet resultSet = pstmt.executeQuery();

				while (resultSet.next()) {
					int postId = resultSet.getInt("post_id");
					String title = resultSet.getString("title");
					String content = resultSet.getString("content");
					String category = resultSet.getString("category");
					String visibility = resultSet.getString("visibility");
					String storyImgUrl = resultSet.getString("storyImgUrl");
					int userId = resultSet.getInt("user_id");
					String username = resultSet.getString("username");
					String imgUrl = resultSet.getString("avatar_url");
					java.sql.Timestamp date = resultSet.getTimestamp("created_at");
					posts.add(new Post(postId, title, content, category, visibility, storyImgUrl, userId, username,
							imgUrl, date));
				}
		
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return posts;
	}

	public static List<Post> searchByTitle(String postTitle) {
	    List<Post> posts = new ArrayList<Post>();

	    try {
	        Connection conn = Database.getConnection();
	        String sql = "SELECT \r\n"
	                + "    posts.*,\r\n"
	                + "    users.*\r\n"
	                + "FROM \r\n"
	                + "    posts\r\n"
	                + "JOIN \r\n"
	                + "    users ON posts.user_id = users.user_id\r\n"
	                + "WHERE \r\n"
	                + "    posts.visibility = 'public' AND\r\n"
	                + "    REPLACE(posts.title, ' ', '') LIKE ?\r\n" // Modify this line
	                + "ORDER BY\r\n"
	                + "    posts.created_at DESC;";
	        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            // Replace spaces with empty string in the search term
	            pstmt.setString(1, "%" + postTitle.replaceAll("\\s+", "") + "%");
	            ResultSet resultSet = pstmt.executeQuery();

	            while (resultSet.next()) {
					int postId = resultSet.getInt("post_id");
					String title = resultSet.getString("title");
					String content = resultSet.getString("content");
					String category = resultSet.getString("category");
					String visibility = resultSet.getString("visibility");
					String storyImgUrl = resultSet.getString("storyImgUrl");
					int userId = resultSet.getInt("user_id");
					String username = resultSet.getString("username");
					String imgUrl = resultSet.getString("avatar_url");
					java.sql.Timestamp date = resultSet.getTimestamp("created_at");
					posts.add(new Post(postId, title, content, category, visibility, storyImgUrl, userId, username,
							imgUrl, date));
				}
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return posts;
	}


	public static List<Post> searchByCategory(String postCategory) {
		List<Post> posts = new ArrayList<Post>();

		try {
			Connection conn = Database.getConnection();
			String sql = "SELECT \r\n" + "    posts.*,\r\n" + "    users.*\r\n" + "FROM \r\n" + "    posts\r\n"
					+ "JOIN \r\n" + "    users ON posts.user_id = users.user_id\r\n" + "WHERE\r\n"
					+ "    posts.visibility = 'public'\r\n" + "    AND posts.category like ? ORDER BY\r\n"
							+ "    posts.created_at DESC";
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {

				pstmt.setString(1, "%" + postCategory + "%");
				ResultSet resultSet = pstmt.executeQuery();

				while (resultSet.next()) {
					int postId = resultSet.getInt("post_id");
					String title = resultSet.getString("title");
					String content = resultSet.getString("content");
					String category = resultSet.getString("category");
					String visibility = resultSet.getString("visibility");
					String storyImgUrl = resultSet.getString("storyImgUrl");
					int userId = resultSet.getInt("user_id");
					String username = resultSet.getString("username");
					String imgUrl = resultSet.getString("avatar_url");
					java.sql.Timestamp date = resultSet.getTimestamp("created_at");
					posts.add(new Post(postId, title, content, category, visibility, storyImgUrl, userId, username,
							imgUrl, date));
				}
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return posts;
	}

	public static List<Post> getSavedPosts(int userid) {
		List<Post> posts = new ArrayList<>();

		try {
			Connection conn = Database.getConnection();
			String sql = "SELECT p.*, u.*\r\n" + "FROM posts p\r\n" + "JOIN favorites f ON p.post_id = f.post_id\r\n"
					+ "JOIN users u ON p.user_id = u.user_id\r\n" + "WHERE f.user_id = ? ORDER BY\r\n"
							+ "    p.created_at DESC";
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
				int currentUserId = userid;
				pstmt.setInt(1, currentUserId);

				ResultSet resultSet = pstmt.executeQuery();

				while (resultSet.next()) {
					int postId = resultSet.getInt("post_id");
					String title = resultSet.getString("title");
					String content = resultSet.getString("content");
					String category = resultSet.getString("category");
					String visibility = resultSet.getString("visibility");
					String storyImgUrl = resultSet.getString("storyImgUrl");
					int userId = resultSet.getInt("user_id");
					String username = resultSet.getString("username");
					String imgUrl = resultSet.getString("avatar_url");
					java.sql.Timestamp date = resultSet.getTimestamp("created_at");

					posts.add(new Post(postId, title, content, category, visibility, storyImgUrl, userId, username,
							imgUrl, date));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return posts;
	}

	public static Post getStoriesByUserId(int userId, int onepostId) {
		Post posts = null;

		try {
			Connection conn = Database.getConnection();
			String sql = "SELECT \r\n" + "    posts.post_id,\r\n" + "    posts.title,\r\n" + "    posts.content,\r\n"
					+ "    posts.category,\r\n" + "    posts.visibility,\r\n"
					+ "    posts.storyImgUrl AS post_image,\r\n" + "    posts.created_at AS post_created_at,\r\n"
					+ "    users.user_id AS user_id,\r\n" + "    users.bio,\r\n" + "    users.username AS username,\r\n"
					+ "    users.avatar_url AS user_avatar,\r\n"
					+ "    COUNT(DISTINCT likes.like_id) AS like_count,\r\n"
					+ "    COUNT(DISTINCT favorites.favorite_id) AS favorite_count,\r\n"
					+ "    MAX(likes.user_id = ?) AS liked_by_current_user,\r\n"
					+ "    MAX(favorites.user_id = ?) AS favorited_by_current_user\r\n" + "FROM \r\n" + "    posts\r\n"
					+ "JOIN \r\n" + "    users ON posts.user_id = users.user_id\r\n" + "LEFT JOIN\r\n"
					+ "    likes ON posts.post_id = likes.post_id\r\n" + "LEFT JOIN\r\n"
					+ "    favorites ON posts.post_id = favorites.post_id\r\n" + "WHERE posts.post_id = ?\r\n"
					+ "GROUP BY\r\n" + "    posts.post_id";

			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setInt(1, userId);
				pstmt.setInt(2, userId);
				pstmt.setInt(3, onepostId);
				ResultSet resultSet = pstmt.executeQuery();

				while (resultSet.next()) {
					int postId = resultSet.getInt("post_id");
					String title = resultSet.getString("title");
					String content = resultSet.getString("content");
					String category = resultSet.getString("category");
					String visibility = resultSet.getString("visibility");
					String bio = resultSet.getString("bio");
					String storyImgUrl = resultSet.getString("post_image");
					java.sql.Timestamp createdAt = resultSet.getTimestamp("post_created_at");
					int postUserId = resultSet.getInt("user_id");
					String username = resultSet.getString("username");
					String userAvatarUrl = resultSet.getString("user_avatar");
					int likeCount = resultSet.getInt("like_count");
					int favoriteCount = resultSet.getInt("favorite_count");
					boolean likedByCurrentUser = resultSet.getBoolean("liked_by_current_user");
					boolean favoritedByCurrentUser = resultSet.getBoolean("favorited_by_current_user");

					posts = new Post(postId, title, content, bio, category, visibility, storyImgUrl, postUserId,
							username, userAvatarUrl, likeCount, favoriteCount, likedByCurrentUser,
							favoritedByCurrentUser, createdAt);

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return posts;
	}

	public static Post getStoriesByUserIdNoUser(int onepostId) {
		Post posts = null;

		try {
			Connection conn = Database.getConnection();
			String sql = "SELECT posts.post_id, posts.title, posts.content, posts.category, posts.visibility, posts.storyImgUrl AS post_image, posts.created_at AS post_created_at, users.user_id AS user_id, users.bio, users.username AS username, users.avatar_url AS user_avatar, COUNT(DISTINCT likes.like_id) AS like_count, COUNT(DISTINCT favorites.favorite_id) AS favorite_count FROM posts JOIN users ON posts.user_id = users.user_id LEFT JOIN likes ON posts.post_id = likes.post_id LEFT JOIN favorites ON posts.post_id = favorites.post_id WHERE posts.post_id = ? GROUP BY posts.post_id";

			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {

				pstmt.setInt(1, onepostId);
				ResultSet resultSet = pstmt.executeQuery();

				while (resultSet.next()) {
					int postId = resultSet.getInt("post_id");
					String title = resultSet.getString("title");
					String content = resultSet.getString("content");
					String category = resultSet.getString("category");
					String visibility = resultSet.getString("visibility");
					String bio = resultSet.getString("bio");
					String storyImgUrl = resultSet.getString("post_image");
					java.sql.Timestamp createdAt = resultSet.getTimestamp("post_created_at");
					int postUserId = resultSet.getInt("user_id");
					String username = resultSet.getString("username");
					String userAvatarUrl = resultSet.getString("user_avatar");
					int likeCount = resultSet.getInt("like_count");
					int favoriteCount = resultSet.getInt("favorite_count");

					posts = new Post(postId, title, content, bio, category, visibility, storyImgUrl, postUserId,
							username, userAvatarUrl, likeCount, favoriteCount, createdAt);

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return posts;
	}

	public static List<Post> mostLikeUser() {
		List<Post> posts = new ArrayList<>();

		try {
			Connection conn = Database.getConnection();
			String sql = "SELECT u.user_id, u.username, u.email,u.bio, u.avatar_url, COUNT(l.like_id) AS total_likes\r\n"
					+ "FROM users u\r\n" + "JOIN posts p ON u.user_id = p.user_id\r\n"
					+ "JOIN likes l ON p.post_id = l.post_id\r\n"
					+ "GROUP BY u.user_id, u.username, u.email, u.avatar_url\r\n" + "HAVING total_likes = (\r\n"
					+ "    SELECT COUNT(DISTINCT l2.like_id)\r\n" + "    FROM likes l2\r\n"
					+ "    JOIN posts p2 ON l2.post_id = p2.post_id\r\n" + "    WHERE p2.user_id = u.user_id\r\n"
					+ "    GROUP BY p2.user_id\r\n" + "    ORDER BY COUNT(DISTINCT l2.like_id) DESC\r\n"
					+ "    LIMIT 1\r\n" + ")\r\n" + "ORDER BY total_likes DESC\r\n" + "LIMIT 4;\r\n" + "";
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {

				ResultSet resultSet = pstmt.executeQuery();

				while (resultSet.next()) {

					int userId = resultSet.getInt("user_id");
					String username = resultSet.getString("username");
					String imgUrl = resultSet.getString("avatar_url");
					String email = resultSet.getString("email");
					String bio = resultSet.getString("bio");

					posts.add(new Post(userId, username, imgUrl, email, bio));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return posts;
	}

	
	

	public static Post userProfileInfo(int userId) {
		Post posts = null;

		try {
			Connection conn = Database.getConnection();
			String sql = "SELECT * from users " + "    WHERE user_id=?";
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {

				pstmt.setInt(1, userId);
				ResultSet resultSet = pstmt.executeQuery();

				while (resultSet.next()) {

					String username = resultSet.getString("username");
					String imgUrl = resultSet.getString("avatar_url");
					String email = resultSet.getString("email");
					String bio = resultSet.getString("bio");
					posts = new Post(userId, username, imgUrl, email, bio);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return posts;
	}
	
	
	public static List<Post> AdminAllPosts() {
		List<Post> posts = new ArrayList<>();

		try {
			Connection conn = Database.getConnection();
			String sql = "select * from posts ORDER BY\r\n"
					+ "    created_at DESC";
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			

				ResultSet resultSet = pstmt.executeQuery();

				while (resultSet.next()) {
					int postId = resultSet.getInt("post_id");
					String title = resultSet.getString("title");
					String content = resultSet.getString("content");
					String category = resultSet.getString("category");
					String visibility = resultSet.getString("visibility");
					String storyImgUrl = resultSet.getString("storyImgUrl");				
					java.sql.Timestamp date = resultSet.getTimestamp("created_at");

					posts.add(new Post(postId, title, content, category, visibility, storyImgUrl, date));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return posts;
	}
	
	public static boolean adminDeletePostById(int postId) {
	    try {
	        // Assuming you have configured your database properly
	        try (Connection conn = Database.getConnection();
	        		
	             PreparedStatement preparedStatement = conn.prepareStatement("DELETE FROM posts WHERE post_id = ?")) {

	            preparedStatement.setInt(1, postId);

	            int rowsDeleted = preparedStatement.executeUpdate();

	           
	            return rowsDeleted > 0;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return false;
	}
	
	

	public static List<Post> getPostByCategory(String onecategory) {
		List<Post> posts = new ArrayList<>();

		try {
			Connection conn = Database.getConnection();

			String sql = "SELECT p.*, u.*\r\n"
					+ "FROM posts p\r\n"
					+ "JOIN favorites f ON p.post_id = f.post_id\r\n"
					+ "JOIN users u ON p.user_id = u.user_id\r\n"
					+ "WHERE p.category = ? AND p.visibility = 'public'\r\n"
					+ "ORDER BY p.created_at DESC\r\n"
					+ "LIMIT 3";
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setString(1, onecategory);
				ResultSet resultSet = pstmt.executeQuery();


				while (resultSet.next()) {
					int postId = resultSet.getInt("post_id");
					String title = resultSet.getString("title");
					String content = resultSet.getString("content");
					String category = resultSet.getString("category");
					String visibility = resultSet.getString("visibility");
					String storyImgUrl = resultSet.getString("storyImgUrl");
					int userId = resultSet.getInt("user_id");
					String username = resultSet.getString("username");
					String imgUrl = resultSet.getString("avatar_url");
					java.sql.Timestamp date = resultSet.getTimestamp("created_at");

					posts.add(new Post(postId, title, content, category, visibility, storyImgUrl, userId, username,
							imgUrl, date));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return posts;
	}
}
