<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<input id="id" type="text" placeholder="아이디를 입력해주세요.">
				<input id="checkIdBtn" type="button" value="중복확인">
				<div id="idCheckResult" style="font-size: 13px; padding-left: 100px;"></div>
			</div>
			
			비밀번호
			<div class="topInfoDiv">
				<input id="pw" class="topInfo" type="password" placeholder="비밀번호를 입력하세요.">
				<div id="pwInput"></div>
			</div>
			비밀번호 확인
			<div class="topInfoDiv">
				<input id="pwCheck" class="topInfo" type="password" placeholder="비밀번호를 다시 입력하세요.">
				<div id="pwCheckInput"></div>
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
				<input id="certified" type="button" value="인증" onclick="certified($('#selectPhone').val(), $('#phone').val());">
				<input id="certifiedNum" type="text" placeholder="인증번호 입력">
				<div id="selectTel" style="float: right; padding-right: 80px;"></div>
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
<!-- 			<a href="./join3"> -->
				<input id="joinBtn" type="button" value="가입하기">
<!-- 			</a> -->
		</div>

	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript">
	
	let idCheck = false;
	let pwCheck = false;
	let pwCheck2 = false;
	let phoneCheck = false;
	// 비밀번호 유효성 검사 규칙
	const regPw = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	// 전화번호 정규식 검사 규식
	const regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

	// id 값 변경할 때마다 중복확인 누르게 하기
	$('#id').on("propertychange change keyup paste input", function (){
		$('#idCheckResult').html('아이디 중복을 확인해 주세요.').css('color', 'red');
		idCheck = false;
	});

		// id 중복확인
		$('#checkIdBtn').on('click',function() {
					console.log('id 중복확인');
					
					if ($('#id').val() != '') {
						$.ajax({
							method : 'get',
							url : 'member/checkId',
							data : 'm_id=' + $('#id').val(),
							success : function(data, status, xhr) {
								$('#idCheckResult').html(data).css('color', 'blue');
								idCheck = true
							},
							error : function(xhr, status) {
								$('#idCheckResult').html(xhr.responseText).css('color', 'red');
								idCheck = false;
							}
						}); // end ajax
					} else {
						$('#idCheckResult').html('아이디를 입력해 주세요.').css('color', 'red');
						idCheck = false;
					}
				}); // end on

		// 비밀번호 검사
		// 값이 변경될 때마다 검사
		// 유효성 검사는 컨틀롤러에 구현하는 게 바람직하지만 속도를 위해 프론트에 구현
		$('#pw').on("propertychange change keyup paste input", function () {
			console.log('비밀번호 검사');
			
			if($('#pw').val() == ''){
				$('#pwInput').html('비밀번호를 입력해 주세요.').css('color', 'red');
				console.log("pwChekc : ", pwCheck);
				pwCheck = false;
			} else if (false === regPw.test($('#pw').val())) {
				$('#pwInput').html('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.').css('color', 'red');
				console.log("pwChekc : ", pwCheck);
				pwCheck = false;
				console.log('비밀번호 불일치')
				$('#pwCheckInput').html('비밀번호 불일치!').css('color', 'red');
				pwCheck2 = false;
			}
			else {
				console.log("통과");
				$('#pwInput').html('유효한 비밀번호 입니다.').css('color', 'blue');
				console.log("pwChekc : ", pwCheck);
				pwCheck = true;
				if($('#pw').val() === $('#pwCheck').val()){
					console.log('비밀번호 일치')
					$('#pwCheckInput').html('비밀번호 일치!').css('color', 'blue');
					pwCheck2 = true;
				}
			}
		}); // end on
					
		// 비밀번호 확인 검사
		// 값이 변경될 때마다 검사
		// 유효성 검사는 컨틀롤러에 구현하는 게 바람직하지만 속도를 위해 프론트에 구현
		$('#pwCheck').on("propertychange change keyup paste input", function() {
			if(!pwCheck){
				console.log('비밀번호 false');
				$('#pwCheckInput').html('');
				pwCheck2 = false;
			}else if(pwCheck){
				if($('#pw').val() === $('#pwCheck').val()){
					console.log('비밀번호 일치')
					$('#pwCheckInput').html('비밀번호 일치!').css('color', 'blue');
					pwCheck2 = true;
				} else{
					console.log('비밀번호 불일치')
					$('#pwCheckInput').html('비밀번호 불일치!').css('color', 'red');
					pwCheck2 = false;
				}
			}
		}); // end on

		// 인증번호
		function certified(tel, pNum) {
			console.log('선택한 통신사 : ', tel);
			console.log('핸드폰 번호 : ', pNum);
			$('#selectTel').html('');

			// 통신사 선택 여부 확인
			if (tel === '통신사') {
				$('#selectTel').html('통신사를 선택해 주세요.').css('color', 'red');
				phoneCheck = false;
			} else if (pNum == '') { // 핸드폰 번호 입력 여부 확인
				$('#selectTel').html('핸드폰 번호를 입력해 주세요.').css('color', 'red');
				phoneCheck = false;
			} else if(false === regPhone.test($('#phone').val())){
				$('#selectTel').html('핸드폰 번호를 정확히 입력해 주세요.').css('color', 'red');
				console.log('핸드폰 번호 유효성 검사 false');
				phoneCheck = false;
			}
		}; // end certified()

		// 가입하기
		$('#joinBtn').on('click', function() {
			console.log('가입하기');
			console.log('idCheck : ', idCheck);
			console.log('pwCheck : ', pwCheck);
			console.log('pwCheck2 : ', pwCheck2);
		}); // end on
	</script>

</body>
</html>