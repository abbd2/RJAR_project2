<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css"
	integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
		
	<jsp:include page="../header.jsp"></jsp:include>
	<div id='box'>
		<div id='main'>
			<aside>
				<div id='champion_list'>
					<jsp:include page="championList.jsp"></jsp:include>
				</div>
			</aside>
		</div>
	</div>
</body>
<script type="text/javascript">

$(function() {
	let key = '${tier}';

	switch (key) {
	case 'bronze':
		$('#bronze').prop('selected', true);
		break;
	case 'silver':
		$('#silver').prop('selected', true);
		break;
	case 'gold':
		$('#gold').prop('selected', true);
		break;
	case 'platinum':
		$('#platinum').prop('selected', true);		
		break;
	case 'diamond':
		$('#diamond').prop('selected', true);
		break;

	default:
		break;
	}	
});


// 티어 옵션 선택 시
$('#selectOption').on('change', function (){
	$('#select').submit();
});


// 라인 이미지 선택 시
$('.laneImg').click(function (){
	let tier = $('#selectOption').val();
	let lane = $(this).val();
	
	console.log(tier);
	console.log(lane);
	
	$.ajax({
		type : 'get',
		url : 'tierList',
		data : {lane: lane},
		
		dataType: 'json'
	}).done(function(data){
		console.log("성공");			
		console.log(data);	
		
		//화면에 표출될 태그 생성
	}).fail(function(err) {
		console.log("에러");
		console.log(err);
		
	})
	
});	

//라인(버튼) 선택 시
$('.lane_').click(function (){
	let tier = $('#selectOption').val();
	let lane = $(this).val();
	
	console.log(tier);
	console.log(lane);
	
	$.ajax({
		type : 'get',
		url : 'tierList',
		data : {tier: tier, lane: lane},
		
		contentType : 'application/json;charset=UTF-8',	
	}).done(function(data){
		
		console.log('성공');		
		$('.tierList').html(data);
	}).fail(function(err) {
		console.log("에러");
		console.log(err);
		
	})
	
});
</script>
</head>
</html>