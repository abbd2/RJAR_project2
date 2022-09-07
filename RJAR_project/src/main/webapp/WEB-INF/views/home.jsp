<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css"
	integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R"
	crossorigin="anonymous">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
	rel="stylesheet">

<title>RJAR.GG</title>
</head>
<style type="text/css">
.header {
	width: 1500px;
	/* 	height: 500px;
	position: relative; */
}

.container-fluid {
	width: 1100px;
	
}



.summoner-search-outter-box {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-right: 100px;
}

.main-text-center {
	width: 500px;
	height: 300px;
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -150px;
	margin-top: -100px;
}

#summoner-search-box {
	margin-left: -150px;
	width: 500px;
}

.w-btn {
	position: relative;
	border: none;
	display: inline-block;
	padding: 15px 30px;
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	font-size: 16px;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	text-decoration: none;
	font-weight: 700;
	transition: 0.25s;
}

.w-btn-outline {
	position: relative;
	padding: 15px 30px;
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
}

.w-btn-green {
	background-color: #77af9c;
	color: #d7fff1;
}

.w-btn-green-outline {
	border: 3px solid #77af9c;
	color: darkgray;
}

.w-btn-green-outline:hover {
	background-color: #77af9c;
	color: #d7fff1;
}

.w-btn:hover {
	letter-spacing: 1.5px;
	transform: scale(1.2);
	cursor: pointer;
}

.w-btn-outline:hover {
	letter-spacing: 1.5px;
	transform: scale(1.2);
	cursor: pointer;
}

.w-btn:active {
	transform: scale(1.2);
}

.w-btn-outline:active {
	transform: scale(1.2);
}

#summoner-search-btn:focus {
	outline: none;
}

.main-text {
	font-size: 50px;
}
</style>

</head>
<body>
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>

	<div id="header" style="width: 1500px">
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
			<div class="container-fluid">
				<a class="navbar-brand" href="./home">RJAR</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarColor01"
					aria-controls="navbarColor01" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarColor01">
					<ul class="navbar-nav me-auto">
						<li class="nav-item"><a class="nav-link"
							href="./championHome" style="font-family: 'Poor Story', cursive">챔피언분석</a></li>
						<li class="nav-item"><a class="nav-link" href="./laboratory" style="font-family: 'Poor Story', cursive">연구소</a></li>
						<li class="nav-item"><a class="nav-link" href="./multiSearch" style="font-family: 'Poor Story', cursive">멀티서치</a></li>
						<li class="nav-item"><a class="nav-link" href="./myPage" style="font-family: 'Poor Story', cursive">커뮤니티</a></li>
						<li class="nav-item"><a class="nav-link" href="./lck" style="font-family: 'Poor Story', cursive">LCK분석</a></li>
					</ul>
				</div>
				<a href="./login">
					<button id="login-btn" type="button" class="btn btn-success" style="font-family: 'Poor Story', cursive">로그인</button>
				</a>
			</div>
		</nav>
	</div>
	<form action="summonerSearch" method="Get">
		<div class="main" style="width:500px">
			<div class="container">
				<div class="main-text-center">
					<h1 class="main-text">RJAR.GG</h1>
					<div class="input-group mb-3" id="summoner-search-box">
						<input type="text" class="form-control" placeholder="소환사명을 입력하세요"
							aria-label="Recipient's username"
							aria-describedby="button-addon2" name="summonerName">
						<button type="submit" class="btn btn-success">search</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<form action="championDetail" method = "get">
		<input type="text" value = "Aatrox" name="championName">
		<input type="text"  value = "TOP" name="lane">
		<button>제발돼라</button>
	</form>
</body>
</html>
