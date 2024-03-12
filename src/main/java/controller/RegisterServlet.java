package controller;

import java.io.*;
import java.nio.file.*;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Database;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "profile_pictures";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String userName = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String bio=request.getParameter("bio");

        String fileName = null;
        String photoPath = null;

        try {
            Connection connection = Database.getConnection();
            if (connection != null) {
                String sql = "INSERT INTO users (username, email, password_hash, avatar_url,bio, created_at) VALUES (?, ?, ?,?, ?, ?)";
                PreparedStatement statement = connection.prepareStatement(sql);

                statement.setString(1, userName);
                statement.setString(2, email);
                statement.setString(3, password);

                Part filePart = request.getPart("photo");
                if (filePart != null && filePart.getSize() > 0) {
                    // Get the file name
                    fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

                 // Save file to the specified folder
                    String uploadPath = "D:/Project_/MediumPlatform/src/main/webapp/ProfileImages";
                    String filePath = uploadPath + File.separator + fileName;

                    // Ensure the folder exists
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs(); // Create directories if they don't exist
                    }

                    // Save the file to the server
                    try (InputStream fileContent = filePart.getInputStream()) {
                        Files.copy(fileContent, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
                    }

                    // Set the photoPath to be saved in the database
                    photoPath = "ProfileImages" + File.separator + fileName;
                    statement.setString(4, photoPath);
                } else {
                	photoPath = "ProfileImages/profile.webp";
                    // No profile picture uploaded, set avatar_url to null
                    statement.setString(4, photoPath);
                }

                // Set created_at timestamp
                statement.setString(5, bio);
                statement.setTimestamp(6, new java.sql.Timestamp(System.currentTimeMillis()));

                // Execute the statement
                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", userName);
                    response.sendRedirect("login.jsp");
                } else {
                    out.println("Registration Failed!");
                }

                // Close resources
                statement.close();
                Database.close(connection);
            }
        } catch (SQLException e) {
            e.getMessage();
            e.printStackTrace();
        }
    }}