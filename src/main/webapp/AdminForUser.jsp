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
	// User is logged in as admin, proceed to display the page content
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of Users</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.navbar {
	background-color: white;
	color: black;
	border: 1px solid gray;
	display: flex;
	align-items: center;
	gap: 100px;
	padding:0 20px;
	text-align: center;
}

.navbar a {
	text-align: center;
	padding: 10px 20px;
	text-decoration: none;
}

.navbar a:hover {
	background-color: #ddd;
	color: black;
}

table {
	border-collapse: collapse;
	width: 80%;
	margin: 20px auto;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
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

	<table>
		<thead>
			<tr>
				<th>User ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Password</th>
				<th>Profile Picture</th>
				<th>Bio</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			List<model.User> userAll = UserDao.selectingAllUser();
			for (model.User user : userAll) {
			%>
			<tr>
				<td><%=user.getId()%></td>
				<td><%=user.getName()%></td>
				<td><%=user.getEmail()%></td>
				<td><%=user.getPassword()%></td>
				<td><%=user.getAvatarImg()%></td>
				<td><%=user.getBio()%></td>

				<td>

					<button class="showFormButton">Delete</button>
					<form id="deleteForm" action="DeleteUser" method="post"
						style="display: none; align-items: center; line-height: 10px; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: #fff; padding: 20px; padding-right: 20px; border: 1px solid #c9c4c4; width: 250px; height: 80px;">
						<div>
							<input type="hidden" name="userId" value="<%=user.getId()%>">
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

		</tbody>
	</table>



	<script src="https://kit.fontawesome.com/b18399b997.js"
		crossorigin="anonymous"></script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Add event listener for all buttons with class "showFormButton"
			document.querySelectorAll(".showFormButton").forEach(
					function(button) {
						button.addEventListener("click", function() {
							// Find the corresponding form by traversing the DOM hierarchy
							var form = this.parentNode.querySelector("form");
							if (form) {
								form.style.display = "flex";
							}
						});
					});

			// Add event listener for all cancel buttons
			document.querySelectorAll("#cancelButton").forEach(
					function(button) {
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
