<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
	rel="stylesheet">

<style type="text/css">
body, html {
	height: 100%;
}

.header {
	width: 1500px;
	/* 	height: 500px;
	position: relative; */
}

.container-fluid {
	width: 1100px;
}

.main {
	width: 1500px;
	height: 775px;
	background-color: rgba(208, 209, 212, .5);
	position: relative;
}

.middle {
	width: 1100px;
	height: 100%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.middleleft {
	width: 300px;
	height: 100%;
	margin: auto;
	float: left;
}

.middleDetail {
	width: 800px;
	height: 100%;
	margin: auto;
	float: left;
}

.tapMenuBox {
	width: 240px;
	margin-top: 50px;
}

.nav nav-tabs {
	width: 240px;
}

.nav-item {
	width: 240px;
}

#aTag {
	margin-bottom: 10px;
}

.imageAndTextBox {
	width: 240px;
	margin: 25px;
	text-align: center;
}

.mainTitle {
	width: 240px;
	margin-top: 10px;
	margin-left: 20px;
}

.profileImage1 {
	width: 120px;
	height: 120px;
	margin-right: 60px;
	margin-left: 60px;
	border-radius: 70%;
	overflow: hidden;
	text-align: center;
	border-radius: 70%;
}

.profileImage2 {
	width: 70px;
	height: 70px;
	margin-top: 20px;
	border-radius: 70%;
	overflow: hidden;
	text-align: center;
	border-radius: 70%;
}

.PImage {
	width: 100%;
	height: 100%;
	object-fit: cover;
	height: 100%;
}

.wrapper {
	width: 30px;
	height: 30px;
	text-align: right;
	margin-top: 5px;
	/* margin: 50px auto; */
}

#switch {
	position: absolute;
	display: none;
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
}

.switch_label {
	position: relative;
	cursor: pointer;
	display: inline-block;
	width: 58px;
	height: 28px;
	background: #fff;
	border: 2px solid #ABABAB;
	border-radius: 20px;
	transition: 0.2s;
}

.switch_label:hover {
	background: #efefef;
}

.onf_btn {
	position: absolute;
	top: 2.1px;
	left: 3px;
	display: inline-block;
	width: 20px;
	height: 20px;
	border-radius: 20px;
	background: #ABABAB;
	transition: 0.2s;
}

/* checking style */
#switch:checked+.switch_label {
	background: #ABABAB;
	border: 2px solid #ABABAB;
}

#switch:checked+.switch_label:hover {
	background: #ABABAB;
}

/* move */
#switch:checked+.switch_label .onf_btn {
	left: 34px;
	background: #fff;
	box-shadow: 1px 2px 3px #00000020;
}
</style>

