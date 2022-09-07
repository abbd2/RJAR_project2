<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css"
	integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R"
	crossorigin="anonymous">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
	rel="stylesheet">


<title>summonerSearch</title>
<style type="text/css">
body {
	background-color: #DAD4D4;
}

.summoner-search-outter-box {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-right: 100px;
}

.header {
	height: 20%;
}

#leftSide {
	float: left;
	height: 500px;
	width: 30%;
	position: relative;
	padding: 5px;
}

#leftSideBox {
	align-content: center;
}

#summonerInfo {
	width: 100%;
	margin-bottom: 15px;
}

#profileImageBox {
	width: 100px;
	height: 100px;
	float: left;
	margin-right: 15px;
	justify-content: center;
}

#profileImage, #champImage {
	position: relative;
}

#Level {
	position: relative;
	left: 30px;
	top: -15px;
}

#profileDetail {
	width: 70%;
	float: left;
	margin-bottom: 17px;
}

#tierImage {
	width: 20%;
	float: left;
}

#tierInfo {
	width: 50%;
	float: left;
	text-align: center;
}

#winLose {
	width: 30%;
	float: left;
	text-align: center;
}

#detail {
	/* border: 1px solid blue; */
	float: left;
	height: 500px;
	width: 70%;
	position: relative;
	padding: 5px;
}

.reloadButton {
	/* border: 1px solid red; */
	
}

.gameDate {
	width: 15%;
	float: left;
	/* border: 1px solid blue; */
}

.championData {
	width: 25%;
	height: 100px;
	float: left;
	/* border: 1px solid blue; */
}

.imageLevelBox {
	height: 60px;
	/* border: 1px solid blue; */
}

.itemsBox {
	height: 40px;
	/* border: 1px solid blue; */
	justify-content: space-around;
}

.AccordionButton {
	width: 5%;
	float: left;
	/* border: 1px solid blue; */
}

#champLevel {
	position: relative;
	width: 40px;
	height: 10px;
	left: 8.5px;
	top: -22px;
}

#champImage {
	width: 50px;
}

.items {
	/* border: 1px solid blue; */
	margin-top: 3px;
}

.imageLevel {
	height: 50px;
	width: 55px;
	/* border: 1px solid blue; */
	float: left;
}

.spellBox, .runeBox {
	width: 30px;
	/* border: 1px solid blue; */
	float: left;
}

.lane {
	width: 100px;
	float: left;
	/* border: 1px solid blue; */
	margin-left: 10 px;
}

#spell1, #mainRune {
	margin-bottom: 3px;
}

#dataFlexBox {
	display: flex;
}

#item {
	float: left;
	height: 30px;
	width: 30px;
	margin-left: 2px;
	/* border: 1px solid blue; */
}

.stats {
	width: 15%;
	float: left;
	/* border: 1px solid blue; */
	text-align: center;
}

#kdaMain {
	float: left;
	height: 15px;
}

#bigKda {
	font-weight: bold;
	font-size: 1.5em;
	align-items: center;
	/* text-align: center; */
}

.killType {
	color: white;
	font-weight: bold;
}

.CS {
	width: 13%;
	float: left;
	/* border: 1px solid blue; */
	text-align: center;
}

.blueTeam, .purpleTeam {
	height: 100%;
	float: left;
	/* border: 1px solid blue; */
	width: 50%;
	float: left;
}

.miniSumImage {
	float: left;
	/* border: 1px solid blue; */
	height: 18px;
}

.miniSumName {
	float: left;
	width: 110px;
	/* border: 1px solid blue; */
	height: 18px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.miniName {
	display: block;
	/* top : -5px; */
	vertical-align: top;
	font-size: 15px;
}

.teamList {
	width: 27%;
	float: left;
	/* border: 1px solid blue; */
}

.minichampImg {
	top: -5px;
	margin-bottom: 8px;
}

.summoner {
	height: 18px;
	align-content: space-around;
	margin-bottom: 1.5px;
}

.footer {
	height: 20%;
}

a.miniName:link {
	text-decoration: none;
}

a.miniName:hover {
	text-decoration: underline;
}

.otherPlayerList {
	/* border: 1px solid blue; */
	
}

.card {
	position: relative;
	/*   padding: 17px 0;
  cursor: pointer;
  font-size: 14px;
  border-bottom: 1px solid #dddddd; */
}

.card::before {
	display: inline-block;
	/*   content: 'Q';
  font-size: 14px;
  color: #006633;
  margin: 0 5px; */
}

/* .card.on>span{
  font-weight: bold;
  color: #006633; 
} */
.otherPlayerList {
	display: none;
	overflow: hidden;
	/*  font-size: 14px;
  background-color: #f4f4f2;
  padding: 27px 0; */
}

.otherPlayerList::before {
	display: inline-block;
	/*   content: 'A';
  font-size: 14px;
  font-weight: bold;
  color: #666;
  margin: 0 5px; */
}

.arrow-wrap {
	position: absolute;
	top: 50%;
	right: 10px;
	transform: translate(0, -50%);
}

.card .arrow-top {
	display: none;
}

.card .arrow-bottom {
	display: block;
}

.card.on .arrow-bottom {
	display: none;
}

.card.on .arrow-top {
	display: block;
}

#otherChampLevel {
	position: relative;
	left: 7px;
	top: -12px;
}

