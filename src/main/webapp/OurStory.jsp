<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="assets/img/p_logo.png">
<title>About Us</title>
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
body {
	background: #222121;
}

main {
	margin: 0px 20px;
}

main p, h1, h2 {
	margin: 50px 0px;
}

main h1 {
	font-size: 80px;
}

main h2 {
	font-size: 40px;
}

main p {
	font-size: 20px;
}

.story-but {
	width: 100%;
	height: 150px;
	border: 1px solid rgb(186, 186, 186);
	color: white;
	background: #000;
	display: flex;
	justify-content: space-between;
	align-items: center;
	text-align: center;
	transition: 0.4s;
	border-left: none;
	border-right: none;
	padding: 0px 25px;
}

.story-but:hover {
	color: rgb(0, 0, 0);
	background: #ededed;
	border: none;
}

.story-but p, .fa-arrow-right {
	font-size: 40px;
}

.nav-width {
	width: 100%;
}
#searchInput{
width:210px;
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


	<main style="color: white; width: 50%;">
		<h1>Everyone has a story to tell.</h1>
		<p>SmartShare is a home for human stories and ideas. Here, anyone can
			share insightful perspectives, useful knowledge, and life wisdom with
			the world-without building a mailing list or a following first. The
			internet is noisy and chaotic; SmartShare is quiet yet full of insight.
			It's simple, beautiful, collaborative, and helps you find the right
			audience for whatever you have to say.</p>
		<p>We believe that what you read and write matters. Words can
			divide or empower us, inspire or discourage us. In a world where the
			most sensational and surface-level stories often win, we're building
			a system that rewards depth, nuance, and time well spent. A space for
			thoughtful conversation more than drive-by takes, and substance over
			packaging.</p>
		<h2>Ultimately, our goal is to deepen our collective
			understanding of the world through the power of writing.</h2>
		<p>Over 100 million people connect and share their wisdom on
			SmartShare every month. Many are professional writers, but just as many
			aren't-they're CEOs, computer scientists, U.S. presidents, amateur
			novelists, and anyone burning with a story they need to get out into
			the world. They write about what they're working on, what's keeping
			them up at night, what they've lived through, and what they've
			learned that the rest of us might want to know too.</p>
		<p>Instead of selling ads or selling your data, we're supported by
			a growing community of SmartShare members who align with our mission. If
			you're new here, start exploring. Dive deeper into whatever matters
			to you. Find a post that helps you learn something new, or reconsider
			something familiar-and then share your own story.</p>

	</main>

	<%
	Integer userId = (Integer) session.getAttribute("userId");
	if (userId != null) {
	%>
	<a href="HomePage.jsp" style="text-decoration: none;">
		<button class="story-but">
			<p>Start reading</p>
			<i class="fa-solid fa-arrow-right"></i>
		</button>
	</a>
	<a href="createPost.jsp" style="text-decoration: none;">
		<button class="story-but">
			<p>Start Writing</p>
			<i class="fa-solid fa-arrow-right"></i>
		</button>

	</a>

	<%
	} else {
	%>
	<a href="HomePage.jsp" style="text-decoration: none;">
		<button class="story-but">
			<p>Start reading</p>
			<i class="fa-solid fa-arrow-right"></i>
		</button>
	</a>
	<a href="login.jsp" style="text-decoration: none;">
		<button class="story-but">
			<p>Start Writing</p>
			<i class="fa-solid fa-arrow-right"></i>
		</button>

	</a>

	<%
	}
	%>
	<!-- Begin Footer
	================================================== -->
	<div class="footer"
		style="background: white; margin-left: 0px; padding-left: 15px; align-item: center;">
		<p class="pull-left">Copyright &copy; 2024 Your Website Name</p>

		<div class="clearfix">
			<a href="">Help</a> <a href="">About</a> <a href="">Careers</a> <a
				href="">Blog</a> <a href="">Privacy</a> <a href="">Terms</a>
		</div>
	</div>
	<!-- End Footer
================================================== -->

	</div>
	<!-- /.container -->
	
	<script>
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
	<script src="https://kit.fontawesome.com/b18399b997.js"
		crossorigin="anonymous"></script>
	<script src="assets/js/app.js"></script>
	<!-- Bootstrap core JavaScript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
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