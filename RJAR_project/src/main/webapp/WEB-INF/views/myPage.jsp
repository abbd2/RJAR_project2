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
	height: 100%;
	background-color: white;
	position: relative;
}

.middle {
	width: 1100px;
	height: 100%;
	background-color: red;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.middleleft {
	width: 220px;
	height: 100%;
	background-color: green;
	margin: auto;
	float: left;
}

.middleDetail {
	width: 880px;
	height: 100%;
	background-color: yellow;
	margin: auto;
	float: left;
}
</style>

<title>Insert title here</title>
</head>
<body>
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
							style="font-family: 'Poor Story', cursive">마이페이지</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div class="main">
		<div class="middle">
			<div class="middleleft">
			</div>
			<div id="middleDetail">
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item" role="presentation"><a id="aTag"
						class="nav-link active" data-tab="home" data-bs-toggle="tab"
						aria-selected="true" role="tab">Home</a></li>
					<li class="nav-item" role="presentation"><a id="aTag"
						class="nav-link" data-tab="other" data-bs-toggle="tab"
						aria-selected="false" role="tab" tabindex="-1">Profile</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade active show" id="home" role="tabpanel">
						<p>Raw denim you probably haven't heard of them jean shorts
							Austin. Nesciunt tofu stumptown aliqua, retro synth master
							cleanse. Mustache cliche tempor, williamsburg carles vegan
							helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher
							synth. Cosby sweater eu banh mi, qui irure terry richardson ex
							squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis
							cardigan american apparel, butcher voluptate nisi qui.</p>
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

				</div>
			</div>
		</div>
	</div>
	<div class="footer"></div>


	<script type="text/javascript">
		$(document).ready(function() {
			$('ul.nav-tabs li a').click(function() {
				var tab_id = $(this).attr('data-tab');
				console.log(tab_id);

				$('ul.nav-tabs li a').removeClass('active');
				$('.tab-pane').removeClass('active show');

				$(this).addClass('active');
				$("#" + tab_id).addClass('active show');
			})

		})
	</script>







</body>
</html>