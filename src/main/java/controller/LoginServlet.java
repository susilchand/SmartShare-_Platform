package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Database;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out=response.getWriter();
    	String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Connection connection = Database.getConnection();

            if (connection != null) {
                String sql = "SELECT * FROM users WHERE email = ? AND password_hash = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                
                statement.setString(1, email);
                statement.setString(2, password);

                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                	int userId=resultSet.getInt("user_id");
                	String useremail=resultSet.getString("email");
                	String username=resultSet.getString("username");
                	String bio=resultSet.getString("bio");
                	String pwd=resultSet.getString("password_hash");
                	String imgUrl=resultSet.getString("avatar_url");                	
                	HttpSession session = request.getSession();
                    session.setAttribute("username", username);      
                    session.setAttribute("userId", userId);
                    session.setAttribute("bio", bio);
                    session.setAttribute("password", pwd);
                    session.setAttribute("email", useremail);
                    session.setAttribute("imgUrl", imgUrl);
                    session.setMaxInactiveInterval(24 * 60 * 60);
            	response.sendRedirect("HomePage.jsp"); 
					
                    
                } else {
                    RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                    rd.include(request, response);
                    out.println("<center style='color:red; margin-top:10px;'>Invalid Username or Password</center>");
                }

                resultSet.close();
                statement.close();
                Database.close(connection);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.html");
        }
    }
}
