package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Database;
import model.UserDao;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateProfile() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String updateUserName = request.getParameter("username");

		String updatePassword = request.getParameter("password");
		String updateBio = request.getParameter("bio");
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		String fileName = null;
		String photoPath = null;
		HttpSession session3= request.getSession();
		String imgUrl=(String)session3.getAttribute("imgUrl");

		try {

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

				photoPath = "ProfileImages" + File.separator + fileName;

			}else {
			
			
				String imgUrls = (String) session.getAttribute("imgUrl");
				photoPath=imgUrls;
			}
			boolean updated = UserDao.updateUserInformation(userId, updateUserName, updatePassword, photoPath,
					updateBio);
			if (updated) {
				HttpSession session2=request.getSession();
				 session.setAttribute("username", updateUserName);      
                 
                 session.setAttribute("bio", updateBio);
                 session.setAttribute("password", updatePassword);
               
                 session.setAttribute("imgUrl", photoPath);
                 session.setMaxInactiveInterval(24 * 60 * 60);
				response.sendRedirect("profile.jsp");
            
			} else {
				System.out.println("UnUpdated");
			}

		} catch (Exception e) {
			e.getMessage();
			e.printStackTrace();
		}
	}

}
