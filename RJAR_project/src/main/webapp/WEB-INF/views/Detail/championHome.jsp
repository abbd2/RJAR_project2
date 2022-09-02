<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="js/jquery.serializeObject.js"></script>	
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
	Aj('champion_Home','#champion_list');
	
	function Aj(url, position) {
		//비동기 통신은 dataType을 json으로 받을 때만,
		$.ajax({
			url: url,
			type: 'get',
			dataType: 'html' //'json'
		}).done((data)=>$(position).html(data))
		  .fail((data)=>console.log(err));
	} //Aj End
	
	$('option').click
</script>
</head>
</html>