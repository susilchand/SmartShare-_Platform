package controller;
import model.UserDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.UserDao;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.catalina.ha.backend.Sender;
@WebServlet("/DeleteUser")
public class UserAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        int userId = Integer.parseInt(request.getParameter("userId"));

        try {
            boolean deleted = UserDao.forDeletingAllUser(userId);
            if (deleted) {
                response.sendRedirect("AdminForUser.jsp");
            } else {
            	 RequestDispatcher rd=request.getRequestDispatcher("AdminForUser.jsp");
                 rd.include(request, response);
                out.println("<h3 style='color:red;'>Failed to delete user with ID " + userId + ".</h3>");
            }
        } catch (Exception e) {
            out.println("<h3>Error occurred while deleting user: " + e.getMessage() + "</h3>");
        }
	}

}