.otherChampImageLevel {
	height: 35px;
	width: 35px;
	float: left;
	margin-right: 5px;
}

.otherSpellBox, .otherRuneBox {
	height: 37px;
	width: 20px;
	float: left;
	width: 20px;
}

#otherSpell1, #otherMainRune {
	height: 18px;
	/* margin-bottom: 1px; */
}

.miniRune, .miniSpell {
	top: -5px;
	margin-bottom: 5.5px;
}

.otherSummonerName {
	height: 38px;
	width: 130px;
	float: left;
	margin-left: 5px;
}

.otherKda, .otherWard, .otherCs {
	width: 100%;
	float: left;
	height: 38px;
	text-align: center;
	float: left;
}

.otherItemsBox {
	height: 38px;
	/* border: 1px solid blue; */
	justify-content: space-around;
}

.graphTitle {
	position: relative;
	height: 5px;
	font-size: 8px;
	text-align: center;
	color: white;
	font-weight: bold;
}

.graphBox {
	height: 20px;
	/* margin-bottom : 30px; */
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>

	<div class=header>
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div class=main style="width:1500px; height:1500px; background-color : #E1E1E1">
		<div id="leftSide">
			<div id="leftSideBox">
				<div class="card" id="summonerInfo">
					<div class="card-body">
						<div id="profileImageBox">
							<div id="profileImage">
								<img
									src="http://ddragon.leagueoflegends.com/cdn/12.15.1/img/profileicon/${profileIconId}.png"
									width="100px">
							</div>
							<div id="Level">
								<span class="badge rounded-pill bg-primary" style="color: white">${LV}</span>
							</div>
						</div>
						<div id="profileDetail">
							<h4 class="card-title" id="summonerName"
								style="font-family: 'Poor Story', cursive;">${name}</h4>
						</div>
						<div class="reloadButton">
							<button type="button" class="btn btn-info"
								style="font-family: 'Poor Story', cursive; font-size: 20px"
								onclick="location.href='http://localhost:8080/www/summonerSearch?summonerName=${name}'">전적
								갱신</button>
						</div>
					</div>
				</div>
				<div class="card border-secondary mb-3" id="soloRankBox">
					<div class="card-header"
						style="font-family: 'Poor Story', cursive; font-size: 20px; font-size: bold;">솔로랭크</div>
					<div class="card-body">
						<div id="tierImage">
							<img src="./resources/tierImg/${soloTier}.png" width="100px">
						</div>
						<div id="tierInfo">
							<h4 class="card-title">${soloTier}${soloRank}</h4>
							<p class="card-text">${soloLeaguePoint}점</p>
						</div>
						<div id="winLose">
							<p class="card-text">${soloWins}승${soloLosses}패</p>
							<p class="card-text">${soloWinRate}%</p>
						</div>
					</div>
				</div>
				<div class="card border-secondary mb-3" id="soloRankBox">
					<div class="card-header"
						style="font-family: 'Poor Story', cursive; font-size: 20px; font-size: bold">자유랭크</div>
					<div class="card-body">
						<div id="tierImage">
							<img src="./resources/tierImg/${freeTier}.png" width="100px">
						</div>
						<div id="tierInfo">
							<h4 class="card-title">${freeTier}${freeRank}</h4>
							<p class="card-text">${freeLeaguePoint}점</p>
						</div>
						<div id="winLose">
							<p class="card-text">${freeWins}승${freeLosses}패</p>
							<p class="card-text">${freeWinRate}%</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="detail">
			<div class="matchBox">
				<div class="mainMatch">${myGames}</div>
			</div>
		</div>
	</div>


	<div class="footer"></div>
	<!-- 	<button type="button" id="myButton" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off">
  Loading state
</button>
 -->

	<script type="text/javascript">
		$(".card").click(
				function() {
					$(this).next(".otherPlayerList").stop().slideToggle(300);
					$(this).toggleClass('on').siblings().removeClass('on');
					$(this).next(".otherPlayerList").siblings(
							".otherPlayerList").slideUp(300); // 1개씩 펼치기
				});

		$('#myButton').on('click', function() {
			var $btn = $(this).button('loading');
			// business logic...
			$btn.button('reset');
		})
	</script>


</body>
</html>