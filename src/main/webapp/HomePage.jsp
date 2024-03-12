<%@page import="model.FavoriteDAO"%>
<%@page import="java.security.Timestamp"%>
<%@page import="model.PostDao"%>
<%@page import="model.Post"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="assets/img/p_logo.png">
<title>HomePage</title>
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

.category-bar-container {
	margin: 0 auto;
	position: relative;
	width: 100%;
	overflow: hidden;
	border-bottom: 1px solid rgb(221, 212, 212);
}

.category-bar-wrapper {
	padding: 0 50px;
	overflow-x: hidden;
	white-space: nowrap;
}

.category-bar {
	display: inline-flex;
	padding: 10px 0;
}

.category-item {
	padding: 10px 20px;
	margin-right: 10px;
	cursor: pointer;
	white-space: nowrap;
}

.category-item:hover {
	background-color: #ddd;
}

.arrow {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	width: 50px;
	height: 50px;
	background: #ffffff;
	color: #000000;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	opacity: 1;
	transition: opacity 0.3s ease-in-out;
}

.dropdown-content {
	bottom: -131px;
}

.arrow.left {
	left: 0;
}

.arrow.right {
	right: 0;
}

.hidden {
	opacity: 0;
}

#foryou {
	display: block;
}

#psychology {
	display: none;
}

#food {
	display: none;
}

#business {
	display: none;
}

#programming {
	display: none;
}

#education {
	display: none;
}

#health {
	display: none;
}

#media {
	display: none;
}

.fav_red {
	color: red;
	font-size: 25px;
	margin-right: 25px;
}

.fav_ {
	color: black;
}

body {
	padding-top: 5rem;
}

.mainheading {
	padding: 1rem 0rem;
}

a {
	color: #00ab6b;
}

a, a:hover {
	transition: all 0.2s;
}

.mediumnavigation {
	background: rgba(255, 255, 255, .97);
	box-shadow: 0 2px 2px -2px rgba(0, 0, 0, .15);
}

section {
	margin-bottom: 20px;
}

.section-title h2 {
	border-bottom: 1px solid rgba(0, 0, 0, .15);
	margin-bottom: 25px;
	font-weight: 700;
	font-size: 1.4rem;
	margin-bottom: 27px;
}

