<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css"
	integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R"
	crossorigin="anonymous">
	
<title>로그인</title>
<style type="text/css">
#topDiv {
	margin-top: 50px;
	float: center;
	height: 150px;
}

#loginDiv {
	width: 400px;
	height: 530px;
	border: 1px solid #758592;
	margin: 110px 0px 0px 559px;
}

#titleDiv {
	text-align: center;
	font-size: 50px;
	margin-top: 50px;
}

.inputDiv {
	margin: 0px 10px 10px 20px;
	width: 358px;
	height: 50px;
	border-radius: 10px;
}

.img {
	height: 50px;
	border-radius: 10px 0px 0px 10px;
	border: 1px solid #758592;
	width: 54px;
	float: left;
}

.loginInput {
	float: left;
	height: 48px;
	width: 295px;
	border: 1px solid #758592;
	border-radius: 0px 10px 10px 0px;
	font-size: 20px;
}

#loginState {
	margin: 15px 0px 0px 30px;
}
#bottomDiv{
	margin: 20px;
	height: 150px;
}
#loginBtn{
	height: 40px;
	width: 300px;
	margin: 0px 0px 20px 30px;
/* 	background-color: #5383e8; */
/* 	color: #ffffff; */
/* 	border: 0; */
/* 	border-radius: 5px; */
}
#findIdPw{
 	margin: 30px 0px 0px 105px;
	font-size: 14px;
}
#text{
	margin: 20px 0px 10px 75px;
	font-size: 18px;
}
#join{
	margin-left: 150px;
	font-size: 14px;
}
</style>
</head>
<body>

	<div id="loginDiv">
		<div id="titleDiv">RJAR.GG</div>
		
		<div id="topDiv">
			<div id="id" class="inputDiv">
				<img class="img" alt="id" src="./resources/loginImg/id.PNG">
				<input class="loginInput">
			</div>
			
			<div id="pw" class="inputDiv">
				<img class="img" alt="pw" src="./resources/loginImg/pw.PNG">
				<input class="loginInput">
			</div>
			
			<div id="loginState">
				<input type="checkbox" style="width: 20px; height: 20px; float: left">
				<div id="loginSatteText" style="float: left; padding: 2px 0px 0px 5px;">
					로그인 유지
				</div>
			</div>
		</div>
		
		<div id="bottomDiv">
			<input id="loginBtn" class="btn btn-primary btn-lg" type="button" value="로그인">
			<a id="findIdPw" href="">아이디 · 비밀번호 찾기</a>
				<div id="text">RJAR.GG가 처음이신가요?</div>
			<a id="join" href="./join">회원가입</a>
		</div>
		
	</div>

</body>
</html>