package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.PostDao;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   PrintWriter out = response.getWriter();
	        int postId = Integer.parseInt(request.getParameter("postId"));
	        
	     HttpSession session=request.getSession();
	     int userId=(Integer)session.getAttribute("userId");

	     
	       

	        try {
	            // Delete the Story
	            boolean deleted = PostDao.deletePost(postId, userId);

	            if (deleted) {
	            	response.sendRedirect("profile.jsp");
	            } else {
	            	System.out.println("not Deleted");
	            }
	        } catch (Exception e) {
	            e.printStackTrace(); // Log the exception properly
	            response.setContentType("text/html");
	            response.getWriter().write("<h3>Failed to Delete Story</h3>" + postId + userId); // Provide a user-friendly message
	        }
	    }
}