.section-title span {
	border-bottom: 1px solid rgba(0, 0, 0, .44);
	display: inline-block;
	padding-bottom: 20px;
	margin-bottom: -1px;
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

.card-columns .card {
	margin-bottom: 20px;
}

.listfeaturedtag .wrapthumbnail {
	height: 258px;
	flex: 0 0 auto;
}

.listfeaturedtag .card {
	border: 1px solid rgba(0, 0, 0, .1);
	border-radius: 2px;
	height: 260px;
	padding-left: 0;
	margin-bottom: 15px;
}

.listfeaturedtag .thumbnail {
	background-size: cover;
	height: 100%;
	display: block;
	background-position: 38% 22% !important;
	background-origin: border-box !important;
	border-top-left-radius: 2px;
}

.listfeaturedtag .card-block {
	padding-left: 0;
}

.listfeaturedtag h2.card-title, .listrecent h2.card-title {
	font-size: 1.3rem;
	font-weight: 700;
	line-height: 1.25;
}

.listfeaturedtag h2.card-title a, .listrecent h2.card-title a {
	color: rgba(0, 0, 0, .8);
}

.listfeaturedtag h2.card-title a:hover, .listrecent h2.card-title a:hover
	{
	color: rgba(0, 0, 0, .6);
	text-decoration: none;
}

.listfeaturedtag h4.card-text, .listrecent h4.card-text {
	color: rgba(0, 0, 0, .44);
	font-size: 0.95rem;
	line-height: 1.4;
	font-weight: 400;
}

.listfeaturedtag .wrapfooter {
	position: absolute;
	bottom: 20px;
	font-size: 12px;
	display: block;
	width: 85%;
}

.listrecent .wrapfooter {
	font-size: 12px;
	margin-top: 30px;
}

.author-thumb {
	width: 40px;
	height: 40px;
	float: left;
	margin-right: 13px;
	border-radius: 100%;
}

.post-top-meta {
	margin-bottom: 2rem;
}

.post-top-meta .author-thumb {
	width: 72px;
	height: 72px;
}

.post-top-meta.authorpage .author-thumb {
	margin-top: 40px;
}

.post-top-meta span {
	font-size: 0.9rem;
	color: rgba(0, 0, 0, .44);
	display: inline-block;
}

.post-top-meta .author-description {
	margin-bottom: 5px;
	margin-top: 5px;
	font-size: 0.95rem;
}

.author-meta {
	flex: 1 1 auto;
	white-space: nowrap !important;
	text-overflow: ellipsis !important;
	overflow: hidden !important;
}

span.post-name, span.post-date, span.author-meta {
	display: inline-block;
}

span.post-date, span.post-read {
	color: rgba(0, 0, 0, .44);
}

span.post-read-more {
	align-items: center;
	display: inline-block;
	float: right;
	margin-top: 8px;
}

span.post-read-more a {
	color: rgba(0, 0, 0, .44);
}

span.post-name a, span.post-read-more a:hover {
	color: rgba(0, 0, 0, .8);
}

.dot:after {
	content: "·";
	margin-left: 3px;
	margin-right: 3px;
}

.mediumnavigation .form-control {
	background: #f2f4f2;
	font-size: 0.8rem;
	border-radius: 30px;
	overflow: hidden;
	border: 1px solid rgba(0, 0, 0, 0.04);
}

.mediumnavigation .form-inline {
	margin-left: 15px;
}

.mediumnavigation .form-inline .btn {
	margin-left: -50px;
	border: 0;
	border-radius: 30px;
	cursor: pointer;
}

.mediumnavigation .form-inline .btn:hover, .mediumnavigation .form-inline .btn:active
	{
	background: transparent;
	color: green;
}

.mediumnavigation .navbar-brand {
	font-weight: 500;
}

.mediumnavigation .dropdown-menu {
	border: 1px solid rgba(0, 0, 0, 0.08);
	margin: .5rem 0 0;
}

.mediumnavigation .nav-item, .dropdown-menu {
	font-size: 0.9rem;
}

.mediumnavigation .search-icon {
	margin-left: -40px;
	display: inline-block;
	margin-top: 3px;
	cursor: pointer;
}

.mediumnavigation .navbar-brand img {
	max-height: 30px;
	margin-right: 5px;
}

.mainheading h1.sitetitle {
	font-family: Righteous;
}

.mainheading h1.posttitle {
	font-weight: 700;
	margin-bottom: 1rem;
}

.footer {
	border-top: 1px solid rgba(0, 0, 0, .05) !important;
	padding-top: 15px;
	padding-bottom: 12px;
	font-size: 0.8rem;
	color: rgba(0, 0, 0, .44);
	margin-top: 50px;
	display: flex;
	margin-left: 50px;
	justify-content: space-between;
}

.link-dark {
	color: rgba(0, 0, 0, .8);
}

.article-post {
	font-family: Merriweather;
	font-size: 1.2rem;
	line-height: 1.8;
	color: rgba(0, 0, 0, .8);
}

blockquote {
	border-left: 4px solid #00ab6b;
	padding: 0 20px;
	font-style: italic;
	color: rgba(0, 0, 0, .5);
}

.article-post p, .article-post blockquote {
	margin: 0 0 1.5rem 0;
}

.featured-image {
	display: block;
	margin: 0px auto;
	margin-bottom: 1.5rem;
}

.share {
	text-align: center;
	margin-top: 20px;
}

.share p {
	margin-bottom: 10px;
	font-size: 0.95rem;
}

.share {
	display: none;
}

.share ul li {
	display: inline-block;
	margin-bottom: 5px;
}

.share ul {
	padding-left: 0;
	margin-left: 0;
}

.svgIcon {
	vertical-align: middle;
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

.share, .share a {
	color: rgba(0, 0, 0, .44);
	fill: rgba(0, 0, 0, .44);
}

.graybg {
	background-color: #fafafa;
	padding: 40px 0 46px;
	position: relative;
}

.listrelated .card {
	box-shadow: 0 1px 7px rgba(0, 0, 0, .05);
	border: 0;
}

.card {
	border-radius: 4px;
}

.card .img-thumb {
	border-top-right-radius: 4px;
	border-top-left-radius: 4px;
}

ul.tags {
	list-style: none;
	padding-left: 0;
	margin: 0 0 3rem 0;
}

ul.tags li {
	display: inline-block;
	font-size: 0.9rem;
}

ul.tags li a {
	background: rgba(0, 0, 0, .05);
	color: rgba(0, 0, 0, .6);
	border-radius: 3px;
	padding: 5px 10px;
}

ul.tags li a:hover {
	background: rgba(0, 0, 0, .07);
	text-decoration: none;
}

.margtop3rem {
	margin-top: 3rem;
}

.sep {
	height: 1px;
	width: 20px;
	background: #999;
	margin: 0px auto;
	margin-bottom: 1.2rem;
}

.btn.follow {
	border-color: #02B875;
	color: #1C9963;
	padding: 3px 10px;
	text-align: center;
	border-radius: 999em;
	font-size: 0.85rem;
	display: inline-block;
}

.btn.subscribe {
	background-color: #1C9963;
	border-color: #1C9963;
	color: rgba(255, 255, 255, 1);
	fill: rgba(255, 255, 255, 1);
	border-radius: 30px;
	font-size: 0.85rem;
	margin-left: 10px;
	font-weight: 600;
	text-transform: uppercase;
}

.post-top-meta .btn.follow {
	margin-left: 5px;
	margin-top: -4px;
}

.alertbar {
	box-shadow: 0 -3px 10px 0 rgba(0, 0, 0, .0785);
	position: fixed;
	bottom: 0;
	left: 0;
	background-color: #fff;
	width: 100%;
	padding: 14px 0;
	z-index: 1;
}

.form-control::-webkit-input-placeholder {
	color: rgba(0, 0, 0, .5);
}

.form-control:-moz-placeholder {
	color: rgba(0, 0, 0, .5);
}

.form-control::-moz-placeholder {
	color: rgba(0, 0, 0, .5);
}

.form-control:-ms-input-placeholder {
	color: rgba(0, 0, 0, .5);
}

.form-control::-ms-input-placeholder {
	color: rgba(0, 0, 0, .5);
}

.authorpage h1 {
	font-weight: 700;
	font-size: 30px;
}

.post-top-meta.authorpage .author-thumb {
	float: none;
}

.authorpage .author-description {
	font-size: 1rem;
	color: rgba(0, 0, 0, .6);
}

.post-top-meta.authorpage .btn.follow {
	padding: 7px 20px;
	margin-top: 10px;
	margin-left: 0;
	font-size: 0.9rem;
}

.graybg.authorpage {
	border-top: 1px solid #f0f0f0;
}

.authorpostbox {
	width: 760px;
	margin: 0px auto;
	margin-bottom: 1.5rem;
	max-width: 100%;
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
	/* font-weight: bold; */
	font-size: 90px;
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

.left-sec {
	overflow-y: auto;
	width: 70%;
	scrollbar-width: none;
	-ms-overflow-style: none;
	scrollbar-width: none;
}

.left-sec::-webkit-scrollbar {
	display: none;
}

.right-sec {
	width: 28%;
}

.post-flex {
	display: flex;
	border: 1px solid rgb(243, 239, 239);
	margin: 10px 0px;
}

.profile-img {
	border-radius: 50px;
	width: 50px;
	height: 50px;
}

.post-img {
	padding-right: 10px;
	width: 300px;
	height: 235px;
}

.fav-pic-flex {
	display: flex;
	justify-content: space-between;
}

.profile-pic-flex {
	display: flex;
	;
}

.profile-pic-flex div {
	margin: 10px;
	color: #6e7472;
}

.fav_ {
	color: #6e7472;
	font-size: 25px;
	margin-right: 30px;
	margin-top: 30px;
}

.post-des {
	color: #6e7472;
	font-size: 18px;
	line-height: 30px;
}

.all-one-post {
	display: flex;
	flex-direction: column;
	padding: 10px 10px;
}

.post-title {
	font-weight: bold;
	color: rgb(0, 0, 0);
	font-size: 25px;
}

.post-title:hover {
	color: rgb(0, 0, 0);
}

.trend {
	font-size: 20px;
	padding: 10px;
	border-bottom: 1px solid rgb(212, 207, 207);
	margin: 0px 10px 20px 0px;
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

.right-title {
	font-size: 18px;
	padding: 10px;
	margin: 0px 0px 20px 0px;
}

.category-button {
	display: flex;
	flex-wrap: wrap;
	padding: 8px 16px;
	/* box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1); */
	cursor: pointer;
}

.category-button button {
	padding: 3px 10px;
	margin: 10px;
	border: none;
	border-radius: 15px;
}

.form-control {
	height: 35px;
	width: 200px;
	align-item: center;
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

			<div class="collapse navbar-collapse" id="navbarsExampleDefault"
				style="align-items: center; height: 50px;">
				<!-- Begin Logo -->
				<img src="assets/img/p_logo.png" alt="logo" style='width: 130px;'>

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
			String useremail = (String) session2.getAttribute("email");
			if (mainuserId != null) {
			%>
			<div class="collapse navbar-collapse" id="navbarsExampleDefault">
				<!-- Begin Menu -->

				<ul class="navbar-nav ml-auto">
					<%
					if (useremail.equals("admin@gmail.com")) {
					%>
					<li class="nav-item"><a class="nav-link"
						style="color: rgb(23, 23, 23);" href="AdminForUser.jsp">Admin Panel</a></li>

					<%
					} else {
					%>
					<li class="nav-item"><a class="nav-link"
								style="color: rgb(23, 23, 23);" href="HomePage.jsp?category=foryou">Home</a></li>
					<%
					}
					%>
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
								style="color: rgb(23, 23, 23);" href="HomePage.jsp?category=foryou">Home</a></li>
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
				style="position: fixed; width: 56%; background: #ffffff; top: 68px;">
				<div class="category-bar-container">

					<div class="arrow left">&#10094;</div>
					<div class="category-bar-wrapper">
						<div class="category-bar">


							<a href="HomePage.jsp?category=foryou"
								onclick="showContent('foryou')" class="category-item">For
								you</a> <a href="HomePage.jsp?category=Psychology"
								onclick="showContent('psychology')" class="category-item">Psychology</a>
							<a href="HomePage.jsp?category=Business"
								onclick="showContent('business')" class="category-item">Business</a>
							<a href="HomePage.jsp?category=Food"
								onclick="showContent('food')" class="category-item">Food</a> <a
								href="HomePage.jsp?category=Programming"
								onclick="showContent('programming')" class="category-item">Programming</a>
							<a href="HomePage.jsp?category=Education"
								onclick="showContent('education')" class="category-item">Education</a>
							<a href="HomePage.jsp?category=Health"
								onclick="showContent('health')" class="category-item">Health</a>
							<a href="HomePage.jsp?category=Media"
								onclick="showContent('media')" class="category-item">Media</a>

						</div>
					</div>
					<div class="arrow right">&#10095;</div>
				</div>
			</div>

			<div style="margin-top: 100px;">

				<!-- begin post -->
				<%
				try {
					HttpSession session3 = request.getSession();
					Integer userId = (Integer) session3.getAttribute("userId");
					String category = request.getParameter("category");
					
					if (category == null || category.equals("foryou")) {
						List<model.Post> categoryData = PostDao.getAllPublicPostsRandomly();
						for (model.Post post : categoryData) {
					String postContent_ = post.getContent();
					postContent_ = postContent_.replaceAll("\"", "\\\\\"").replaceAll("\n", "");
				%>

				<div class="cat_content_" id="<%=category%>">

					<a href="PostDetails.jsp?postId=<%=post.getStoryId()%>">
						<div class="post-flex">
							<!-- Your existing HTML code here -->
							<a href="PostDetails.jsp?postId=<%=post.getStoryId()%>">
								<div>
									<a href="PostDetails.jsp?postId=<%=post.getStoryId()%>"> <img
										class="post-img" src="<%=post.getPostImgUrl()%>"
										alt="post-img">

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
														class="timestamp"><%=post.getCreatedAt()%> </span> <span
														class="minRead"><%=post.getContent()%></span>
												</div>
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
														type="hidden" name="userId" value="<%=userId%>"> <input
														type="hidden" name="currentCategory"
														value="<%=category%>">
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

				List<model.Post> categoryData = PostDao.getByCategory(category);
				for (model.Post post : categoryData) {
				String postContent_ = post.getContent();
				postContent_ = postContent_.replaceAll("\"", "\\\\\"").replaceAll("\n", "");
				%>

				<div class="cat_content_" id="<%=category%>">


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
											<%
											if (userId != null) {
												FavoriteDAO favoriteDAO = new FavoriteDAO(); // Create an instance of FavoriteDAO
												boolean isFavoritedd = favoriteDAO.checkIfPostIsFavorited(userId, post.getStoryId());
											%>
											<form action="FavoriteServlet" method="post">
												<input type="hidden" name="postId"
													value="<%=post.getStoryId()%>"> <input
													type="hidden" name="userId" value="<%=userId%>"> <input
													type="hidden" name="currentCategory" value="<%=category%>">
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
				}
				} catch (Exception e) {
				e.printStackTrace();
				out.print("<h3>Failed to fetch  Posts from the database</h3>" + e.getMessage());
				}
				%>
			
		</section>
		<!--End Left Section
================================================== -->

		<!-- Began Right Section
================================================== -->
		<section class="right-sec">

			<div class="right-container">
				<h5 class="right-title" style="margin-left: 25px;">Recommended
					People</h5>

				<div class="fav-pic-flex"
					style="display: flex; flex-direction: column; margin-left: 65px;">

					<%
					List<model.Post> mostLikeList = PostDao.mostLikeUser();
					for (model.Post post : mostLikeList) {
					%>


					<div class="profile-pic-flex">
						<%
						session2.setAttribute("imgUrls", post.getAvatarImg());
						session2.setAttribute("usersName", post.getName());
						session2.setAttribute("bios", post.getBio());
						%>
						<div>

							<a href="userProfile.jsp?userId=<%=post.getUserId()%>"><img
								class="profile-img" src="<%=post.getAvatarImg()%>"></a>
						</div>
						<div>
							<a href="userProfile.jsp?userId=<%=post.getUserId()%>"> <%=post.getName()%>
							</a><br>
							<!-- Hidden paragraph tag containing the original email address -->
							<p class="hidden-email" style="display: none;"><%=post.getEmail()%></p>

							<!-- Paragraph tag where the obfuscated email address will be displayed -->
							<p class="emails"></p>
						</div>
					</div>

					<%
					}
					%>



				</div>

				<div class="reading_seggestion"
					style="margin-left: 25px; margin-top: 20px; border: 1px solid rgb(232, 226, 226);">
					<h5 class="right-title">Reading list</h5>
					<p style="margin-left: 45px; font-weight: 500; color: #605e5e;">
						Click the<i id="bookmarkIcon" class="far fa-bookmark fav_"
							style="margin: 0 5px; margin-top: 2px;"></i> on any post to
						easily add it to your reading list
					</p>

				</div>
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
	<script>
		// Category

		const categoryBar = document.querySelector('.category-bar-wrapper');
    const scrollAmount = 120; // Change this value to adjust scroll amount
    const leftArrow = document.querySelector('.arrow.left');
    const rightArrow = document.querySelector('.arrow.right');

    document.querySelector('.arrow.left').addEventListener('click', () => {
        categoryBar.scrollLeft -= scrollAmount;
    });

    document.querySelector('.arrow.right').addEventListener('click', () => {
        categoryBar.scrollLeft += scrollAmount;
    });

    categoryBar.addEventListener('scroll', () => {
        const scrollLeft = categoryBar.scrollLeft;
        const scrollWidth = categoryBar.scrollWidth;
        const clientWidth = categoryBar.clientWidth;
        const isAtStart = scrollLeft === 0;
        const isAtEnd = scrollLeft + clientWidth >= scrollWidth - scrollAmount;

        leftArrow.classList.toggle('hidden', isAtStart);
        rightArrow.classList.toggle('hidden', isAtEnd);
    });
	
		function showContent(id) {id.preventDefault()
			var contents = document.querySelectorAll('.cat_content_');
			for (var i = 0; i < contents.length; i++) {
				contents[i].style.display = 'none';
			}
			var categoryButton=document.getElementById(id);
			categoryButton.style.display='block';
			
		}
		
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