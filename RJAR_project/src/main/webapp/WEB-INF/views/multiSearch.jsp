<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>멀티서치</title>
<style type="text/css">
.summoner-search-outter-box {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-right: 100px;
}
.matchesList{
	width: 216px;
	height: 600px;
	float: left;
}
#multiList{
	list-style: none;
	border: 1px solid gray;
	width: 1500px;
	height: 600px;
}
</style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript">
		function multiSearch() {
			
// 			$('#multiList').empty();

// 			let liList; // mathcList 반복문으로 10개 뽑기 
			let summoners = $("#multiSearchInput").val();
			
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
							
							for(let i=0; i<data.length; i++){
								
								console.log("길이: "+data.length)
								
								let summaryList = '<div class="tierPosition" style="width:186px; height:50px; float:center">'
											+ '<div class="tier" style="float:left; padding: 3px;">'
												+ '<img src="./resources/tierImg/'+data[i].tier+'.png" width="50px">'
											+ '</div>'
											+ '<div class="mostPosition" style="float:left; padding: 3px;"">'
											+ '<img src="./resources/laneImg/'+data[i].mostLane+'.png" width="40px">'
										+ '</div>'
										+'</div>'
										+ '<div class="summonerName">'
											+ '<a href="" style="float:center;">'
											+ data[i].summonerName
											+ '</a>'
										+ '</div>'
										+ '<div class="lp" style="text-align: center; font-size: 15px;">'
										+ data[i].tier + ' ' +data[i].rank + '(' + data[i].lp + ')'
										+ '</div>'
										+ '<div class="graph">'
											+ '<div class="barGraph" style="padding:5px; width:216px; height:20px;">'
												+ '<div class="base" style="background-color: #e84057; float: left; width:155px; height:16; font-size: 13px;">'
													+ '<div class="win" style="width: '+ data[i].totalWinRate + '%; background-color: #5383e8; float: left;">'
														+ data[i].totalWins + '승'
													+ '</div>'
													+ data[i].totalLosses + '패'
												+ '</div>'
											+ '<strong class="winRatio" style="float:right;">' + data[i].totalWinRate + '%' + '</strong>' 
										+ '</div>';
	
								$('.summonerSummary'+i).html(summaryList); /* div추가 */
	
								let matchesList = '<div class="title" style="padding: 10px; width:186px; height:16px; text-align:center; font-size: 10px;">'+'최근 플레이'+'</div>'
									+'<div class="positions" font-size: 10px;>'
									+'<div class="position"  style="width:100px; height:30px;">'
										+'<div class="positionIcon" style="width:30px; height:30px;">'
											+'<img src="./resources/laneImg/'+data[i].mostLane+'.png" width="30px">' // 최근 10판중 가장 많이 간 라인 이미지
										+'</div>'
										+'<div class="positionInfo">'
										+'<div class="roleRate">'
											// 최근 10판중 가장 많이 간 라인 퍼센트
											+'%'
										+'</div>'
									+'<div class="winRate">'
									+"W/R "
									+'<strong>'+// 모스트 라인 승률
									+data[i].mostLaneWinRate+'%'
									+'</strong>'
								+'</div>'
								+'</div>'
								+'</div>'
								+'</div>'
								+'<ul class="recentGames" style="list-style:none; width:216px; height:336px; padding:15px">'
									+ showList(data, i)
									+'</div>'
									+'</ul>'
						$('.recentMatches'+i).html(matchesList);
							} // end for
						},
						error : function() {
							alert("err");
						}
					});
		} // end func
		
		function showList(data, idx){
			let liList;
			for(let i=0; i<data[idx].kilss.length; i++){
				liList += '<li style="width: 186px; height: 20px;">'
						+'<div class="recentGameImage" style="position:relative; float:left;">'
						// 경로에 챔피언 이미지 등록
							+'<img src="https://ddragon.leagueoflegends.com/cdn/12.16.1/img/champion/'+data[idx].championName[i]+'.png" width="20" alt="'+data[idx].championName[i]+'" title="'+data[idx].championName[i]+'" height="20">'
						+'</div>'
						+'<div class="isWin" style="float:left; width:62px; height:20px;">'
							+'<span class="kill">'+data[idx].kilss[i]+'</span>'
							+' /'
							+'<span class="death">'+data[idx].deaths[i]+'</span>'
							+' /'
							+'<span class="assist">'+data[idx].assists[i]+'</span>'
						+'</div>'
						+'<div class="timeStamp" style="float:right;">'
							+'<div style="position:relative" class="agoTimeDate">'+data[idx].agoTimeDate[i]+'</div>'
						+'</div>'
					+'</li>'
			}
			return liList;
		} // end func
		
	</script>

	<jsp:include page="header.jsp"></jsp:include>
	<div id="main"></div>
	<div id="multiSearch">
		<div id="textarea" style="padding: 10px;">
			<textarea name="multiSearchInput" id="multiSearchInput"
				style="height: 200px; width: 500px;"></textarea>
			<input id="searchBtn" type="button" value="여러명의 소환사 이름으로 요약 검색"
				onclick="multiSearch()">
		</div>

		<div id="content" >
			<ul id="multiList">
				<li class="matchesList">
					<div class="summonerSummary0"></div>
					<div class="recentMatches0"></div>
				</li>
				<li class="matchesList">
					<div class="summonerSummary1"></div>
					<div class="recentMatches1"></div>
				</li>
				<li class="matchesList">
					<div class="summonerSummary2"></div>
					<div class="recentMatches2"></div>
				</li>
				<li class="matchesList">
					<div class="summonerSummary3"></div>
					<div class="recentMatches3"></div>
				</li>
				<li class="matchesList">
					<div class="summonerSummary4"></div>
					<div class="recentMatches4"></div>
				</li>
			</ul>
		</div>

	</div>
	<div id="footer"></div>
</body>
</html>