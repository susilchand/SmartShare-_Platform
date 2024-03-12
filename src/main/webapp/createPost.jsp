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
<title>Create New Blog</title>
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

<style>
/* Add your CSS styles here */
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
}

.page-wrapper {
	background-color: #f0f0f0;
	padding-top: 100px;
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
	width: 100px;
	height: 30px;
	border-radius: 5px;
	border: 1px solid rgb(159, 152, 152);
}

button[type="submit"]:hover {
	background: rgb(164, 160, 160);
}

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
.card-footer{
border:none;
background-color:transparent;
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



	<div class="page-wrapper bg-dark p-t-100 p-b-50 " style="padding-top:50px;">
		<div class="wrapper wrapper--w900">
			<div class="card card-6">
				<div class="card-heading">
					<h2 class="title">Create New Blog</h2>
				</div>
				<div class="card-body">
					<form action="CreatePost" method="post"
						enctype="multipart/form-data">
						<div class="form-row">
							<div class="name">Category</div>
							<div class="value">
								<select name="Category" class="input--style-6 category">
									<option value="Psychology">Psychology</option>
									<option value="Food">Food</option>
									<option value="Business">Business</option>
									<option value="Programming">Programming</option>
									<option value="Education">Education</option>
									<option value="Health">Health</option>
									<option value="Media">Media</option>
								</select>
							</div>
						</div>
						<div class="form-row">
							<div class="name">Title</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-6" type="text" name="Title"
										placeholder="Type the title of your blog here" required="">
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">Content</div>
							<div class="value">
								<div class="input-group">
									<textarea id="mytextarea" class="textarea--style-6" name="Body"
										placeholder="Type the body of your blog here"></textarea>
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">Visibility</div>
							<div class="value">
								<select name="visibility" class="input--style-6 visibility">
									<option value="public">Public</option>
									<option value="private">Private</option>
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
								<img accept="image/*" src="assets/img/choosePhoto.png"
									name="ImgUrl" id="previewPhoto" size="50">
							</div>
						</div>
						<div class="card-footer">
							<button class="btn btn--radius-2 btn--blue-2" type="submit" style='height:35px;'
								id="submit" onclick="return validateForm()">Create</button>
						</div>
					</form>
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
		

	//   for Profile Picture 

	document.addEventListener('click', function(event) {
	    var dropdownContent = document.getElementById("dropdownContent");
	    if (!dropdownContent.contains(event.target)) {
	      dropdownContent.classList.remove("show");
	    }
	  });
	  
	  function toggleDropdown(event) {
	    var dropdownContent = document.getElementById("dropdownContent");
	    dropdownContent.classList.toggle("show");
	    event.stopPropagation(); // Stop the click event from propagating further
	  }
	  // Update Profile
	  document.addEventListener('click', function(event) {
	    var dropdownContent = document.getElementById("dropContent");
	    if (!dropdownContent.contains(event.target)) {
	      dropdownContent.classList.remove("show");
	    }
	  });
	  
	  function togglDropdown(event) {
	    var dropdownContent = document.getElementById("dropContent");
	    dropdownContent.classList.toggle("show");
	    event.stopPropagation(); // Stop the click event from propagating further
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
</body>
</html>