<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
#joinPage2 {
	width: 500px;
	height: 640px;
	border: 1px solid #758592;
	margin: 60px 0px 0px 510px;
}

#titleDiv {
	text-align: center;
	font-size: 40px;
	margin-top: 20px;
}

#pageSeparator {
	width: 200px;
	height: 30px;
	margin: 5px 0px 3px 150px;
}

.circle {
	border: 1px solid #758592;
	border-radius: 50px;
	width: 13px;
	height: 13px;
	float: left;
	margin: 5px 0px 0px 39px
}

#joinTextDiv {
	text-align: center;
	font-size: 20px;
}

#topDiv {
	height: 180px;
	width: 500px;
}

#bottomDiv {
	height: 150px;
	width: 500px;
}

#joinBtn {
	width: 120px;
	height: 50px;
	margin: 5px 0px 0px 190px;
	border-radius: 5px;
	border: 0px;
	background-color: #5383e8;
	font-size: 20px;
	color: #ffffff;
}
</style>
</head>
<body>

	<div id="joinPage2">
		<div id="titleDiv">RJAR.GG</div>
		<div id="joinTextDiv">회원가입</div>
		<div id="pageSeparator">
			<div class="circle" style="background-color: #5383e8;"></div>
			<div class="circle"></div>
			<div class="circle"></div>
		</div>
		
		<div id="topDiv">		
		</div> <!-- end topDiv -->
		
	
		<div>
			<a href="./join3">
				<input id="joinBtn" type="button" value="가입하기">
			</a>
		</div>

	</div>

</body>
</html>