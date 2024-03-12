<%@page import="java.security.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.PostDao"%>
<%@page import="model.Post"%>
<%@ page import="java.util.List"%>

<html lang="en" style="height: 100%;">
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="assets/img/p_logo.png">
<title>Index</title>
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
.viewpage {
	margin-top: -100px;
	height: 600px;
	background: rgb(255, 255, 255);
	max-width: 100%;
	padding: 200px 100px;
	border-bottom: 1px solid rgb(227, 222, 222);
}

.viewpage-content {
	text-align: center;
	align-items: center;
	margin-top: 80px;
	display: flex;
	flex-direction: column;
}

.viewpage-content h1 {
	font-size: 70px;
}

.viewpage-content p {
	font-size: 25px;
}

.viewpage-content button {
	height: 35px;
	font-size: 15px;
	width: 130px;
	border-radius: 20px;
	border: 1px solid rgb(153, 151, 151);
	color: white;
	background: #000;
}

.main-container {
	height: 100%;
	width: 80%;
	display: flex;
	margin: 0px auto;
	justify-content: space-between;
}

.trend {
	font-size: 20px;
	padding: 10px;
	border-bottom: none;
	margin: 0px 10px 20px 0px;
	width: 135px;
}

.fa-arrow-trend-up {
	font-size: 18px;
	margin-right: 5px;
	border: 2px solid #6e7472;;
	border-radius: 20px;
	padding-right: 5px;
	padding-top: 5px;
	color: #6e7472;
}
.nav-width{
width:100%;
}
.navbar-brand{
width:130px;
height:auto;



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
		class="navbar navbar-toggleable-md navbar-light bg-white fixed-top mediumnavigation">
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
			</div>

			<div class="collapse navbar-collapse" id="navbarsExampleDefault">
				<!-- Begin Menu -->

				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="login.jsp"><i class="far fa-pen-to-square write"></i>Write<span
							class="sr-only"></span></a></li>
					<li class="nav-item"><a class="nav-link"
						style="color: rgb(23, 23, 23);" href="OurStory.jsp">Our Story</a></li>
					<li class="nav-item">
						<div class="dropdown">
							<a class="dropdown-trigger" onclick="toggleDropdown(event)">
								<img class="profile__" src="assets/img/profile.webp"
									alt="profile">
							</a>
							<div class="dropdown-content" id="dropdownContent">
						
								<a class="signin" href="login.jsp">Sign In</a> <a class="signup"
									href="registration.jsp">Sign Up</a>
							</div>
						</div>
					</li>
				</ul>


				<!-- End Menu -->

			</div>
		</div>
	</nav>
	<!-- End Nav
================================================== -->

	<!-- Begin Site Title
================================================== -->

	<div class="viewpage">
		<div class="viewpage-content">
			<h1>Stay Curious</h1>
			<p>Discover stories, thinking, and expertise from writers on any
				topic.</p>
			<button>
				<a href="login.jsp" style="text-decoration: none; color: aliceblue;">Start
					Reading</a>
			</button>
		</div>
	</div>
	<!-- End Site Title
================================================== -->



	<div class="main-container">
		<!-- Start Left Section -->
		<section class="left-sec">
			<div>
				<h2 class="trend">
					<i class="fa-solid fa-arrow-trend-up"></i>Trending
				</h2>
			</div>


			<%
			try {
				List<model.Post> trend = PostDao.trendPosts();
				for (model.Post post : trend) {
					String postContent_ = post.getContent();
					postContent_ = postContent_.replaceAll("\"", "\\\\\"").replaceAll("\n", "");
			%>
			<!-- begin post -->
			<div class="post-flex">
				<!-- Your existing HTML code here -->
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
										<a href="userProfile.jsp?userId=<%=post.getUserId()%>"><img
											class="profile-img" src="<%=post.getAvatarImg()%>"></a>
									</div>
									<div>
										<a href="userProfile.jsp?userId=<%=post.getUserId()%>"><%=post.getName()%></a><br>
										<i class="fa-solid fa-earth-americas"
											style="color: rgb(174, 164, 164);"></i> <span
											class="timestamp"><%=post.getCreatedAt()%></span> <span
											class="minRead"><%=post.getContent()%></span>
									</div>
								</div>
								<div>
									<a href="login.jsp" title="Read Story"><i id="bookmarkIcon"
										class="far fa-bookmark fav_"></i></a>
								</div>
							</div>
						</div>
					</div>
				</a>
			</div>
			<!-- end post -->
			<%
			}
			} catch (Exception e) {
			e.printStackTrace();
			out.print("<h3>Failed to fetch Love stories from the database</h3>" + e.getMessage());
			}
			%>

		</section>
		<!-- End Left Section -->


		<section class="right-sec">

			<div class="right-container">
				<h5 class="right-title">Discover more of what matter to you</h5>

				<div class="category-button">
					<button class="category-label"
						onclick="redirectToCategory('Psychology')">Psychology</button>
					<button class="category-label" onclick="redirectToCategory('Food')">Food</button>
					<button class="category-label"
						onclick="redirectToCategory('Business')">Business</button>
					<button class="category-label"
						onclick="redirectToCategory('Programming')">Programming</button>
					<button class="category-label"
						onclick="redirectToCategory('Education')">Education</button>
					<button class="category-label"
						onclick="redirectToCategory('Health')">Health</button>
					<button class="category-label"
						onclick="redirectToCategory('Media')">Media</button>
				</div>

			<script>
    function redirectToCategory(category) {
        var baseUrl = window.location.origin + "/MediumPlatform/HomePage.jsp";
        var categoryParam = "category=" + encodeURIComponent(category);
        var url = baseUrl + (window.location.search ? window.location.search + '&' + categoryParam : '?' + categoryParam);
        window.location.href = url;
    }
</script>



			</div>
			<!-- Start Footer
	================================================== -->
			<div class="footer">

				<div class="clearfix">
					<a href="">Help</a> <a href="OurStory.jsp">About</a> <a href="">Careers</a>
					<a href="">Blog</a> <a href="">Privacy</a> <a href="">Terms</a>
				</div>
			</div>
			<!-- End Footer
	================================================== -->
		</section>

		<!-- End Right Section
	================================================== -->
	</div>




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
        timestampElement.innerHTML = relativeTimeString+" . ";
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
 

</script>

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
