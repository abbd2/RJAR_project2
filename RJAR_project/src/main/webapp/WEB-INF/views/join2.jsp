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
	height: 710px;
	border: 1px solid #758592;
	margin: 20px 0px 0px 510px;
}

#titleDiv {
	text-align: center;
	font-size: 40px;
	margin-top: 20px;
}

#pageSeparator {
	width: 200px;
	height: 20px;
	margin: 5px 0px 3px 150px;
}

.circle {
	border: 1px solid #758592;
	border-radius: 50px;
	width: 13px;
	height: 13px;
	float: left;
	margin: 5px 0px 0px 39px;
}

#joinTextDiv {
	text-align: center;
	font-size: 20px;
}

#topDiv {
	height: 500px;
	width: 400px;
	margin: 0px 0px 0px 50px;
	font-size: 14px;
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

.topInfoDiv{
	width: 400px; 
	height: 40px;
}

#id{
	width: 300px;
	height: 30px;
	font-size: 17px;
	border-radius: 5px;
}

#idCheckBtn{
	height: 35px;
	font-size: 17px;
	float: right;
	border-radius: 5px;
}
.topInfo{
	height: 30px;
	width: 392px;
	font-size: 17px;
	border-radius: 5px;
}

#selectPhone{
	height: 35px;
	border-radius: 5px;
	width: 90px;
	font-size: 17px;
	margin-bottom: 7px; 
}

#phone{
	height: 30px;
	width: 222px;
	border-radius: 5px;
	font-size: 17px;
}

#certified{
	height: 35px;
	width: 70px;
	border-radius: 5px;
	font-size: 17px;
}

#certifiedNum{
	height: 30px;
	width: 150px;
	border-radius: 5px;
	font-size: 17px;
	margin-bottom: 7px;
}

#pwQuestion{
	height: 35px;
	border-radius: 5px;
	width: 400px;
	font-size: 17px;
	margin-bottom: 7px; 
}

#answer{
	height: 30px;
	border-radius: 5px;
	width: 392px;
	font-size: 17px;
	margin-bottom: 7px;
}

</style>
</head>
<body>
	<script type="text/javascript">
		 ${'#checkIdBtn'}.on('click', function () {
			if(${'#id'}.val != ''){
				$ajax({
					method : 'get',
					url : 'member/checkId'
					data : 'm_id='+$('#id').val),
					success : function name() {
						
					}
					
				})
					
			}
		})
	</script>

	<div id="joinPage2">
		<div id="titleDiv">RJAR.GG</div>
		<div id="joinTextDiv">회원가입</div>
		<div id="pageSeparator">
			<div class="circle"></div>
			<div class="circle" style="background-color: #5383e8;"></div>
			<div class="circle"></div>
		</div>
		
		<div id="topDiv">
			아이디
			<div class="topInfoDiv">
				<input id="id" type="text" name="id" placeholder="아이디를 입력해주세요.">
				<input id="checkIdBtn" type="button" value="중복확인">
			</div>
			
			비밀번호
			<div class="topInfoDiv">
				<input class="topInfo" type="text" placeholder="비밀번호를 입력하세요.">
			</div>
			비밀번호 확인
			<div class="topInfoDiv">
				<input class="topInfo" type="text" placeholder="비밀번호를 다시 입력하세요.">
			</div>
			이름
			<div class="topInfoDiv">
				<input class="topInfo" type="text" placeholder="이름을 입력하세요.">
			</div>
			닉네임
			<div class="topInfoDiv">
				<input class="topInfo" type="text" placeholder="닉네임을 입력하세요.">
			</div>
			핸드폰 번호
			<div>
				<select id="selectPhone">
					<option selected="selected">통신사</option>
					<option>SKT</option>
					<option>KT</option>
					<option>LG U+</option>
					<option>알뜰폰 SKT</option>
					<option>알뜰폰 KT</option>
					<option>알뜰폰 LG U+</option>
				</select>
				<input id="phone" type="text" placeholder="핸드폰 번호">
				<input id="certified" type="button" value="인증">
				<input id="certifiedNum" type="text" placeholder="인증번호 입력">
			</div>
			비밀번호 찾기 질문
			<div>
				<select id="pwQuestion">
					<option selected="selected">질문</option>
					<option>당신의 초등학교 이름</option>
					<option>당신이 가장 좋아하는 게임</option>
					<option>당신의 보물 제1호</option>
				</select>
				<input id="answer" type="text" placeholder="답변">
			</div>
		</div> <!-- end topDiv -->
		<div>
			<a href="./join3">
				<input id="joinBtn" type="button" value="가입하기">
			</a>
		</div>

	</div>

</body>
</html>