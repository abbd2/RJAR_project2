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
</style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript">
		function multiSearch() {

			let summaryList;
			let matchesList;
			let liList; // mathcList 반복문으로 10개 뽑기 
			let summoners = $("#multiSearchInput").val();

			console.log("함수")
			$
					.ajax({
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
								
								summaryList += '<div class=tierPosition>'
											+ '<div class=tier>'
												+ '<img src="./resources/tierImg/'+data[i].tier+'.png" width="38px">'
											+ '</div>'
										+ '<div class="summonerName">'
											+ '<a href="">'
											+ data[i].summonerName
											+ '</a>'
										+ '</div>'
										+ '<div class="lp">'
										+ data[i].tier + ' ' + data[i].rank + data[i].lp
										+ '</div>'
										+ '<div class="graph">'
											+ '<div class=barGraph style="weight=185; height=16;">'
												+ '<div class="base" style="backgorund-color: red;>'
													+ '<div class="win" style="width: '+ data[i].totalWinRate + '%">'
														+ data[i].totalWins + '승'
													+ '</div>'
													+ data[i].totalLosses + '패'
												+ '</div>'
												+ '<strong class="winRatio">' + data[i].totalWinRate + '%' + '</strong>' 
											+ '</div>'
										+ '</div>';
	
								$('.summonerSummary').html(summaryList); /* div추가 */
	
								matchesList += '<div class=title>'+'최근 플레이'+'</div>'
									+'<div class="positions">'
									+'<div class="position">'
										+'<div class="positionIcon">'
											+'<img src="">' // 최근 10판중 가장 많이 간 라인 이미지
										+'</div>'
										+'<div class="positionInfo">'
										+'<div class="roleRate">'
											// 최근 10판중 가장 많이 간 라인 퍼센트
											+'%'
									+'</div>'
									+'<div class="winRate">'
									+"W/R "
									+'<strong>'+// 라인 승률
									+'%'
									+'</strong>'
								+'</div>'
								+'</div>'
								+'</div>'
								+'</div>'
								+'<ul class="recentGames">'
									+'<li>'
										+'<div style="pisition:relative" class="recentGameImage">'
										// 경로에 챔피언 이미지 등록
											+'<img src="" width="20" alt="'+data[i].championName[0]+'" title="'+data[i].championName[0]+'" height="20">'
										+'</div>'
										+'<div class="isWin">'
											+'<span class="kill">'+data[i].kilss[0]+'</span>'
											+' /'
											+'<span class="death">'+data[i].deaths[0]+'</span>'
											+' /'
											+'<span class="assist">'+data[i].assists[0]+'</span>'
										+'</div>'
										+'<div class="timeStamp">'
											+'<div style="positionRelative" class="tooltip">'+data[i].agoTimeDate[0]
											+'</div>'
										+'</div>'
									+'</li>'
									+'</div>'
									+'</ul>'
						$('.recentMatches').html(matchesList);
							} // end for
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
					<div class="summonerSummary">
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

						<!-- 						<div class="positions"> -->
						<!-- 							<div class="position"> -->
						<!-- 								<div class="positionIcon"> -->
						<!-- 									<img alt="" src=""> -->
						<!-- 								</div> -->
						<!-- 								<div class="positionInfo"> -->
						<!-- 									<div class="roleRate">승률</div> -->
						<!-- 									<div class="winRate"> -->
						<!-- 										W/R<strong>%</strong> -->
						<!-- 									</div> -->
						<!-- 								</div> -->
						<!-- 							</div> -->
						<!-- 							<div class="position"> -->
						<!-- 								<div class="positionIcon"> -->
						<!-- 									<img alt="" src=""> -->
						<!-- 								</div> -->
						<!-- 								<div class="positionInfo"> -->
						<!-- 									<div class="roleRate">승률</div> -->
						<!-- 									<div class="winRate"> -->
						<!-- 										W/R<strong>%</strong> -->
						<!-- 									</div> -->
						<!-- 								</div> -->
						<!-- 							</div> -->
						<!-- 						</div> -->
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