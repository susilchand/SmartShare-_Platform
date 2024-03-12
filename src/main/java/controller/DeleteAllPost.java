package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.PostDao;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/DeleteAllPost")
public class DeleteAllPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteAllPost() {
        super();
   
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int postId = Integer.parseInt(request.getParameter("postId"));
		 PrintWriter out = response.getWriter();
	        // Delete the story using the StoryDao
	        boolean deleted = PostDao.adminDeletePostById(postId);
	        
	        if(deleted) {
	        	 response.setContentType("text/html");
	             RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
                 rd.forward(request, response);
	       
	        } else {
	            // Error occurred during deletion
	           
	            out.println("<html><body><h3>Error deleting the post.</h3></body></html>");
	        }
	}

}
