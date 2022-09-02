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
<<<<<<< HEAD
=======

>>>>>>> 33f2b520a353617e195dfad65a7a01f597adf93f
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
	let tier = '${tier}';

	switch (tier) {
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
	
});// function


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

//로테이션 챔피언 챔피언
$('#free').click(function () {
	
	$.ajax({
		type : 'get',
		url : 'rotation',
		
		contentType : 'application/json;charset=UTF-8'
	}).done( function(data){
		console.log('성공');		
		$('.champList').html(data);
	}).fail(function(err) {
		console.log("에러");
		console.log(err);
		
	})
	
});

//마우스 올릴 때
function changeBackColor_over(div){	
  $(div).css("background-color","skyblue");
}

//마우스 올리지 않을 때
function changeBackColor_out(div){
  $(div).css("background-color","");
}

//해당 클릭 시 --> 챔피언이름을 파라미터로 분석 상세 페이지로 이동(url : selectDetail)
function setSearch_onclick(){
	console.log($(this).innerText);
	$(".searchResult").css("display","none");
	$("#searchInput").attr("value", $(this).innerText);
	$("#selectForm").submit();
}

//검색
$('#searchInput').keyup(function () {
	let text = $(this).val();
	
	if (text == "") {
		$(".searchResult").css("display","none");
	}else{
	
		$.ajax({
			type : 'get',
			url : 'selectChamp',
			data: {text:text},
			
			dataType: 'json',
			contentType : 'application/json;charset=UTF-8'
		}).done( function(data){
			console.log('성공');
			console.log('데이터', data);
			let search = "";
			$.each(data, function (i, champion){
				search+= "<div class='championDetail' onclick='setSearch_onclick(this)' style = 'font-weight: bold;'" 
					  + "onmouseout='changeBackColor_out(this)'onmouseover='changeBackColor_over(this)'>"
					  +	"<img class = 'selectImg' src = https://ddragon.leagueoflegends.com/cdn/12.16.1/img/champion/"
					  + champion.championName + ".png>"+champion.champion_kr_name+"</div>";
			})
			$('.searchResult').html(search);
			$(".searchResult").css("display","block");
		}).fail(function(err) {
			console.log("에러");
			console.log(err);
			
		})
	
	}
})

//엔터 입력 시 포워딩
$("#searchInput").keydown(function(key) {                
	if (key.keyCode == 13) {                    
		$('#selectForm').submit();
	}
});

//챔피언 아이디를 파라미터로 분석 상세 페이지로 이동(url : clickDetail))
$('.champion').click(function (){
	let data_championId = $(this).attr("data-championId");
	let $form = $("<form action='clickDetail' method ='get'></form>");
	$("<input>").attr("name", "championId").val(data_championId).appendTo($form);
	$form.appendTo("body"); //body태그 안에 있어야 submit 작동함
	$form.submit();
})

$('.tierChamp').click(function (){
	let data_championId = $(this).attr('data-championId');
	let $form = $("<form action='clickDetail' method ='get'></form>");
	$("<input>").attr("name", "championId").val(data_championId).appendTo($form);
	$form.appendTo("body");
	$form.submit();
})
</script>
</head>
</html>