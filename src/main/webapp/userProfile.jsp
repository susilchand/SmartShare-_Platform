<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.FavoriteDAO"%>
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
<title>UserProfile</title>
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
	line-height: 15px;
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
.form-control {
	height: 35px;
	width: 200px;
	align-item: center;
}
.nav-width{
width:100%;
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



	<%
			
			HttpSession session6= request.getSession();
			Integer userIdss = Integer.parseInt(request.getParameter("userId"));
			if(userIdss!=null){
				Post posts = PostDao.userProfileInfo(userIdss);
			
			
			%>



	<div class="main-container" style="height: 100%;">
		<!--Start Left Section
================================================== -->
		<section class="left-sec">
		
			<div
				style="position: fixed; width: 56%; background: #ffffff; top: 68px; height: 150px;">
				<div>
					<h2 class="trend"
						style="font-size: 50px; padding-top: 40px; border: none;"><%= posts.getName() %></h2>
				</div>
				<div class="category-bar-container">


					<div class="category-bar-wrapper">
						<div class="category-bar">
							<div class="category-item">Home</div>


						</div>
					</div>

				</div>
			</div>

			<div style="margin-top: 160px;">
				<div id="home-content" class="content-section">
					<%
					try {

						HttpSession session10 = request.getSession();
						Integer userId = (Integer) session10.getAttribute("userId");
						Integer userIds = Integer.parseInt(request.getParameter("userId"));
						List<model.Post> postss = PostDao.getStoriesByOtherUserId(userIds);

						if (posts != null) {

							for (model.Post post : postss) {
						String postContent_ = post.getContent();
						postContent_ = postContent_.replaceAll("\"", "\\\\\"").replaceAll("\n", "");
					%>

					<div class="post-flex">

						<%
						session2.setAttribute("imgUrls", post.getAvatarImg());
						session2.setAttribute("usersName", post.getName());
						session2.setAttribute("bios", post.getBio());
						System.out.print("aaa" + post.getBio());
						%>
						<a href="PostDetails.jsp?postId=<%=post.getStoryId()%>">
							<div>
								<a href="PostDetails.jsp?postId=<%=post.getStoryId()%>"> <img
									class="post-img" src="<%=post.getPostImgUrl()%>" alt="post-img">
								</a>
							</div>
							<div>
								<div class="all-one-post">
									<h2>
										<a href="PostDetails.jsp?postId=<%=post.getStoryId()%>"
											class="post-title"> <%=post.getTitle()%>
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

										<%
										if (userId != null) {
											FavoriteDAO favoriteDAO = new FavoriteDAO();
											boolean isFavoritedd = favoriteDAO.checkIfPostIsFavorited(userId, post.getStoryId());
										%>
										<form action="FavoriteServlet" method="post">
											<input type="hidden" name="postId"
												value="<%=post.getStoryId()%>"> <input type="hidden"
												name="userId" value="<%=userId%>">
												<input type="hidden"
												name="userIds" value="<%=userIds%>">
												<input type="hidden"
												name="currentPage" value="userProfile.jsp">

											<button type="submit"
												style="background: white; border: none;">

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


				<%
				} catch (Exception e) {
				e.printStackTrace();
				out.print("<h3>Failed to fetch  Posts from the database</h3>" + e.getMessage());
				}
				%>



			</div>



		</section>
		
		<!--End Left Section
================================================== -->

		<!-- Began Right Section
================================================== -->
		<section class="right-sec">

			<div class="right-container"
				style="margin-top: 50px; margin-left: 110px;">


				<div class="profile-pic-div">
					<img src="<%=posts.getAvatarImg() %>" id="previewPhoto"> <input type="file"
						id="file" name="photo" accept="image/*">
					<p><%=posts.getName() %></p>

					<p name="bio" id="bio" cols="30" rows="10"><%=posts.getBio() %></p>

				</div>

			</div>
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
	<%} %>
	<script>
        // Function to show content based on clicked navigation item
        function showContent(contentId) {
            // Hide all content sections
            var contentSections = document.querySelectorAll('.content-section');
            contentSections.forEach(function (section) {
                section.style.display = 'none';
            });

            // Show the selected content section
            var selectedContent = document.getElementById(contentId);
            selectedContent.style.display = 'block';
        }

        // Add click event listeners to navigation items
        document.addEventListener('DOMContentLoaded', function () {
            document.getElementById('home').addEventListener('click',
                function () {
                    showContent('home-content');
                });

            document.getElementById('saved').addEventListener('click',
                function () {
                    showContent('saved-content');
                });

            document.getElementById('about').addEventListener('click',
                function () {
                    showContent('about-content');
                });
        });
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
            minReadElement.innerHTML = readingTimeMinutes + " min read";
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