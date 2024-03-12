<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link rel="icon" href="assets/img/p_logo.png">
<link type="text/css" rel="stylesheet" href="/signUp.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!-- Bootstrap core CSS -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<!-- Fonts -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Righteous"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="assets/css/mediumish.css" rel="stylesheet">
<style>
.aaaaaa {
	background-color: red;
}

.dropdown-content {
	bottom: -131px;
}



.fav_red {
	color: red;
	font-size:25px;
	margin-right:25px;
}

.fav_ {
	color: black;
}

@media ( min-width :576px) {
	.card-columns.listfeaturedtag {
		-webkit-column-count: 2;
		-moz-column-count: 2;
		column-count: 2;
	}
}

@media ( min-width :992px) {
	.navbar-toggleable-md .navbar-nav .nav-link {
		padding-right: .7rem;
		padding-left: .7rem;
	}
}


@media ( min-width :1024px) {
	.share {
		position: fixed;
		display: block;
	}
	.share ul li {
		display: block;
	}
}

@media ( max-width :999px) {
	.listfeaturedtag .wrapthumbnail, .listfeaturedtag .col-md-7 {
		width: 100%;
		max-width: 100%;
		-webkit-box-flex: 0;
		-webkit-flex: 100%;
		-ms-flex: 100%;
		flex: 100%;
	}
	.listfeaturedtag .wrapthumbnail {
		height: 250px;
	}
	.listfeaturedtag .card {
		height: auto;
	}
	.listfeaturedtag .wrapfooter {
		position: relative;
		margin-top: 30px;
	}
	.listfeaturedtag .card-block {
		padding: 20px;
	}
}

@media ( max-width :1024px) {
	.post-top-meta .col-md-10 {
		text-align: center;
	}
}

@media ( max-width :767px) {
	.post-top-meta.authorpage {
		text-align: center;
	}
}

.authorpostbox .img-thumb {
	width: 100%;
}

.sociallinks {
	margin: 1rem 0;
}

.sociallinks a {
	background: #666;
	color: #fff;
	width: 22px;
	height: 22px;
	display: inline-block;
	text-align: center;
	line-height: 22px;
	border-radius: 50%;
	font-size: 12px;
}

.bar {
	padding: 5px 18px;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	border-top: 1px solid rgb(231, 222, 222);
	border-bottom: 1px solid rgb(228, 222, 222);
	margin-bottom: 10px;
	align-items: center;
	text-align: center;
}

.bar .logo {
	font-size: 20px;
	color: rgb(203, 197, 197);
}

.s-bar {
	display: flex;
	align-items: center;
	text-align: center;
	justify-content: space-between;
}

.card {
	flex-wrap: wrap;
}

.row {
	flex-wrap: wrap;
}

.s-bar .logo {
	padding: 0 18px;
	font-size: 20px;
	color: rgb(203, 197, 197);
}

.profile__ {
	align-items: center;
	text-align: center;
	width: 35px;
	height: 35px;
	border-radius: 50%;
	border: 1px solid #b2aaaa;
}

.nav-item {
	text-align: center;
	align-items: center;
	display: grid;
	align-content: center;
}

.nav-link {
	font-size: 15px;
}

.write {
	color: gray;
	margin-right: 8px;
}

.nav-width {
	width: 100%;
}

.clearfix {
	display: flex;
	gap: 30px;
}

.clearfix a {
	color: black;
}

.active {
	color: blue;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	border-radius: 10%;
	padding: 20px;
	right: -20px;
	bottom: -160px;
	display: none;
	position: absolute;
	min-width: 200px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 100;
	border: none;
	/* Remove border */
	background-color: rgb(255, 255, 255);
	/* Remove background color */
}

.dropdown-content a {
	margin: 5px 0px;
	border-radius: 15px;
	color: black;
	padding: 5px 0px;
	text-decoration: none;
	display: block;
	font-weight: bold;
	border: 1px solid gray;
}

.dropdown-content a:hover {
	background-color: #f1f1f1;
	/* Hover color */
}

.dropdown-trigger {
	border: none;
	/* Remove border */
	background-color: transparent;
	/* Remove background color */
	cursor: pointer;
	outline: none;
	/* Remove outline */
}

.show {
	display: block;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
}

