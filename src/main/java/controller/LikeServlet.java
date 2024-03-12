package controller;

//LikeServlet.java
import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.FavoriteDAO;
import model.LikeDAO;
@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     int postId = Integer.parseInt(request.getParameter("postId"));
     int userId = Integer.parseInt(request.getParameter("userId"));

     
     LikeDAO likeDAO = new LikeDAO(); // Create an instance of FavoriteDAO
     try {
         // Call the methods on the favoriteDAO instance
         boolean isLiked = likeDAO.checkIfPostIsLiked(userId, postId);
         if (isLiked) {
        	 likeDAO.dislikePost(userId, postId);
         } else {
        	 likeDAO.likePost(userId, postId);
         }
         // Redirect back to the page where the request originated
        
     } catch (SQLException e) {
         // Handle SQL exception
         e.printStackTrace(); // You might want to handle this more gracefully
     }
     response.sendRedirect("PostDetails.jsp?postId=" + postId);
 }
}

