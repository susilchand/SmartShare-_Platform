<%@page import="model.PostDao"%>
<%@page import="model.Post"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Colorlib Templates">
<meta name="author" content="Colorlib">
<meta name="keywords" content="Colorlib Templates">
<title>Update Post</title>
<link rel="icon" href="assets/img/p_logo.png">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">

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
<script>
	tinymce.init({
		selector : '#mytextarea',
	});
	function validateForm() {
		var editorContent = tinymce.get('mytextarea').getContent();
		if (editorContent == "" || editorContent == null) {
			alert("Please enter the body!");
			return false;
		}
		return true;
	}
</script>
<style>
/* Add your CSS styles here */
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
}
    .nav-width{
    width:100%;
    }
    #searchInput{
    
    width:210px;}
.page-wrapper {
	background-color: #f0f0f0;
	padding-top: 50px;
	padding-bottom: 50px;
}

.wrapper {
	max-width: 700px;
	margin: 0 auto;
}

.card {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.card-heading {
	background-color: #c1cbd2;
	color: #000000;
	padding: 15px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.card-body {
	padding: 20px;
}

.form-row {
	margin-bottom: 20px;
	display: flex;
	align-items: center;
}

.form-row .name {
	width: 120px;
}

.form-row .value {
	width: 50px;
	flex: 1;
}

.textarea--style-6 {
	width: 79%;
	height: 100px;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	font-size: 15px;
}

.input--style-6 {
	height: 30px;
	width: 79%;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	font-size: 15px;
}

.category, .visibility {
	width: 79%;
	height: 40px;
	font-size: 15px;
}

.label--file {
	padding: 10px;
	background-color: #007bff;
	color: #fff;
	border-radius: 5px;
	cursor: pointer;
}

.label--desc {
	margin-top: 5px;
	font-size: 12px;
	color: #666;
}

.preview {
	margin-left: 10px;
}

.preview img {
	max-width: 100px;
	max-height: 100px;
	border-radius: 5px;
}

.img-width {
	width: 80%;
}

.card-footer {
	text-align: center;
}

button[type="submit"] {

	border-radius: 5px;
	border: 1px solid rgb(159, 152, 152);
}

button[type="submit"]:hover {
	background: rgb(164, 160, 160);
	
}
.card-footer {
    padding: 0;
    background-color: transparent;
    border-top: none;
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





	<div class="page-wrapper bg-dark p-t-100 p-b-50">
		<div class="wrapper wrapper--w900">
			<div class="card card-6">
				<div class="card-heading">
					<h2 class="title">Update Post</h2>
				</div>
				<div class="card-body">

					<%
					try {
						
						String postParamId = request.getParameter("post_id");

						// Check if storyIdParam is not null and is a valid integer
						
							int postId = Integer.parseInt(postParamId);
							Post post = PostDao.getStoryById(postId);
						
							if (post != null) {
					%>
					<form action="UpdatePost" method="post"
						enctype="multipart/form-data">
						<div class="form-row">
						<input type="hidden" name="postId" value=<%=post.getStoryId() %>>
							<div class="name">Category</div>
							<div class="value">
								<select name="Category" class="input--style-6 category">
									<option value="Psychology" <%="Psychology".equalsIgnoreCase(post.getCategory())? "selected" : "" %>>Psychology</option>
									<option value="Food" <%="Food".equalsIgnoreCase(post.getCategory())? "selected" : "" %>>Food</option>
									<option value="Business" <%="Business".equalsIgnoreCase(post.getCategory())? "selected" : "" %>>Business</option>
									<option value="Programming" <%="Programming".equalsIgnoreCase(post.getCategory())? "selected" : "" %>>Programming</option>
									<option value="Education" <%="Education".equalsIgnoreCase(post.getCategory())? "selected" : "" %>>Education</option>
									<option value="Health" <%="Health".equalsIgnoreCase(post.getCategory())? "selected" : "" %>>Health</option>
									<option value="Media" <%="Media".equalsIgnoreCase(post.getCategory())? "selected" : "" %>>Media</option>
								</select>
							</div>
						</div>
						<div class="form-row">
							<div class="name">Title</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-6" type="text" name="Title"
										placeholder="Type the title of your blog here"
										value="<%=post.getTitle()%>" required="">
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">Content</div>
							<div class="value">
								<div class="input-group">
									<textarea id="mytextarea" class="textarea--style-6" name="Body"
										placeholder="Type the body of your blog here"><%=post.getContent()%></textarea>
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">Visibility</div>
							<div class="value">
								<select name="visibility" class="input--style-6 visibility">
									<option value="public"
										<%="public".equalsIgnoreCase(post.getVisibility())? "selected" : ""%>>Public</option>
									<option value="private"
										<%="private".equalsIgnoreCase(post.getVisibility())? "selected" : ""%>>Private</option>
								</select>
							</div>
						</div>
						<div class="form-row img-width">
							<div class="name">Upload Image</div>
							<div class="value">
								<div class="input-group js-input-file">
									<input class="input-file" type="file" name="fileToUpload"
										id="file" accept="image/*">

								</div>

							</div>
							<div class="preview">
								<img  src="<%=post.getPostImgUrl()%>" name="ImgUrl" id="previewPhoto" size="50">
								<%session.setAttribute("postImgUrl", post.getPostImgUrl()); %>
							</div>
						</div>
						<div class="card-footer">
							<button class="btn btn--radius-2 btn--blue-2" type="submit"
								id="submit" onclick="return validateForm()">Update Post</button>
						</div>
					</form>
					<%
					} else {
					%>
					<p>Story not found</p>
					<%
					}
				
					} catch (Exception e) {
					e.printStackTrace();
					%>
					<h3>Failed to fetch data from the database</h3>
					<%=e.getMessage()%>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
	<script>
		const imgDiv = document.querySelector('profile-pic-div');
		const img = document.querySelector('#previewPhoto');
		const file = document.querySelector('#file');
		const uploadBtn = document.querySelector('#uploadBtn');

		file.addEventListener('change', function() {
			const choosedFile = this.files[0];
			if (choosedFile) {
				const reader = new FileReader();

				reader.addEventListener('load', function() {
					img.setAttribute('src', reader.result);
				});
				reader.readAsDataURL(choosedFile);
			}
		});
		
		   document.addEventListener("DOMContentLoaded", function () {
		    	  const searchInput = document.getElementById("searchInput");
		    	  searchInput.addEventListener("keypress",  function (event) {
		    	    if (event.key === "Enter") {
		    	    	
		    	    	
		    	      window.location.href =
		    	        "http://localhost:8080/MediumPlatform/search.jsp?value=" +
		    	        searchInput.value;
		    	    }
		    	  });
		    	});
	</script>

</body>