package controller;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Timestamp;

import org.apache.jasper.tagplugins.jstl.core.Out;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Post;
import model.PostDao;


@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)

@WebServlet("/UpdatePost")
public class UpdatePost extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
    	String fileName=null;
    	String postImgUrl=null;
    	PrintWriter out=response.getWriter();
        int postId = Integer.parseInt(request.getParameter("postId"));
        
        String title = request.getParameter("Title");
        String content = request.getParameter("Body");
        String category = request.getParameter("Category");
       
        String visibility = request.getParameter("visibility");
        HttpSession session = request.getSession();
     int userId=(Integer)session.getAttribute("userId");
     

   try {Part filePart = request.getPart("fileToUpload");
  
   if (filePart != null && filePart.getSize() > 0) {
       // Get the file name
       fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

       // Save file to the specified folder
       String uploadPath = "D:/Project_/MediumPlatform/src/main/webapp/BlogImages";
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
       postImgUrl = "BlogImages" + File.separator + fileName;
       
    
       
  
       } 
   else {
	String postImgUrls=(String) session.getAttribute("postImgUrl");
	postImgUrl = postImgUrls;
}
   } catch (Exception e) {
       e.printStackTrace();
       response.setContentType("text/html");
       out.print("<h3>Failed to Update Post</h3>" + e.getMessage());
       
   }
   boolean success = PostDao.updateStory(postId, userId, title, content, category, visibility,postImgUrl);
   
   // Redirect to a confirmation page or back to the original page
   if (success) {
	   response.setContentType("text/html");
       
	     RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
         rd.forward(request, response);
      
   } else {
       response.sendRedirect("update_failure.jsp"); // Redirect to a failure page
   }
      
  
    }
}
