<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
<link rel="preconnect" href="https://fonts.gstatic.com">
<!-- 이거 지우고 밑에거 활성화 -->
<!-- <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> -->
<link
	href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
	rel="stylesheet">

<title>Insert title here</title>


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

	<div class="header">
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
						<li class="nav-item"><a class="nav-link" href="./laboratory"
							style="font-family: 'Poor Story', cursive">연구소</a></li>
						<li class="nav-item"><a class="nav-link" href="./multiSearch"
							style="font-family: 'Poor Story', cursive">멀티서치</a></li>
						<li class="nav-item"><a class="nav-link" href="./myPage"
							style="font-family: 'Poor Story', cursive">커뮤니티</a></li>
						<li class="nav-item"><a class="nav-link" href="./lck"
							style="font-family: 'Poor Story', cursive">LCK분석</a></li>
					</ul>
				</div>
				<form action="summonerSearch" method="Get">
					<div class="summoner-search-outter-box"
						style="text-align: center; vertical-align: middle;">
						<div class="summoner-search-box"
							style="display: block; margin-right: 3px;">
							<input class="form-control me-sm-2" type="text"
								placeholder="소환사명을 입력하세요" name="summonerName"
								style="font-family: 'Poor Story', cursive">
						</div>
						<div class="summoner-search-button">
							<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
						</div>
					</div>
				</form>

				<c:if test="${sessionScope.m_id != null}">
					<form action="./logout" method="post">
						<button id="login-btn" type="submit" class="btn btn-success"
							style="font-family: 'Poor Story', cursive">로그아웃</button>
					</form>
				</c:if>
				<c:if test="${sessionScope.m_id == null}">
					<a href="./login">
						<button id="login-btn" type="button" class="btn btn-success"
							style="font-family: 'Poor Story', cursive">로그인</button>
					</a>
				</c:if>
			</div>
		</nav>
	</div>
	<script type="text/javascript">
	console.log(${sessionScope.m_id})
</script>
</body>
</html>