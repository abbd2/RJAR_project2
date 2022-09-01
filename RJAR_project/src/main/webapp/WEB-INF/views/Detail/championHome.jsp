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

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
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
$('.a_img').click(function (){
	let lane = $(this).val();
	
	console.log(lane);
	
	$.ajax({
		type : 'get',
		url : 'laneImg',
		data : {lane: lane}
		
	}).done(function(data){
		console.log("성공");			
		console.log(data);
		
		$('.champList').html(data);
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
		
		contentType : 'application/json;charset=UTF-8'
	}).done( function(data){
		console.log('성공');		
		$('.tierList').html(data);
	}).fail(function(err) {
		console.log("에러");
		console.log(err);
		
	})
	
});

$('#free').click(function () {
	
	$.ajax({
		type : 'get',
		url : 'rotation',
// 		data : {lane: lane},
		
		contentType : 'application/json;charset=UTF-8'
	}).done( function(data){
		console.log('성공');		
		$('.champList').html(data);
	}).fail(function(err) {
		console.log("에러");
		console.log(err);
		
	})
	
});

</script>
</head>
</html>