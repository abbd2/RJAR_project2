<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멀티서치</title>
<style type="text/css">
/* 배경화면 */
body{
/* 	background-image: url("./resources/multiSearchSample/backg"); */
}
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
	margin-right: 10px;
}
#multiList{
	list-style: none;
	border: 1px solid #9aa4af;
	width: 1460px;
	height: 570px;
	margin: 30px 30px 0px 30px;
}
</style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript">
	
		function multiSearch() {
			
			$('.summonerInfo').remove();
			$('.titleAndPositions').remove();
// 			$('#multiList').empty(); // 자식 태그 삭제

			let summoners = $("#textarea").val();
			
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
							
// -------------------------------------------------------------------------------
								
							
							for(let i=0; i<data.length; i++){
								
								console.log("길이: "+data.length)
								
								let win = '승';
								let loss = '패';
								let showSubImg = '';
								
								if(!data[i].tier){ // null 값이라면
									data[i].tier = "Unranked";
								}
								
								if(data[i].totalWins < 1){ // totalWins 값이 0이면
									win = "";
								}
								
								if(data[i].totalLosses < 1){ // totalLosses 값이 0이면
									loss = "";
								}
								
								if(data[i].subLane != 'none'){
									console.log(data[i].subLane)
									
									showSubImg = '<div class="position"  style="width:100px; height:40px; float:left;">'
														+'<div class="positionIcon" style="width:40px; height:40px; float:left; padding: 3px;">'
														+'<img src="./resources/laneImg/'+data[i].subLane+'.png" width="40px">' // 서브 라인 이미지
													+'</div>' // end positionIcon
													+'<div class="positionInfo" style="width:60px; height:40px; float:left; padding:3px;">'
														+'<div class="roleRate" style="font-size:12px; float:left; width:30px; height:20px; padding:3px;">'
															+data[i].subLaneRate+'%'// 서브 라인 퍼센트
														+'</div>' // end roleRate
														+'<div class="winRate" style="font-size:11px; width:50px; height:20px; padding:3px; color:#5383e8;">'
															+'<strong>'+data[i].subLaneWinRate+'%'+'</strong>' // 모스트 라인 승률
															+'&nbsp'
															+"W/R"
														+'</div>' // end winRate
													+'</div>' // end positionInfo
												+'</div>' // end position
								}
								
								
								let summaryList = '<div class="summonerInfo" style="border-right: 1px solid #9aa4af; width:220px;">' 
										+'<div class="tierPosition" style="width:186px; height:50px; padding-left: 50px;">'
											+ '<div class="tier" style="float:left; padding: 3px;">'
												+ '<img src="./resources/tierImg/'+data[i].tier+'.png" width="50px">'
											+ '</div>'
											+ '<div class="mostPosition" style="float:left; padding: 3px;"">'
											+ '<img src="./resources/laneImg/'+data[i].mostLane+'.png" width="40px">'
										+ '</div>'
										+'</div>'
										+ '<div class="summonerName" style="text-align:center;">'
											+ '<a href="">'
											+ data[i].summonerName
											+ '</a>'
										+ '</div>'
										+ '<div class="lp" style="text-align: center; font-size: 13px;">'
										+ data[i].tier + ' ' +data[i].rank + ' ' + data[i].lp + ' '
										+ '</div>'
										+ '<div class="graph">'
											+ '<div class="barGraph" style="padding:5px; width:216px; height:20px;">'
												+ '<div class="base" style="background-color: #e84057; float: left; width:170px; height:16; font-size: 13px; text-align:right; color:#ffffff; border-radius: 3px;">' // red
													+ '<div class="win" style="width: '+ data[i].totalWinRate + '%; background-color: #5383e8; float: left; text-align:left; border-radius: 3px;">' // blue
														+'&nbsp'
														+ data[i].totalWins + win
													+ '</div>'
													+ data[i].totalLosses + loss
													+'&nbsp'
												+ '</div>'
												// 승률 그래프
											+ '<strong class="winRatio" style="float:right; color:#e84057; font-size: 13px;">' + data[i].totalWinRate + '%' + '</strong>' // red 
										+ '</div>';
									+'</div>'; // end summonerInfo
	
								$('.summonerSummary'+i).html(summaryList); /* div추가 */
	
								let matchesList = '<div class="titleAndPositions" style="border-right: 1px solid #9aa4af; width:220px;">' 
								+'<div class="title" style="padding: 30px 0px 20px 0px; width:186px; height:16px; text-align:center; font-size: 10px;">'+'최근 플레이'+'</div>'
									+'<div class="positions" style="width=200px; height:40px;">'
										+'<div class="position"  style="width:100px; height:40px; float:left;">'
											+'<div class="positionIcon" style="width:40px; height:40px; float:left; padding: 3px;">'
												+'<img src="./resources/laneImg/'+data[i].mostLane+'.png" width="40px">' // 모스트 라인 이미지
											+'</div>' // end positionIcon
											+'<div class="positionInfo" style="width:60px; height:40px; float:left; padding: 3px">'
												+'<div class="roleRate" style="font-size:12px; float:left; width:30px; height:20px; padding:3px;">'
													+data[i].mostLaneRate+'%'// 최근 10판중 가장 많이 간 라인 퍼센트
												+'</div>' // end roleRate
												+'<div class="winRate" style="font-size:11px; width:50px; height:20px; padding:3px; color:#5383e8;">'
													+'<strong>'+data[i].mostLaneWinRate+'%'+'</strong>' // 모스트 라인 승률
													+'&nbsp'
													+"W/R"
												+'</div>' // end winRate
											+'</div>' // end positionInfo
										+'</div>' // end position
										+showSubImg
// 									+'<div class="position"  style="width:100px; height:40px; float:left;">'
// 										+'<div class="positionIcon" style="width:40px; height:40px; float:left; padding: 3px;">'
// 											+'<img src="./resources/laneImg/'+data[i].subLane+'.png" width="40px">' // 서브 라인 이미지
// 										+'</div>' // end positionIcon
// 										+'<div class="positionInfo" style="width:60px; height:40px; float:left; padding:3px;">'
// 											+'<div class="roleRate" style="font-size:12px; float:left; width:30px; height:20px; padding:3px;">'
// 												+data[i].subLaneRate+'%'// 서브 라인 퍼센트
// 											+'</div>' // end roleRate
// 											+'<div class="winRate" style="font-size:11px; width:50px; height:20px; padding:3px; color:#5383e8;">'
// 												+'<strong>'+data[i].subLaneWinRate+'%'+'</strong>' // 모스트 라인 승률
// 												+'&nbsp'
// 												+"W/R"
// 											+'</div>' // end winRate
// 										+'</div>' // end positionInfo
// 									+'</div>' // end position
									+'</div>' // end positions
									
								+'<ul class="recentGames" style="list-style:none; width:186px; height:336px; padding:15px 0px 0px 0px; font-size:13px;">'
									+ showList(data, i)
								+'</ul>' // end recentGames
							+'</div>'; // end titleAndPositions
								$('.recentMatches'+i).html(matchesList);
							} // end for
						},
						error : function() {
							alert("err");
						}
					});
		} // end func
		
		function showList(data, idx){
			
			let liList = '';
			
			
			for(let i=0; i<data[idx].wins.length; i++){
				
				let winColor = '#ecf2ff'; // blue
				let kdaColor = '#4171d6'; // blue
				
				if(data[idx].wins[i] == 'false'){
					winColor = '#fff1f3';
					kdaColor = '#d31a45';
				}
				
				
				liList += '<li class="summonerMatchesList" style="width: 200px; height: 25px; margin:5px 0px 0px 0px;">'
						+'<div class="recentGameImage" style="position:relative; float:left;">'
						// 경로에 챔피언 이미지 등록
							+'<img src="https://ddragon.leagueoflegends.com/cdn/12.16.1/img/champion/'+data[idx].championName[i]+'.png" width="25" height="25" alt="'+data[idx].championName[i]+'" title="'+data[idx].championName[i]+'"'
							+'style=" border-radius: 3px;">'
						+'</div>'
						+'<div class="isWin" style="float:left; width:80px; height:25px; border-radius: 3px; margin: 0px 0px 0px 10px; text-align:center; background-color:'+winColor+'; color:'+kdaColor+';">'
							+'<span class="kill">'+data[idx].kills[i]+'</span>'
							+' /'
							+'<span class="death">'+data[idx].deaths[i]+'</span>'
							+' /'
							+'<span class="assist">'+data[idx].assists[i]+'</span>'
						+'</div>'
						+'<div class="timeStamp" style="float:right;">'
							+'<div style="position:relative; color:#758592;" class="agoTimeDate" >'+data[idx].agoTimeDate[i]+'</div>'
						+'</div>'
					+'</li>'
			}
			return liList;
		} // end func
		
	</script>

	<jsp:include page="header.jsp"></jsp:include>
	<div id="main"></div>
	<div id="multiSearch">
		<div id="multiSearchInput" style="height: 250px; widht: 1070px;">
			<div id="search" style=" float: left; hiehgt: 250px; width: 610px; margin: 30px 30px 10px 30px; z-index: 1;">
				<textarea id="textarea" style="height: 200px; width: 600px; margin-bottom:4px;"></textarea>
				<input id="searchBtn" type="button" value="여러명의 소환사 이름으로 요약 검색" onclick="multiSearch()">
			</div>
			<div id="sample" style="float: left; width: 820px; height: 240px; margin: 30px 0px 30px 0px; text-align: center;">
				<img alt="멀티서치 샘플" src="./resources/multiSearchSample/multiSearchSample.PNG" style="width: 425px; height: 240px; float: left;">
				<strong style="width: 375px; height: 240px; float: right; padding: 80px 0px 0px 0px;">채팅창의 내용을 붙여 넣으면, 게임에 참여중인 모든 유저를 요약하여 볼 수 있습니다!</strong>
			</div>
		</div>

		<div id="content">
			<ul id="multiList">
				<li class="matchesList">
					<div class="summonerSummary0" style="width: 200px;"></div>
					<div class="recentMatches0" style="width: 200px;"></div>
				</li>
				<li class="matchesList">
					<div class="summonerSummary1" style="width: 200px;"></div>
					<div class="recentMatches1" style="width:200px;"></div>
				</li>
				<li class="matchesList">
					<div class="summonerSummary2" style="width: 200px;"></div>
					<div class="recentMatches2" style="width:200px;"></div>
				</li>
				<li class="matchesList">
					<div class="summonerSummary3" style="width: 200px;"></div>
					<div class="recentMatches3" style="width:200px;"></div>
				</li>
				<li class="matchesList">
					<div class="summonerSummary4" style="width: 200px;"></div>
					<div class="recentMatches4" style="width:200px;"></div>
				</li>
			</ul>
		</div>

	</div>
	<div id="footer"></div>
</body>
</html>