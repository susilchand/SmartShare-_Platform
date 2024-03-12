

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.FavoriteDAO"%>
<%@page import="model.Database"%>
<%@page import="java.sql.Date"%>
<%@page import="java.security.Timestamp"%>
<%@page import="model.PostDao"%>
<%@page import="model.Post"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="assets/img/p_logo.png">
<title>Personal Profile</title>
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
<link rel="stylesheet" href="assets/css/profile.css">
<style>
.nav-width {
	width: 100%;
}

.category-bar-container {
	margin: 0 auto;
	position: relative;
	width: 100%;
	overflow: hidden;
	border-bottom: 1px solid rgb(221, 212, 212);
	top: -25px;
}

.category-bar {
	display: flex;
	gap: 20px;
}

.category-item {
	padding-top: 20px;
	padding-bottom: 5px;
	cursor: pointer;
}

.profile-pic-div {
	text-align: center;
	display: flex;
	/* Use flexbox */
	flex-direction: column;
	/* Stack items vertically */
	align-items: center;
	/* Center items horizontally */
}

.profile-pic-di {
	text-align: center;
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

#viewPhoto {
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

.dropdown {
	position: relative;
	display: inline-block;
}

.drop {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	border-radius: 10%;
	padding: 20px;
	right: -20px;
	bottom: -95px;
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

.drop-content {
	border-radius: 10%;
	padding: 20px;
	display: none;
	position: fixed;
	top: -70px;
	left: 50%;
	transform: translate(-50%, 50%);
	width: 400px;
	height: auto;
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

.drop-content a {
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

.drop-trigger {
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

.userAdmin {
	display: flex;
	gap: 13px;
	align-items: center;
	text-align: center;
	margin: auto;
	margin-top: 30px;
}

.userAdmin a {
	text-decoration: none;
	align-items: center;
	text-align: center;
	border: none;
	margin: auto;
	padding: 2px 10px;
	color: black;
}
#bookmarkIcon{

margin-top:35px;
}
.fav_red {
	color: red;
}

.fav_ {
	color: black;
}

.form-width {
	display: flex;
	gap: 50px;
	margin: 10px 0;
}

.form-width input[type=text] {
	margin-left: 23px;
}

.form-width textarea {
	margin-left: 40px;
	width: 206px;
	height: 100px;
}

#form input[type=submit] {
	margin-top: 20px;
}
.form-control {
	height: 35px;
	width: 200px;
	align-item: center;
}
.fav_red {
	color: red;
	font-size:25px;
	margin-right:25px;
}

.fav_ {
	color: black;
}
</style>
</head>

<body style="height: 100%;">
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
			HttpSession session5 = request.getSession();
			Integer mainuserId = (Integer) session5.getAttribute("userId");
			String imgUrls = (String) session5.getAttribute("imgUrl");
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
									class="profile__" src="<%=imgUrls%>" alt="profile"></a>
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





	<div class="main-container" style="height: 100%;">
		<!--Start Left Section
================================================== -->
		<section class="left-sec">


			<div
				style="position: fixed; width: 56%; background: #ffffff; top: 68px; height: 150px;">
				<div>
					<%
					HttpSession session3 = request.getSession();
					String username = (String) session.getAttribute("username");

					String bio = (String) session.getAttribute("bio");
					String imgUrl = (String) session.getAttribute("imgUrl");
					String password = (String) session3.getAttribute("password");
					String email = (String) session3.getAttribute("email");
					%>




					<div class="trend" id="Greetings"
						style="font-size: 40px; padding-top: 20px; border: none;"></div>
				</div>
				<script>
    var myDate = new Date();
    var hrs = myDate.getHours();

    var greets;

    if (hrs < 12)
        greets = 'Good Morning';
    else if (hrs >= 12 && hrs <= 14)
        greets = 'Good Afternoon';
    else if (hrs >= 14 && hrs <= 24)
        greets = 'Good Evening';
    document.getElementById('Greetings').innerHTML = greets+ " , " + "<%=username%>" ;
</script>
				<div class="category-bar-container">


					<div class="category-bar-wrapper">
						<div class="category-bar">
							<a href="#" class="category-item" id="home" onclick="showContent('home-content', 'home')">Home</a>
<a href="#" class="category-item" id="saved" onclick="showContent('saved-content', 'saved')">Saved</a>

							
						</div>
					</div>

				</div>
			</div>

			<div style="margin-top: 160px;">
				<div id="home-content" class="content-section">
					<%
					try {

						HttpSession session2 = request.getSession();
						int userId = (Integer) session2.getAttribute("userId");

						List<model.Post> posts = PostDao.getStoriesByUserIds(userId);

						if (posts != null) {

							for (model.Post post : posts) {
						String postContent_ = post.getContent();
						postContent_ = postContent_.replaceAll("\"", "\\\\\"").replaceAll("\n", "");
					%>
					<!-- begin post -->
					<div class="post-flex">
						<!-- Your existing HTML code here -->

						<div>
							<a href="PostDetails.jsp?postId=<%=post.getStoryId()%>"> <img class="post-img"
								src="<%=post.getPostImgUrl()%>" alt="post-img">
								
							</a>
						</div>
						<div>
							<div class="all-one-post">
								<h2>
									<a href="PostDetails.jsp?postId=<%=post.getStoryId()%>" class="post-title"> <%=post.getTitle()%>
									</a>
								</h2>

								<div class="post-des" id="postDescription">
									<%=post.getContent()%>
								</div>

								<div class="fav-pic-flex">
									<div class="profile-pic-flex">
										<div>
											<a href="userProfile.jsp?userId=<%=post.getUserId()%>"><img class="profile-img"
												src="<%=post.getAvatarImg()%>"></a>
										</div>
										<div>
											<a href="userProfile.jsp?userId=<%=post.getUserId()%>"><%=post.getName()%></a><br>

											<%
											String visibility = post.getVisibility();

											if (visibility.equalsIgnoreCase("public")) {
											%>
											<i class="fa-solid fa-earth-americas"
												style="color: rgb(174, 164, 164);"></i>

											<%
											} else if (visibility.equalsIgnoreCase("private")) {
											%>

											<i style="color: rgb(174, 164, 164);"
												class="fa-solid fa-lock"></i>
											<%
											}
											%>

											<span class="timestamp"><%=post.getCreatedAt()%></span> <span
												class="minRead"><%=post.getContent()%></span>
										</div>
									</div>
									<div class="userAdmin">
										<a href="updatePost.jsp?post_id=<%=post.getStoryId()%>"><input
											type="submit" value="Update"></a>
										<form action="DeleteServlet" method="post">
											<input type="hidden" name="postId"
												value="<%=post.getStoryId()%>"> <input type="submit"
												value="Delete">
										</form>

									</div>
									<div>
										<%
											
												FavoriteDAO favoriteDAO = new FavoriteDAO(); // Create an instance of FavoriteDAO
												boolean isFavoritedd = favoriteDAO.checkIfPostIsFavorited(userId, post.getStoryId());
											%>
											<form action="FavoriteServlet" method="post">
												<input type="hidden" name="postId"
													value="<%=post.getStoryId()%>"> <input
													type="hidden" name="userId" value="<%=userId%>">
													 <input
													type="hidden" name="currentPage" value="home">
													 
												<!-- Use inline style to change the color of the icon based on the favorited status -->
												<button type="submit"
													style="background: white; border: none;">
													<!-- Use inline conditional to change the class of the icon -->
													<i id="bookmarkIcon"
														class="far fa-bookmark <%=isFavoritedd ? "fav_red" : "fav_"%>"></i>
												</button>
											</form>
										
									</div>
								</div>
							</div>
						</div>
						</a>
					</div>
					<%
					}
					} else {
					%>

					<p>You have not created any post yet!</p>
					<%
					}
					%>



				</div>

				<div id="saved-content" class="content-section"
					style="display: none;">

					<%
					try {
						HttpSession session4 = request.getSession();
						Integer userId3 = (Integer) session4.getAttribute("userId");

						List<model.Post> saveData = PostDao.getSavedPosts(userId3);
						for (model.Post post : saveData) {
							String postContent_ = post.getContent();
							postContent_ = postContent_.replaceAll("\"", "\\\\\"").replaceAll("\n", "");
					%>

					<div class="cat_content_">


						<div class="post-flex">
							<!-- Your existing HTML code here -->
							<a href="PostDetails.jsp?postId=<%=post.getStoryId()%>">
								<div>
									<a href="PostDetails.jsp?postId=<%=post.getStoryId()%>"> <img class="post-img"
										src="<%=post.getPostImgUrl()%>" alt="post-img">
										
									</a>
								</div>
								<div>
									<div class="all-one-post">
										<h2>
											<a href="PostDetails.jsp?postId=<%=post.getStoryId()%>" class="post-title"> <%=post.getTitle()%>
											</a>
										</h2>

										<div class="post-des" id="postDescription">
											<%=post.getContent()%>
										</div>

										<div class="fav-pic-flex">
											<div class="profile-pic-flex">
												<div>
													<a href="userProfile.jsp?userId=<%=post.getUserId()%>"><img class="profile-img"
														src="<%=post.getAvatarImg()%>"></a>
												</div>
												<div>
													<a href="userProfile.jsp?userId=<%=post.getUserId()%>"><%=post.getName()%></a><br> <span
														class="timestamp"><%=post.getCreatedAt()%></span> <span
														class="minRead"><%=post.getContent()%></span>
												</div>
											</div>
											<div>
												<%
												if (userId3 != null) {
													FavoriteDAO favoriteDAO = new FavoriteDAO(); // Create an instance of FavoriteDAO
													boolean isFavoritedd = favoriteDAO.checkIfPostIsFavorited(userId, post.getStoryId());
												%>
												<form action="FavoriteServlet" method="post">
													<input type="hidden" name="postId"
														value="<%=post.getStoryId()%>"> <input
														type="hidden" name="userId" value="<%=userId%>">
														 <input
													type="hidden" name="currentPage" value="saved">
													<!-- Use inline style to change the color of the icon based on the favorited status -->
													<button type="submit"
														style="background: white; border: none;">
														<!-- Use inline conditional to change the class of the icon -->
														<i id="bookmarkIcon"
															class="far fa-bookmark <%=isFavoritedd ? "fav_red" : "fav_"%>"></i>
													</button>
												</form>
												<%
												} else {
												%>
												<a href="login.jsp" style="background: white; border: none;">
													<i id="bookmarkIcon" class="far fa-bookmark fav_"></i>
												</a>
												<%
												}
												%>

											</div>
										</div>
									</div>
								</div>
							</a>
						</div>

					</div>


					<%
					}

					} catch (Exception e) {
					e.printStackTrace();
					out.print("<h3>Failed to fetch  Posts from the database</h3>" + e.getMessage());
					}
					%>


				</div>

				



			</div>



		</section>
		<!--End Left Section
================================================== -->

		<!-- Began Right Section
================================================== -->

		<section class="right-sec">

			<div class="right-container" style="margin-top: 50px; margin-left:110px;">

				<div class="drop profile-pic-di">
					<button class="drop-trigger" onclick="togglDropdown(event)">
						<a class="nav-link profile-link" href="#"><img
							src="<%=imgUrl%>" id="viewPhoto"></a>
					</button>
					<p><%=username%></p>
					<p name="" id="" cols="30" rows="10"><%=bio%></p>
					<div class="drop-content" id="dropContent">
						<div id="sign-up-form">
							<form id="form" action="UpdateProfile" method="POST"
								enctype="multipart/form-data">

								<div class="profile-pic-div">
									<img src="<%=imgUrl%>" id="previewPhoto"> <input
										type="file" id="file" name="photo" accept="image/*"> <label
										for="file" id="uploadBtn">Update Photo</label>
								</div>

								<div class="form-width">
									<label for="username">Name:</label> <input type="text"
										name="username" id="username" value="<%=username%>">
								</div>
						
								<div class="form-width">
									<label for="password">Password:</label> <input type="password"
										name="password" id="password" value="<%=password%>">
								</div>

								<div class="form-width">
									<label for="bio">Bio:</label>
									<textarea name="bio" id="bio"><%=bio%></textarea>
								</div>

								<input type="submit" value="Update">



							</form>
						</div>

					</div>
				</div>


			</div>
			<%
			} catch (Exception e) {
			e.printStackTrace();
			out.print("<h3>Failed to fetch data from the database</h3>" + e.getMessage());
			}
			%>
			<!-- Start Footer
================================================== -->
			<div class="footer"
				style="position: absolute; bottom: 0; border: none;">

				<div class="clearfix">
					<a href="">Help</a> <a href="">About</a> <a href="">Careers</a> <a
						href="">Blog</a> <a href="">Privacy</a> <a href="">Terms</a>
				</div>
			</div>
			<!-- End Footer
================================================== -->
		</section>

		<!-- End Right Section
================================================== -->
	</div>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var urlParams = new URLSearchParams(window.location.search);
        var typeParam = urlParams.get('type');
        
        if (typeParam === 'saved') {
            showContent('saved-content', 'saved');
        } else {
            // By default, show home content
            showContent('home-content', 'home');
        }
    });

    function showContent(id, type) {
        event.preventDefault(); // Prevent the default behavior of the event
        var contents = document.querySelectorAll('.content-section');
        for (var i = 0; i < contents.length; i++) {
            contents[i].style.display = 'none';
        }
        var categoryButton = document.getElementById(id);
        categoryButton.style.display = 'block';

        // Update the URL
        window.history.pushState(null, '', 'profile.jsp?type=' + type);
    }
</script>

	<script>
    // Get all elements with class name "post-des"
    const postDesElements = document.querySelectorAll('.post-des');

    // Loop through each element
    postDesElements.forEach(postDes => {
        // Get the content of the current element
        const content = postDes.textContent.trim(); // Trim whitespace
        console.log("o");
        // Check if content is not empty
        if (content) {
            // Split the content into words
            const words = content.split(/\s+/); // Split by whitespace

            // Select the first 24 words or all words if less than 24
            const shortContent = words.slice(0, 24).join(' ');

            // Update the content of the element with the first 24 words
            postDes.innerHTML = shortContent + (words.length > 24 ? '...' : ''); // Add '...' if needed
        }
    });
    
 // Get all elements with class name "timestamp"
    const timestampElements = document.querySelectorAll('.timestamp');

    // Loop through each element
    timestampElements.forEach(timestampElement => {
        // Get the input date and time string from the inner text of the timestamp element
        var inputDateTimeString = timestampElement.innerText;

        // Parse the input date and time string into a Date object
        var inputDateTime = new Date(inputDateTimeString);

        // Get the current timestamp in milliseconds
        var currentTimestamp = Date.now();

        // Calculate the difference in milliseconds between the current date and time and the input date and time
        var timeDifference = currentTimestamp - inputDateTime.getTime();

        // Calculate the difference in seconds, minutes, hours, and days
        var secondsDifference = Math.floor(timeDifference / 1000);
        var minutesDifference = Math.floor(secondsDifference / 60);
        var hoursDifference = Math.floor(minutesDifference / 60);
        var daysDifference = Math.floor(hoursDifference / 24);

        // Define strings for different time units
        var relativeTimeString;
        console.log("g");
        if (daysDifference > 5) {
            // Format the input date and time in "month day, year" format
            var monthNames = ["January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"
            ];
            var month = monthNames[inputDateTime.getMonth()];
            var day = inputDateTime.getDate();
            var year = inputDateTime.getFullYear();
            relativeTimeString = month + ' ' + day + ', ' + year;
        } else if (daysDifference > 0) {
            relativeTimeString = daysDifference + " days ago";
        } else if (hoursDifference > 0) {
            relativeTimeString = hoursDifference + " hours ago";
        } else if (minutesDifference > 0) {
            relativeTimeString = minutesDifference + " minutes ago";
        } else {
            relativeTimeString = secondsDifference + " seconds ago";
        }
    
        // Update the inner HTML of the timestamp element with the calculated relative time string
        timestampElement.innerHTML = relativeTimeString;
    });
    

 // Get all elements with class name "minRead"
 const minReadElements = document.querySelectorAll('.minRead');

 // Loop through each element
 minReadElements.forEach(minReadElement => {
     // Get the content of the current element
     const content = minReadElement.innerText.trim(); // Trim whitespace

     // Calculate the estimated reading time
     const wordsPerMinute = 100; // Average reading speed (adjust as needed)
     const wordCount = content.split(/\s+/).length; // Split content by whitespace to count words
     const readingTimeMinutes = Math.ceil(wordCount / wordsPerMinute);
console.log(readingTimeMinutes);
     // Update the inner HTML of the minRead element with the calculated reading time
     minReadElement.innerHTML = readingTimeMinutes +" min read";
 });
 function getShortDescription(postContent) {
     // Split the content into an array of words
     const words = postContent.split(' ');

     // Get the first 30 words or less if the content is shorter than 30 words
     const shortDescription = words.slice(0, 30).join(' ');

     return shortDescription;
 }
 
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