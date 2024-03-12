package controller;
import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.FavoriteDAO;

@WebServlet("/FavoriteServlet")
public class FavoriteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        
        if (userId == null) {
            // Handle case where user is not logged in
            response.sendRedirect("login.jsp");
            return;
        }
        
        String postIdString = request.getParameter("postId");
        int postId;
    
            postId = Integer.parseInt(postIdString);
    
        FavoriteDAO favoriteDAO = new FavoriteDAO(); // Create an instance of FavoriteDAO
        try {
            // Call the methods on the favoriteDAO instance
            boolean isFavorited = favoriteDAO.checkIfPostIsFavorited(userId, postId);
            if (isFavorited) {
                favoriteDAO.removeFavorite(userId, postId);
            } else {
                favoriteDAO.addFavorite(userId, postId);
            }
            
            String currentCategory = request.getParameter("currentCategory");
            String currentPage = request.getParameter("currentPage");
            String userIds = request.getParameter("userIds");
            String searchValue = request.getParameter("searchValue");
            

            if (currentCategory == null) {
               if (currentPage.equals("PostDetails.jsp")) {
            	   String redirectURL = currentPage+"?postId="+postId; 
                   response.sendRedirect(redirectURL);
			}else if (currentPage.equals("userProfile.jsp")) {
				  String redirectURL = currentPage+"?userId="+userIds; 
                  response.sendRedirect(redirectURL);
			}else if (currentPage.equals("search.jsp")) {
				 String redirectURL = currentPage+"?value="+searchValue; 
                 response.sendRedirect(redirectURL);
			}
               else {
            	   String redirectURL = "profile.jsp"+"?type="+currentPage;
                   response.sendRedirect(redirectURL);
			}
                
            } else {
               
                String redirectURL = "HomePage.jsp" + "?category=" + currentCategory; 
                response.sendRedirect(redirectURL);
            }

        } catch (SQLException e) {
          
            e.printStackTrace(); 
        }
    }
}
