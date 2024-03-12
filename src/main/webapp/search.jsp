<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.security.Timestamp"%>
<%@page import="model.PostDao"%>
<%@page import="model.UserDao"%>
<%@page import="model.Post"%>
<%@ page import="java.util.List"%>
<%@page import="model.FavoriteDAO"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search</title>
<link rel="icon" href="assets/img/p_logo.png">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/profile.css">
<link rel="stylesheet" href="assets/css/mediumish.css">
<style>
.fav_red {
	color: red;
	font-size:25px;
	margin-right:25px;
}

.fav_ {
	color: black;
}

 .category-bar .category-item {
        cursor: pointer;
        padding: 5px 10px;

    }

    .category-bar .category-item.active {
        background-color: gray;
        color: #fff;
    }
    .nav-width{
    width:100%;
    }
    #searchInput{
    
    width:210px;}
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


<div style="max-width:75%; margin: 0 auto; margin-top:50px;">

	<div class="category-bar-container">


		<div class="category-bar-wrapper">
			<div class="category-bar">
				<div class="category-item active" id="home">Post</div>
				<div class="category-item" id="saved">User</div>
				<div class="category-item" id="about">Category</div>
			</div>
		</div>

	</div>
	

	<div style="margin-top: 10px;">
		<div id="home-content" class="content-section">

			<%
			
			
			String searchValue = request.getParameter("value").trim();
			session.setAttribute("searchValue", searchValue);
			try {

				List<model.Post> searchData = PostDao.searchByTitle(searchValue);
				if (searchData != null && !searchData.isEmpty()) {
				for (model.Post post : searchData) {
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
											<a href="author.html"><img class="profile-img"
												src="<%=post.getAvatarImg()%>"></a>
										</div>
										<div>
											<a href=""><%=post.getName()%></a><br> <span
												class="timestamp"><%=post.getCreatedAt()%></span> <span
												class="minRead"><%=post.getContent()%></span>
										</div>
									</div>
										<div>
												<%
											Integer userId = (Integer)session.getAttribute("userId");
												if (userId != null) {
													FavoriteDAO favoriteDAO = new FavoriteDAO(); // Create an instance of FavoriteDAO
													boolean isFavoritedd = favoriteDAO.checkIfPostIsFavorited(userId, post.getStoryId());
												%>
												<form action="FavoriteServlet" method="post">
													<input type="hidden" name="postId"
														value="<%=post.getStoryId()%>"> <input
														type="hidden" name="userId" value="<%=userId%>"> <input
														type="hidden" name="currentPage" value="search.jsp">
														
														<input
														type="hidden" name="searchValue" value="<%=searchValue %>">
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

			} else {
			%>
			<p>No Posts found with the specified keywords.</p>
			<%
			}

			} catch (Exception e) {
			e.printStackTrace();
			out.print("<h3>Failed to fetch Love stories from the database</h3>" + e.getMessage());
			}
			%>




		</div>

		<div id="saved-content" class="content-section" style="display: none;">
			<div class="fav-pic-flex"
				style="display: flex; flex-direction: column;">

				<%
				try {

					List<model.User> searchData = UserDao.searchByUserName(searchValue);
				
					if (searchData != null && !searchData.isEmpty()) {
					for (model.User user : searchData) {
				%>

				<div class="profile-pic-flex">
					<div>
						 <a href="userProfile.jsp?userId=<%=user.getId()%>"><img class="profile-img"
							src="<%=user.getAvatarImg()%>"></a>
					</div>
					<div>
						<a href="userProfile.jsp?userId=<%=user.getId()%>"> <%=user.getName()%>
						</a><br> <span class="hidden-email" style="display: none;"> <%=user.getEmail()%>
						</span>
						<p class="emails"></p>
					</div>
				</div>

				<%
			}

			} else {
			%>
			<p>No users found with the specified username.</p>
			<%
			}
				} catch (Exception e) {
				e.printStackTrace();
				out.print("<h3>Failed to fetch Love stories from the database</h3>" + e.getMessage());
				}
				%>

			</div>
		</div>

		<div id="about-content" class="content-section" style="display: none;">


			<%
			try {

				List<model.Post> searchData = PostDao.searchByCategory(searchValue);
				
				if (searchData != null && !searchData.isEmpty()) {
					for (model.Post post : searchData) {

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
											Integer userId = (Integer)session.getAttribute("userId");
												if (userId != null) {
													FavoriteDAO favoriteDAO = new FavoriteDAO(); // Create an instance of FavoriteDAO
													boolean isFavoritedd = favoriteDAO.checkIfPostIsFavorited(userId, post.getStoryId());
												%>
												<form action="FavoriteServlet" method="post">
													<input type="hidden" name="postId"
														value="<%=post.getStoryId()%>"> <input
														type="hidden" name="userId" value="<%=userId%>"> 
														<input
														type="hidden" name="searchValue" value="<%=searchValue %>">
														<input
														type="hidden" name="currentPage" value="search.jsp">
														
														<input
														type="hidden" name="searchValue" value="<%=searchValue %>">
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

			} else {
			%>
			<p>No Category found with the specified keywords.</p>
			<%
			}

			} catch (Exception e) {
			e.printStackTrace();
			out.print("<h3>Failed to fetch Love stories from the database</h3>" + e.getMessage());
			}
			%>



		</div>



	</div>
</div>
	
<script>
		function obfuscateEmail(email) {
			const parts = email.split('@');
			const localPart = parts[0];
			const domainPart = '@' + parts[1];
			const visiblePart = localPart.substring(0, 2);
			const obfuscatedLocalPart = '.'.repeat(7); // Always display 7 dots
			return visiblePart + obfuscatedLocalPart + domainPart;
		}
		
		// Get all elements with the class 'hidden-email'
		const hiddenEmailElements = document.querySelectorAll('.hidden-email');
		
		// Loop through each hidden email element and obfuscate the email addresses
		hiddenEmailElements.forEach(hiddenEmailElement => {
			const originalEmail = hiddenEmailElement.textContent;
			const obfuscatedEmail = obfuscateEmail(originalEmail);
		
			// Get the corresponding 'emails' element and set its text content to the obfuscated email address
			const emailsElement = hiddenEmailElement.nextElementSibling;
			emailsElement.textContent = obfuscatedEmail;
		});
		</script>
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
<script>
    document.addEventListener('DOMContentLoaded', function (idd) {
    	
        // Get all category items
        const categoryItems = document.querySelectorAll('.category-item');

        // Add click event listeners to each category item
        categoryItems.forEach(function (item) {
        
            item.addEventListener('click', function () {
                // Remove 'active' class from all items
                categoryItems.forEach(function (el) {
                    el.classList.remove('active');
                });

                // Add 'active' class to the clicked item
                item.classList.add('active');
            });
        });
    });
</script>

    
	<script src="https://kit.fontawesome.com/b18399b997.js"
		crossorigin="anonymous"></script>
</body>

</html>