.containerss {
	align-items: center;
	text-align: center;
	width: 70%;
	/* Adjusted width */
	max-width: 400px;
	/* Set maximum width */
	margin: 50px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
	line-height: 1rem;
}

h3 {
	font-size: 18.73px; text-align : center;
	color: #333;
	text-align: center;
}

#sign-up-form {
	text-align: center;
}

.profile-pic-div {
	margin-bottom: 20px;
	text-align: center;
	position: relative;
	/* Position relative for absolute positioning */
	display: flex;
	/* Use flexbox */
	flex-direction: column;
	/* Stack items vertically */
	align-items: center;
	/* Center items horizontally */
}

#previewPhoto {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	border: 2px solid #ccc;
	object-fit: cover;
}

#file {
	width: 100%;
	/* Adjusted width */
	opacity: 0;
	cursor: pointer;
}

#uploadBtn {
	margin-top: auto;
	/* Push button to the bottom */
	padding: 8px 16px;
	background-color: #e6eaed;
	color: #131313;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	text-align: center;
}

#uploadBtn:hover {
	background-color: #c5c9cf;
}

textarea {
	width: 200px;
	height: 60px;
	resize: vertical;
}

input[type="text"], input[type="email"], input[type="password"],
	#confirm_password {
	padding: 1px 2px;
	width: 200px;
	height: 25px;
}

input[type="submit"] {
	width: 30%;
	height: 30px;
	border-radius: 10px;
	border: 1px solid #e6eaed;;
}

input[type="submit"]:hover {
	background-color: #c5c9cf;
}

/* Sign in link */
#sign-in-link {
	text-align: center;
	margin-top: 20px;
}

#sign-in-link a {
	color: #007bff;
	text-decoration: none;
}

#sign-in-link a:hover {
	text-decoration: underline;
}

#form .form-width {
	align-items: center;
	text-align: center;
	display: flex;
	justify-content: space-between;
	width: 300px;
	margin: 8px auto;
}

#form .form-width label {
	font-size: 15px;
}

.nav-width {
	width: 100%;
	align-item: center;
}

#searchInput {
	height: 35px;
	padding: 0.5rem 0.75rem;
}

.mediumnavigation .form-control {
	background: #f2f4f2;
	font-size: 0.8rem;
	border-radius: 30px;
	overflow: hidden;
	border: 1px solid rgba(0, 0, 0, 0.04);
	width: 210px;
	align-item: center;
	height: 35px;
	margin: auto 0;
}

.navbar-toggleable-md .navbar-collapse {
	display: -webkit-box !important;
	display: -webkit-flex !important;
	display: -ms-flexbox !important;
	display: flex !important;
	width: 100%;
	height: 50px;
	align-item: center;
}

.svgIcon-use {
	margin-top: 8px;
}
</style>
</head>

<body>

	<!-- Begin Nav
================================================== -->
	<nav
		class="navbar navbar-toggleable-md navbar-light bg-white fixed-top mediumnavigation"
		style="background-color: #ffffff;">
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarsExampleDefault"
			aria-controls="navbarsExampleDefault" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="container nav-width">

			<div class="collapse navbar-collapse" id="navbarsExampleDefault" style="
    align-items: center; height:50px;