<title>Insert title here</title>
</head>
<body>
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>

	<div class="header" style="background-color: rgba(208, 209, 212, .3);">
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
							style="font-family: 'Poor Story', cursive">마이페이지</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div class="main" style="font-family: 'Poor Story', cursive">
		<div class="middle">
			<div class="middleleft">
				<div class="card">
					<div class="card-body" style="width: 300px; height: 770px;">
						<div class="myProfileBox" style="margin: -20px">
							<div class="mainTitle">
								<span
									style="margin-right: -15px; font-size: 20px; font-weight: bold; width: 15px">
									<a class="navbar-brand" href="./home">RJAR</a>
								</span> <span>프로필</span>
							</div>
							<div class="imageAndTextBox">
								<div class="profileImage1">
									<img class="PImage" src="./resources/loginImg/29.png"
										width="120px">
								</div>
								<div style="margin-top: 20px;">
									<h4 style="font-family: 'Poor Story', cursive">런치버거세트</h4>
								</div>
							</div>
							<div></div>
						</div>
						<div class="tapMenuBox">
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item" role="presentation"><a id="aTag"
									class="nav-link active" data-tab="Modify" data-bs-toggle="tab"
									aria-selected="true" role="tab">개인정보수정</a></li>
								<li class="nav-item" role="presentation"><a id="aTag"
									class="nav-link" data-tab="other" data-bs-toggle="tab"
									aria-selected="false" role="tab" tabindex="-1">나의 활동</a></li>
								<li class="nav-item" role="presentation"><a id="aTag"
									class="nav-link" data-tab="delete" data-bs-toggle="tab"
									aria-selected="false" role="tab" tabindex="-1">회원탈퇴</a></li>
							</ul>
						</div>
						<c:if test="${sessionScope.m_id != null}">
							<form action="./logout" method="post" id='logOutFrm'
								style="margin: 0px;">
								<div style="margin-top: 20px">
									<a href="#" style="margin: 18px"
										onclick="document.getElementById('logOutFrm').submit();">로그아웃</a>
								</div>
							</form>
						</c:if>
					</div>
				</div>
			</div>
			<div class="middleDetail">
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade active show" id="Modify" role="tabpanel">
						<div class="card"
							style="width: 750px; height: 200px; margin: 25px; margin-top: 25px">
							<div class="card-body">
								<div style="margin: -10px; height: 10%;">
									<h6 style="font-family: 'Poor Story', cursive">기본정보</h6>
								</div>
								<div
									style="height: 70%; border-bottom: 1px solid rgba(132, 129, 140, .5)">
									<div style="width: 12%; float: left; text-align: center">
										<div class="profileImage2">
											<img class="PImage" src="./resources/loginImg/29.png"
												width="70px">
										</div>
									</div>
									<div style="width: 68%; height: 100%; float: left;">
										<div style="margin: 25px; margin-left: 10px">
											<h3 style="font-family: 'Poor Story', cursive">유성호</h3>
											<h6 style="font-family: 'Poor Story', cursive">런치버거세트</h6>
										</div>
									</div>
									<div
										style="width: 20%; height: 100%; float: left; text-align: right">
										<div style="margin-top: 35px">
											<button type="button" class="btn btn-dark disabled"
												style="font-family: 'Poor Story', cursive">닉네임수정</button>
										</div>
									</div>
								</div>
								<div style="height: 30%; margin-top: 10px">
									<div style="width: 80%; float: left">
										<div style="margin-top: 5px; margin-left: 10px">
											<div style="float: left; width: 25px; height: 25px">
												<img src="./resources/loginImg/phone.png"
													style="width: 25px; height: 25px">
											</div>
											<div style="float: left">
												<h5 style="margin-top: 3px; margin-left: 3px">010-****-****</h5>
											</div>
										</div>
									</div>
									<div
										style="width: 20%; height: 100%; float: left; text-align: right">
										<button type="button" class="btn btn-dark disabled"
											style="font-family: 'Poor Story', cursive">수정</button>
									</div>
								</div>
							</div>
						</div>
						<div class="card"
							style="width: 750px; height: 80px; margin: 25px; margin-top: 5px">
							<div class="card-body">
								<div style="margin: -10px; height: 10%;">
									<h6 style="font-family: 'Poor Story', cursive">비밀번호 변경</h6>
								</div>
								<div style="margin-top: 25px">
									<div style="width: 80%; float: left">
										<div style="margin-top: 10px; margin-left: 10px">
											<div style="float: left; width: 25px; height: 25px">
												<img src="./resources/loginImg/lock.png"
													style="width: 25px; height: 25px">
											</div>
											<div style="float: left">
												<h5
													style="margin-top: 3px; margin-left: 3px; font-family: 'Poor Story', cursive">비밀번호</h5>
											</div>
										</div>
									</div>
									<div
										style="width: 20%; height: 100%; float: left; text-align: right">
										<button type="button" class="btn btn-dark disabled"
											style="font-family: 'Poor Story', cursive">수정</button>
									</div>
								</div>
							</div>
						</div>
						<div class="card"
							style="width: 750px; height: 80px; margin: 25px; margin-top: 5px">
							<div class="card-body">
								<div style="margin: -10px; height: 10%;">
									<h6 style="font-family: 'Poor Story', cursive">정보수신동의</h6>
								</div>
								<div style="margin-top: 25px">
									<div style="width: 80%; float: left">
										<div style="margin-top: 10px; margin-left: 10px">
											<div style="float: left; width: 25px; height: 25px">
												<img src="./resources/loginImg/phone.png"
													style="width: 25px; height: 25px">
											</div>
											<div style="float: left">
												<h5
													style="margin-top: 3px; margin-left: 3px; font-family: 'Poor Story', cursive">휴대전화</h5>
											</div>
										</div>
									</div>
									<div class="wrapper"
										style="width: 20%; height: 100%; float: left; text-align: right">
										<input type="checkbox" id="switch" name="checkSwitch">
										<label for="switch" class="switch_label"> <span
											class="onf_btn"></span>
										</label>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="other" role="tabpanel">
						<p>Food truck fixie locavore, accusamus mcsweeney's marfa
							nulla single-origin coffee squid. Exercitation +1 labore velit,
							blog sartorial PBR leggings next level wes anderson artisan four
							loko farm-to-table craft beer twee. Qui photo booth letterpress,
							commodo enim craft beer mlkshk aliquip jean shorts ullamco ad
							vinyl cillum PBR. Homo nostrud organic, assumenda labore
							aesthetic magna delectus mollit.</p>
					</div>
					<div class="tab-pane fade" id="delete" role="tabpanel">
						<div class="card"
							style="width: 750px; height: 725px; margin: 25px; margin-top: 25px">
							<div class="card-body">
								<div style="margin: -10px; height: 15%;">
									<h4 style="font-family: 'Poor Story', cursive">탈퇴 안내</h4>
									<h6 style="font-family: 'Poor Story', cursive; color:gray">회원탈퇴를 신청하기전에 안내사항을 꼭 확인하세요.</h6>
								</div>
								<div style="margin: 10px; margin-top:-10px; height: 20%;">
								     <p style="font-weight:bold; font-size:16px"><span style="color: green;">✔</span> 사용하고 계신 아이디(<span style="color : blue">${sessionScope.m_id}</span>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</p>
								     <p style="color:gray; font-size:14px"><span style="color : red">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</span>하오니 신중하게 선택하시기 바랍니다.</p>
								     
								</div>
								<div style="margin: 10px; margin-top:-25px; height: 20%;">
								     <p style="font-weight:bold; font-size:16px"><span style="color: green;">✔</span> 탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</p>
								     <p style="color:gray; font-size:14px">회원정보 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br> 삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</p>
								</div>
								<div style="margin: 10px; margin-top:-10px; height: 20%; border-bottom: 1px solid rgba(132, 129, 140, .5)" >
								     <p style="font-weight:bold; font-size:16px"><span style="color: green;">✔</span> 탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</p>
								     <p style="color:gray; font-size:14px">챔피언 분석에 올린 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.<br> 
								     <span style="color : red">삭제를 원하는 댓글이 있다면 반드시 탈퇴 전에 삭제하시기 바랍니다.</span><br>
								     탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 댓글을 임의로 삭제해드릴 수 없습니다.								     
								     </p>
								</div>
								<div style="margin: 10px; margin-top : 20px; height: 15%;">
								     <p style="color:red; font-size:14px; font-weight:bold; margin-bottom:5px">탈퇴 후에는 아이디 <span style="color : blue">${sessionScope.m_id}</span> 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.<br> 
								     챔피언 분석에 남아 있는 댓글은 탈퇴 후 삭제할 수 없습니다.
								     </p>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" style="margin-left :-1px;"
											id="flexCheckDefault"> <label style="margin-left:-40px; font-family: 'Poor Story', cursive; font-size:14px"
											class="form-check-label" for="flexCheckDefault">
											안내사항을 모두 확인하였으며, 이에 동의합니다. </label>
									</div>
								</div>
								<div style="margin: 10px; margin-top:30px; height: 10%; text-align:center;">
									<button type="button" class="btn btn-success" style="font-family: 'Poor Story', cursive">확인</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer"></div>


	<script type="text/javascript">
		console.log('${sessionScope.m_id}')

		$(document).ready(function() {
			$(".btn-success").attr("disabled", true);
		    $("#flexCheckDefault").on('click',function(){
		        var chk = $('input:checkbox[id="flexCheckDefault"]').is(":checked");
		        if(chk==true){
		            $(".btn-success").removeAttr('disabled');
		        }else{
		            $(".btn-success").attr("disabled", true);
		        }
		    });
			
			
			
			
			$('ul.nav-tabs li a').click(function() {
				var tab_id = $(this).attr('data-tab');
				console.log(tab_id);

				$('ul.nav-tabs li a').removeClass('active');
				$('.tab-pane').removeClass('active show');

				$(this).addClass('active');
				$("#" + tab_id).addClass('active show');
			})

		})

		$(document)
				.ready(
						function() {
							var chkList = $("input[name=checkSwitch]");
							$('#switch')
									.focus(function() {
									})
									.change(
											function() {
												if ($(this).is(":checked")) {
													alert("프로모션 정보수신에 동의하셨습니다. \n"
															+ "(본 수신 동의는 RJAR.GG 통합 서비스에 한하여 유효하며, 일부 개별 수신 동의를 받는 서비스는 개별 서비스 동의 상태를 따릅니다.)")
												} else {
													if (!confirm('앞으로는 RJAR.GG에서 제공하는 프로모션 정보를 받을 수 없습니다. \n'
															+ '정보수신동의 헤제를 진행하시겠습니까?')) {
														chkList.prop("checked",
																true);
													} else {
														alert("정보수신동의가 해제되었습니다. \n"
																+ "(본 수신 동의는 RJAR.GG 통합 서비스에 한하여 유효하며, 일부 개별 수신 동의를 받는 서비스는 개별 서비스 동의 상태를 따릅니다.)");
													}
												}
											});
						});
	</script>







</body>
</html>