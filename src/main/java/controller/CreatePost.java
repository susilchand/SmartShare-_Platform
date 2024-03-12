package controller;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.PostDao;
import model.Post;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
@WebServlet("/CreatePost")
public class CreatePost extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String fileName = null;
        String postImgUrl = null;
        // Retrieve form data
        String title = req.getParameter("Title");
        String content = req.getParameter("Body");
        String category = req.getParameter("Category");
        String visibility = req.getParameter("visibility");
        HttpSession session = req.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        try {
            Part filePart = req.getPart("fileToUpload");
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

                if (title != null && !title.isEmpty()) {
                    // Insert the new story into the database
                    Post newPost = new Post(userId, title, content, category, visibility, postImgUrl);
                    newPost.setUserId(userId); // Set the user ID for the story
                    if (PostDao.createStory(newPost)) {
                    
                        RequestDispatcher rd = req.getRequestDispatcher("HomePage.jsp");
                        rd.forward(req, resp);
                    
                    } else {
                        // Failed to create story
                        resp.setContentType("text/html");
                        out.print("<h3>Failed to Create Story</h3>");
                    }
                } else {
                    // Title is empty
                    out.println("Error: Title cannot be empty");
                }
            } else {
                // No file uploaded
                out.println("Sorry! No file chosen");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.setContentType("text/html");
            out.print("<h3>Failed to Create Story</h3>" + e.getMessage());
        }
    }
}
