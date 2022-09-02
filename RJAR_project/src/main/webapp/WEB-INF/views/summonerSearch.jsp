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

<title>summonerSearch</title>
<style type="text/css">
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
	border: 1px solid blue;
	float: left;
	height: 500px;
	width: 70%;
	position: relative;
	padding: 5px;
}

.gameDate {
	width: 15%;
	float: left;
	border: 1px solid blue;
}

.championData {
	width: 30%;
	height: 100px;
	float: left;
	border: 1px solid blue;
}

#imageLevelBox {
	height: 50%;
	border: 1px solid blue;
}
#itemsBox{
    margin-top : 10px;
    height:40px;
    border: 1px solid blue;
}

#champLevel {
	position: relative;
	width: 40px;
	height: 10px;
	left: 5px;
	top: -22px;
}

#items {
	border: 1px solid blue;
}

#dataFlexBox {
	display: flex;
}

#item0, #item1, #item2, #item3, #item4, #item5, #item6 {
	float: left;
	width: 30px;
}

.KDA {
	width: 15%;
	float: left;
	border: 1px solid blue;
}

.CS {
	width: 15%;
	float: left;
	border: 1px solid blue;
}

.teamList {
	width: 25%;
	float: left;
	border: 1px solid blue;
}

.footer {
	height: 20%;
}
</style>

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


	<div class=header>
		<jsp:include page="header.jsp"></jsp:include>
	</div>
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
						<h4 class="card-title" id="summonerName">${name}</h4>
					</div>
				</div>
			</div>
			<div class="card border-secondary mb-3" id="soloRankBox">
				<div class="card-header">솔로랭크</div>
				<div class="card-body">
					<div id="tierImage">
						<img src="./resources/tierImg/${soloTier}.png" width="100px">
					</div>
					<div id="tierInfo">
						<h4 class="card-title">${soloTier}</h4>
						<p class="card-text">${soloLeaguePoint}점</p>
					</div>
					<div id="winLose">
						<p class="card-text">${soloWins}승${soloLosses}패</p>
						<p class="card-text">${soloWinRate}%</p>
					</div>
				</div>
			</div>
			<div class="card border-secondary mb-3" id="soloRankBox">
				<div class="card-header">자유랭크</div>
				<div class="card-body">
					<div id="tierImage">
						<img src="./resources/tierImg/${freeTier}.png" width="100px">
					</div>
					<div id="tierInfo">
						<h4 class="card-title">${freeTier}</h4>
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
			<div class="mainMatch">
				<div class="card">
					<div class="card-body" id="dataFlexBox">
						<div class="gameDate">
							<div class="gameType">일반</div>
							<div class="gameEndTime">23일전</div>
							<div class="winOrDefeat">승리</div>
							<div class="gameDuration">23분</div>
						</div>
						<div class="championData">
							<div id="imageLevelBox">
								<div id="champImage" style="height: 60px">
									<img
										src="https://ddragon.leagueoflegends.com/cdn/12.16.1/img/champion/Aatrox.png"
										width="50px">
								</div>
								<div id="champLevel">
									<span class="badge rounded-pill bg-primary"
										style="color: white">14</span>
								</div>
							</div>
							<div id="itemsBox">
								<div id="items">
									<div id="item0">
										<img
											src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/3108.png"
											width="35px">
									</div>
									<div id="item1">
										<img
											src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/3108.png"
											width="35px">
									</div>
									<div id="item2">
										<img
											src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/3108.png"
											width="35px">
									</div>
									<div id="item3">
										<img
											src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/3108.png"
											width="35px">
									</div>
									<div id="item4">
										<img
											src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/3108.png"
											width="35px">
									</div>
									<div id="item5">
										<img
											src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/3108.png"
											width="35px">
									</div>
									<div id="item6">
										<img
											src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/3108.png"
											width="35px">
									</div>
								</div>
							</div>
						</div>
						<div class="KDA"></div>
						<div class="CS"></div>
						<div class="teamList"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer"></div>
</body>
</html>