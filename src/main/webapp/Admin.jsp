<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.FavoriteDAO"%>
<%@page import="java.security.Timestamp"%>
<%@page import="model.PostDao"%>
<%@page import="model.Post"%>
<%@page import="model.UserDao"%>
<%@page import="model.User"%>
<%@ page import="java.util.List"%>

<%
// Check if the user is logged in and has the correct credentials
String loggedInUser = (String) session.getAttribute("email");
if (loggedInUser == null || !loggedInUser.equals("admin@gmail.com")) {
	// Redirect the user to the login page or display an error message
	response.sendRedirect("login.jsp");
} else {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Posts</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.navbar {
	background-color: white;
	overflow: hidden;
	border-bottom:1px solid grey;
	color:black;
	display:flex;
	gap:100px;
	padding:0 20px;
}

.navbar a {
	float: left;
	display: block;
	color:black;

	text-align: center;
	padding: 14px 20px;
	text-decoration: none;
	font-size: 17px;
}

.navbar a:hover {
	background-color: #ddd;
	color: black;
}

.content {
	padding: 16px;
}

table {
	width: 95%;
	margin: 20px auto;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	text-align: center;
	background-color: #f2f2f2;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

form {
	display: inline;
}


.title-head {
	width: 180px;
}

.showFormButton{
	background-color: red;
	color: white;
	border: none;
	padding: 6px 12px;
	cursor: pointer;
}

.showFormButton:hover {
	background-color: #d32f2f;
}

.navbar-brand {
	display: flex;
	align-item: center;
}

.AdminClick {
	display: flex;
	align-items: center;
	text-align: center;
}
</style>
</head>
<body>
<div class="navbar">
		<div class="navbar-brand">
			<img src="assets/img/p_logo.png" alt="logo" style='width: 130px;'>
		</div>
		<div class="AdminClick">
		<a href="HomePage.jsp?category=foryou">Home</a>
			<a href="AdminForUser.jsp">Users</a> <a href="Admin.jsp">Posts</a>
		</div>
	</div>
	<div class="content">
		<h2>All Posts</h2>
		<table border="1">
			<tr>
				<th>ID</th>
				<th class="title-head">Title</th>
				<th>Content</th>
				<th>Category</th>
				<th>Visibility</th>
				<th>PostImgUrl</th>
				<th>Action</th>
			</tr>
			<%
			List<Post> allPosts = PostDao.AdminAllPosts();
			for (Post post : allPosts) {
			%>
			<tr>
				<td><%=post.getStoryId()%></td>
				<td class="title-head"><%=post.getTitle()%></td>
				<td><%=post.getContent()%></td>
				<td><%=post.getCategory()%></td>
				<td><%=post.getVisibility()%></td>
				<td><%=post.getPostImgUrl()%></td>

				<td>

			<button class="showFormButton">Delete</button>
					<form id="deleteForm" action="DeleteAllPost" method="post"
						style="display: none; align-items: center; line-height: 10px; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: #fff; padding: 20px; padding-right: 20px; border: 1px solid #c9c4c4; width: 250px; height: 80px;">
						<div>
							<input type="hidden" name="postId" value="<%=post.getStoryId()%>">
							<h2>
								Delete!<i class="fa-solid fa-triangle-exclamation"></i>
							</h2>
							<p>Are you sure you want to delete?</p>
							<div
								style="display: flex; justify-content: space-between; text-align: center; align-items: center; padding-bottom: 20px;">
								<button id="cancelButton">Cancel</button>
								<button type="submit">OK</button>
							</div>
						</div>
					</form>
					
					</td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	  <script src="https://kit.fontawesome.com/b18399b997.js" crossorigin="anonymous"></script>
   <script>
    document.addEventListener("DOMContentLoaded", function() {
        // Add event listener for all buttons with class "showFormButton"
        document.querySelectorAll(".showFormButton").forEach(function(button) {
            button.addEventListener("click", function() {
                // Find the corresponding form by traversing the DOM hierarchy
                var form = this.parentNode.querySelector("form");
                if (form) {
                    form.style.display = "flex";
                }
            });
        });

        // Add event listener for all cancel buttons
        document.querySelectorAll("#cancelButton").forEach(function(button) {
            button.addEventListener("click", function(event) {
                event.preventDefault();
                // Find the corresponding form by traversing the DOM hierarchy
                var form = this.closest("form");
                if (form) {
                    form.style.display = "none";
                }
            });
        });
    });
</script>

	<script>
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							const searchInput = document
									.getElementById("searchInput");
							searchInput
									.addEventListener(
											"keypress",
											function(event) {
												if (event.key === "Enter") {

													window.location.href = "http://localhost:8080/MediumPlatform/search.jsp?value="
															+ searchInput.value;
												}
											});
						});
	</script>
</body>
</html>
<%
}
%>
