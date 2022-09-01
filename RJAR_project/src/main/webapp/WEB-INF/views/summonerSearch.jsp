<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
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

#detail {
	background-color: #3C0;
	float: left;
	height: 500px;
	width: 70%;
	position: relative;
}

#summonerInfo {
	width: 100%;
	margin-bottom: 15px;
}

#profileImageBox {
	width: 100px;
	height : 100px;
	float: left;
	margin-right : 15px;
    justify-content: center;
}
#profileImage{
    position:relative;

}

#Level{
    position: relative;
    left : 25px;
    top : -15px;
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

.footer {
	height: 20%;
}
</style>

</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
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
							<span class="badge rounded-pill bg-primary">${LV}</span>
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
	<div id="detail"></div>
	<div class="footer"></div>
</body>
</html>