">
				<!-- Begin Logo -->
				 <img
					src="assets/img/p_logo.png" alt="logo" style='width: 130px;'>
				
				<!-- End Logo -->
				<!-- Begin Search -->
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
					id="searchInput"> <span class="search-icon"><svg
						class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25">
							<path
							d="M20.067 18.933l-4.157-4.157a6 6 0 1 0-.884.884l4.157 4.157a.624.624 0 1 0 .884-.884zM6.5 11c0-2.62 2.13-4.75 4.75-4.75S16 8.38 16 11s-2.13 4.75-4.75 4.75S6.5 13.62 6.5 11z">
							</path>
						</svg></span>

				<!-- End Search -->
			</div>


			<%
			HttpSession session2 = request.getSession();
			Integer mainuserId = (Integer) session2.getAttribute("userId");
			String imgUrl = (String) session2.getAttribute("imgUrl");
			if (mainuserId != null) {
			%>
			<div class="collapse navbar-collapse" id="navbarsExampleDefault">
				<!-- Begin Menu -->

				<ul class="navbar-nav ml-auto">
		<li class="nav-item"><a class="nav-link"
								style="color: rgb(23, 23, 23);" href="HomePage.jsp?category=foryou">Home</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="createPost.jsp"><i class="far fa-pen-to-square write"></i>Write<span
							class="sr-only"></span></a></li>
					
					<li class="nav-item">
						<div class="dropdown">
							<button class="dropdown-trigger" onclick="toggleDropdown(event)">
								<a class="nav-link profile-link" href="#"><img
									class="profile__" src="<%=imgUrl%>" alt="profile"></a>
							</button>
							<div class="dropdown-content" id="dropdownContent">

								<a class="signin" href="profile.jsp">Profile</a> <a
									class="signup" href="LogoutServlet">Log Out</a>

							</div>
						</div>
					</li>
					<%
					} else {
					%>
					<div class="collapse navbar-collapse" id="navbarsExampleDefault">
						<!-- Begin Menu -->

						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link"
								style="color: rgb(23, 23, 23);" href="HomePage.jsp">Home</a></li>
							<li class="nav-item active"><a class="nav-link"
								href="login.jsp"><i class="far fa-pen-to-square write"></i>Write<span
									class="sr-only"></span></a></li>
						
							<li class="nav-item">
								<div class="dropdown">
									<button class="dropdown-trigger"
										onclick="toggleDropdown(event)">
										<a class="nav-link profile-link" href="#"><img
											class="profile__" src="assets/img/profile.webp" alt="profile"></a>
									</button>
									<div class="dropdown-content" id="dropdownContent">

										<a class="signin" href="login.jsp">Sign In</a> <a
											class="signup" href="registration.jsp">Sign Up</a>

									</div>
								</div>
							</li>

							<%
							}
							%>

						</ul>


						<!-- End Menu -->

					</div>
			</div>
	</nav>
	<!-- End Nav
================================================== -->



	<div class="containerss">
		<h3>CREATE NEW ACCOUNT</h3>

		<div id="sign-up-form">
			<form id="form" action="RegisterServlet" method="POST"
				enctype="multipart/form-data">
				<div class="profile-pic-div">
					<img src="assets/img/profile.webp" id="previewPhoto"> <input
						type="file" id="file" name="photo" accept="image/*"> <label
						for="file" id="uploadBtn">Choose Photo</label>
				</div>
				<div class="form-width">
					<label for="username">Name:</label> <input type="text"
						name="username" id="username" required>
				</div>
				<div class="form-width">
					<label for="email">Email:</label> <input type="email" name="email"
						id="email" required>
				</div>
				<div class="form-width">
					<label for="password">Password:</label> <input type="password"
						name="password" id="password" required>
				</div>
				<div class="form-width">
					<label for="confirm_password">Confirm <br>Password:
					</label> <input type="password" name="confirm_password"
						id="confirm_password" required>
				</div>
				<div class="form-width">
					<label for="bio">Bio:</label>
					<textarea name="bio" id="bio"></textarea>
				</div>

				<input type="submit" value="Register">
			</form>
		</div>

		<!-- Already have an account, sign in link -->
		<div id="sign-in-link">
			<p>
				Already have an account? <a href="login.jsp">Sign in</a>
			</p>
		</div>
	</div>

	<script>
		document.addEventListener("DOMContentLoaded", function() {
			const passwordField = document.getElementById("password");
			const confirmPasswordField = document
					.getElementById("confirm_password");

			confirmPasswordField.addEventListener("input", function() {
				const password = passwordField.value;
				const confirmPassword = confirmPasswordField.value;

				if (password === confirmPassword) {
					confirmPasswordField.style.color = "green";
					confirmPasswordField.setCustomValidity('');
				} else {
					confirmPasswordField.style.color = "red";
					confirmPasswordField
							.setCustomValidity('Passwords do not match');
				}
			});

			passwordField.addEventListener("input", function() {
				// Trigger input event on confirm password field to recheck
				confirmPasswordField.dispatchEvent(new Event("input"));
			});
		});

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
	<script src="assets/js/app.js"></script>
	<script src="https://kit.fontawesome.com/b18399b997.js"
		crossorigin="anonymous"></script>
	<script src="assets/js/app.js"></script>

	<script src="assets/js/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/ie10-viewport-bug-workaround.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>

</html>