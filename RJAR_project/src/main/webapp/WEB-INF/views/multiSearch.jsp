<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" -->
<!-- 	crossorigin="anonymous"> -->
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" -->
<!-- 	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" -->
<!-- 	crossorigin="anonymous"></script> -->

<!-- <script -->
<!-- 	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" -->
<!-- 	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" -->
<!-- 	crossorigin="anonymous"></script> -->
<!-- <script -->
<!-- 	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" -->
<!-- 	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" -->
<!-- 	crossorigin="anonymous"></script> -->
<title>멀티서치</title>
<style type="text/css">
.summoner-search-outter-box {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-right: 100px;
}
</style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript">
		function multiSearch() {

			let divList;
			let summoners = $("#multiSearchInput").val();

			console.log("함수")
			$.ajax({
				url : "multiSearch/executeMultiSearch",
				contentType : 'application/json; charset=UTF-8',
				method : "get",
				data : {
					"summoners" : summoners
				},
				dataType : 'json',
				success : function(data) {
					console.log(data)
					
					divList += '<div class=tierPosition>'
						+'<div class=tier>'
							+'<img src="./resources/tierImg/'+data[0].tier+'.png" width="38px">'
						+'</div>'
						+'<div class=mostPosition>'
							+'<img src="./resources/laneImg/'+data[0].lanes[0]+'.png">'
						+'</div>'
					+'</div>'
					+'<div class="summonerName">'
						+'<a href="">'+data[0].summonerName+'</a>'
					+'</div>'
					+'<div class="lp">'+data[0].tier+' '+data[0].rank+' '+data[0].lp
					+'</div>'
					+'<div class="graph">'
						+'<div class=barGraph style="weight=185; height=16;">'
							+'<div class="base" style="backgorund-color: red;>'
								+'<div class="win" style="width: '+data[0].totalWinRate+'%">'
									+data[0].totalWins+'승'
								+'</div>'
								+data[0].totalLosses+'패'
							+'</div>'
							+'<strong class="winRate">'
								+data[0].totalWinRate+'%'
						+'</div>'
					+'</div>';
					
					$('.summonerSummary').html(divList); /* div추가 */

				},
				error : function() {
					alert("err");
				}
			});
		}
	</script>

	<%-- 	<jsp:include page="header.jsp"></jsp:include> --%>
	<div id="main"></div>
	<div id="multiSearch">
		<div id="textarea">
			<textarea name="multiSearchInput" id="multiSearchInput"
				style="height: 200px; width: 500px;"></textarea>
			<input id="searchBtn" type="button" value="여러명의 소환사 이름으로 요약 검색"
				onclick="multiSearch()">
		</div>

		<div id="content">
			<ul class="multiList" style="list-style: none;">
				<li style="width: 216; height: 869; border: 1px solid gray;">
					<div class="summonerSummary" >
<!-- 						<div class="tierPosition"> -->
<!-- 							<div class="tier"> -->
<!-- 								<img src="./resources/tierImg/SILVER.png" width="50px"> -->
<!-- 							</div> -->
<!-- 							<div class="mostPosition"> -->
<!-- 								<img alt="" src=""> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="summonerName"> -->
<!-- 							<a>소환사 이름</a> -->
<!-- 						</div> -->
<!-- 						<div class="lp">티어, lp</div> -->
<!-- 						<div class="graph"> -->
<!-- 							<div class="barGraph"> -->
<!-- 								<div class="base"> -->
<!-- 									<div class="win">승 수, 승</div> -->
<!-- 									패 수, 패 -->
<!-- 								</div> -->
<!-- 								<strong>승률</strong> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>

					<div class="recentMatches">
						<div class="title">최근 플레이</div>

						<div class="positions">
							<div class="position">
								<div class="positionIcon">
									<img alt="" src="">
								</div>
								<div class="positionInfo">
									<div class="roleRate">승률</div>
									<div class="winRate">
										W/R<strong>%</strong>
									</div>
								</div>
							</div>
							<div class="position">
								<div class="positionIcon">
									<img alt="" src="">
								</div>
								<div class="positionInfo">
									<div class="roleRate">승률</div>
									<div class="winRate">
										W/R<strong>%</strong>
									</div>
								</div>
							</div>
						</div>
						<ul class="recentGames">
						</ul>

						<div></div>
					</div>

				</li>
				<li style="width: 216; height: 869;"></li>
				<li style="width: 216; height: 869;"></li>
				<li style="width: 216; height: 869;"></li>
				<li style="width: 216; height: 869;"></li>
			</ul>
		</div>

	</div>
	<div id="footer"></div>
</body>
</html>