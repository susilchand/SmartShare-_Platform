<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.LikeDAO"%>
<%@page import="model.FavoriteDAO"%>
<%@page import="model.Database"%>
<%@page import="java.sql.Date"%>
<%@page import="java.security.Timestamp"%>
<%@page import="model.PostDao"%>
<%@page import="model.Post"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="assets/img/p_logo.png">
<title>PostDetails</title>
<!-- Bootstrap core CSS -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<!-- Fonts -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Righteous%7CMerriweather:300,300i,400,400i,700,700i"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="assets/css/mediumish.css" rel="stylesheet">
<style>
/* CSS Styles */
.like-button {
	color: gray;
}

.like-button.liked {
	color: blue;
}
.fav_{
margin-top:0;
}
.nav-width {
	width: 100%;
}
#searchInput{
width:210px;
}
.svgIcon-use{
margin-top:5px;

}
.down-img{
width:100%;
height:250px;
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



	<div class="container" style="margin: 0 auto;">

		<!-- Begin Article
================================================== -->

		<%
		HttpSession session3 = request.getSession();
		Integer userId = (Integer) session3.getAttribute("userId");
		String postIdParameter = request.getParameter("postId");

		if (postIdParameter != null && !postIdParameter.isEmpty()) {
		    Integer onepostId = Integer.parseInt(postIdParameter);
		
		if(userId!=null){
			
			Post post = PostDao.getStoriesByUserId(userId, onepostId);
			String category= post.getCategory();
			session.setAttribute("categories3", category);
		if (post != null) {
		%>


		<div class="row" style="margin: 0 auto;">

			<!-- Begin Post -->
			<div class="col-md-8 col-md-offset-2 col-xs-12"
				style="margin: 0 auto;">
				<div class="mainheading">



					<h1 class="posttitle"><%=post.getTitle()%></h1>
					<!-- Begin Top Meta -->
					<div class="row post-top-meta">
						<div class="col-md-2">
							<a href="userProfile.jsp?userId=<%=post.getUserId()%>"><img class="author-thumb"
								src="<%=post.getAvatarImg()%>" alt="Sal"></a>
						</div>
						<div class="col-md-10">
							<a class="link-dark" href="userProfile.jsp?userId=<%=post.getUserId()%>"><%=post.getName()%></a> <br>
							<i class="fa-solid fa-earth-americas" style="color: rgb(174, 164, 164);"></i>
							<span
								class="post-date timestamp"><%=post.getCreatedAt()%></span> <span
													class="minRead"><%=post.getContent()%></span> 
						</div>
					</div>

					<!-- End Top Menta -->

					<div class="bar">
						<form action="LikeServlet" method="post">
							<input type="hidden" name="postId" value="<%=post.getStoryId()%>">
							<input type="hidden" name="userId" value="<%=userId%>">
							<%
							// Check if the user has already liked the post
							if (userId != null) {
								LikeDAO like = new LikeDAO(); // Create an instance of FavoriteDAO
								boolean isLiked = like.checkIfPostIsLiked(userId, post.getStoryId());
								String buttonClass = isLiked ? "like-button liked" : "like-button";
							%>
							<button type="submit" class="<%=buttonClass%>">
								<i class="far fa-thumbs-up"></i> Like
							</button>
							<%=post.getLikeCount()%>
						</form>
						<%
						} 
						%>
						<div class="s-bar">
							<%
							if (userId != null) {
								FavoriteDAO favoriteDAO = new FavoriteDAO(); // Create an instance of FavoriteDAO
								boolean isFavoritedd = favoriteDAO.checkIfPostIsFavorited(userId, post.getStoryId());
							%>
							<form action="FavoriteServlet" method="post">
								<input type="hidden" name="postId"
									value="<%=post.getStoryId()%>"> <input type="hidden"
									name="userId" value="<%=userId%>">
									<input type="hidden"
									name="currentPage" value="PostDetails.jsp">
								<!-- Use inline style to change the color of the icon based on the favorited status -->
								<button type="submit" style="background: white; border: none;">
									<!-- Use inline conditional to change the class of the icon -->
									<i id="bookmarkIcon"
										class="far fa-bookmark <%=isFavoritedd ? "fav_red" : "fav_"%>"></i>
								</button>
							</form>
							<%
							} %>

							
						</div>
					</div>


					<!-- Begin Featured Image -->
					<img class="featured-image img-fluid"
						src="<%=post.getPostImgUrl()%>" alt="">
					<!-- End Featured Image -->

					<!-- Begin Post Content -->
					<div class="article-post">
						<p>
							<%=post.getContent()%>
						</p>
						

					</div>
					<!-- End Post Content -->


				</div>
				<!-- End Post -->

			</div>

			<%
			} else {
			out.println("Error");
			}
		
			}else{
			
				Post posts = PostDao.getStoriesByUserIdNoUser(onepostId);
			String category= posts.getCategory();
			session.setAttribute("categories3", category);
				if (posts != null) {
			%>
			
			
			<div class="row" style="margin: 0 auto;">

				<!-- Begin Post -->
				<div class="col-md-8 col-md-offset-2 col-xs-12"
					style="margin: 0 auto;">
					<div class="mainheading">

						<h1 class="posttitle"><%=posts.getTitle()%></h1>
						<!-- Begin Top Meta -->
						<div class="row post-top-meta">
							<div class="col-md-2">
								<a href="userProfile.jsp?userId=<%=posts.getUserId()%>"><img class="author-thumb"
									src="<%=posts.getAvatarImg()%>" alt="Sal"></a>
							</div>
							<div class="col-md-10">
								<a class="link-dark" href="userProfile.jsp?userId=<%=posts.getUserId()%>"><%=posts.getName()%></a>
								<span class="post-date"><%=posts.getCreatedAt()%></span> <br>
								<span class="post-read"><%=posts.getBio()%></span>
							</div>
						</div>

						<!-- End Top Menta -->

						<div class="bar">
							
								 <a href="login.jsp"
									type="submit" class="like-button"> <i
									class="far fa-thumbs-up"></i> Like<%=posts.getLikeCount()%>
								</a>


							<div class="s-bar">


								<a href="login.jsp" style="background: white; border: none;">
									<i id="bookmarkIcon" class="far fa-bookmark fav_"></i>
								</a>



							</div>
						</div>


						<!-- Begin Featured Image -->
						<img class="featured-image img-fluid"
							src="<%=posts.getPostImgUrl()%>" alt="">
						<!-- End Featured Image -->

						<!-- Begin Post Content -->
						<div class="article-post">
							<p>
								<%=posts.getContent()%>
							</p>
							
						</div>
						<!-- End Post Content -->


					</div>
					<!-- End Post -->

				</div>
			
			
			<%}
			}
		
				} else {
				    
				    out.println("Error: postId parameter is missing or empty");
				} %>
			</div>
			<!-- End Article
================================================== -->

			<div class="hideshare"></div>

	<!--		
			<div class="graybg">
				<div class="container">
					<div class="row listrecent listrelated">
<%
try {
    String Category=(String)session.getAttribute("categories3");
    List<model.Post> categoryData = PostDao.getPostByCategory(Category);
    Integer postIdParam = Integer.parseInt(request.getParameter("postId")); // Get postId parameter from URL
    
    for (model.Post post : categoryData) {
    	
        Integer postId = (Integer) post.getStoryId();
        
        // Check if postId matches the postId parameter in the URL
        if (!postId.equals(postIdParam)) {
            String postContent_ = post.getContent();
            postContent_ = postContent_.replaceAll("\"", "\\\\\"").replaceAll("\n", "");
%>


<div class="col-md-4">
    <div class="card">
        <a href="PostDetails.jsp?postId=<%=post.getStoryId()%>"> <img class="img-fluid img-thumb down-img"
            src="<%=post.getPostImgUrl() %>" alt="">
        </a>
        <div class="card-block">
            <h2 class="card-title">
                <a href="PostDetails.jsp?postId=<%=post.getStoryId()%>"><%=post.getTitle() %></a>
            </h2>
            <div class="metafooter">
                <div class="wrapfooter" style="display:flex; gap:40px;">
                    <div>
                        <span class="meta-footer-thumb"> <a href="userProfile.jsp?userId=<%=post.getUserId()%>"><img
                                class="author-thumb" src="<%=post.getAvatarImg() %>"
                                alt="Sal"></a>
                        </span> <span class="author-meta"> <span class="post-name"><a
                                href="userProfile.jsp?userId=<%=post.getUserId()%>"><%=post.getName() %></a></span><br /> <span class="post-date timestamp"><%=post.getCreatedAt() %></span><span class="post-read minRead"><%=post.getContent() %> </span>
                        </span> 
                    </div>
                    <div>
                        <%
                        if (userId != null) {
                            FavoriteDAO favoriteDAO = new FavoriteDAO(); // Create an instance of FavoriteDAO
                            boolean isFavoritedd = favoriteDAO.checkIfPostIsFavorited(userId, post.getStoryId());
                        %>
                        <form action="FavoriteServlet" method="post">
                            <input type="hidden" name="postId"
                                value="<%=post.getStoryId()%>"> <input
                                type="hidden" name="userId" value="<%=userId%>">
                                <input
                                type="hidden" name="currentPage" value="PostDetails.jsp">
                            
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
        </div>
    </div>
</div>

<%
        }
    }
    
} catch (Exception e) {
    e.printStackTrace();
    out.print("<h3>Failed to fetch Posts from the database</h3>" + e.getMessage());
}
%>
</div></div>
		</div>	-->




			<!-- Begin Footer
================================================== -->
			<div class="container">
				<div class="footer">
					<p class="pull-left">Copyright &copy; 2024 Your Website Name</p>

					<div class="clearfix">
						<a href="">Help</a> <a href="">About</a> <a href="">Careers</a> <a
							href="">Blog</a> <a href="">Privacy</a> <a href="">Terms</a>
					</div>
				</div>
			</div>
			<!-- End Footer
================================================== -->


<script>
//Get all elements with class name "timestamp"
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

document.addEventListener("DOMContentLoaded", function () {
	  const searchInput = document.getElementById("searchInput");
	  searchInput.addEventListener("keypress",  function (event) {
	    if (event.key === "Enter") {
	    	
	    	
	      window.location.href =
	        "http://localhost:8080/MediumPlatform/search.jsp?value=" +
	        searchInput.value;
	    }
	    else{
	    	console.log("Not working");
	    }
	  });
	});
</script>
			<script src="https://kit.fontawesome.com/b18399b997.js"
				crossorigin="anonymous"></script>
			<!-- Bootstrap core JavaScript
================================================== -->
			<!-- Placed at the end of the document so the pages load faster -->
			<script src="assets/js/jquery.min.js"></script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
				integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
				crossorigin="anonymous"></script>
			<script src="assets/js/app.js"></script>
			<script src="assets/js/bootstrap.min.js"></script>
			<script src="assets/js/ie10-viewport-bug-workaround.js"></script>
			<script src="assets/js/mediumish.js"></script>
</body>

</html>