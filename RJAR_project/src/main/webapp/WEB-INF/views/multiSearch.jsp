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
				data : {"summoners" : summoners},
				dataType : 'json',
				success : function(data) {
					console.log(data)
					
					for(info of data){
						divList += '<tr height="25" align="center">'
						+'<td width="100">'+info.summonerName+'</td>'
						+'<td width="100">'+info.tier+'</td>'
						+'<td width="100">'+info.rank+'</td>'
						+'<td width="100">'+info.lp+'</td>'
						+'<td width="100">'+info.totalWins+'</td>'
						+'<td width="100">'+info.totalLosses+'</td>'
						+'<td width="100">'+info.totalWinRate+'%</td>'
						for(var i = 0; i < 10; i++){
							divList += '<tr height="25" align="center">'
							+'<td width="100">'+info.championName[i]+'</td>'
							+'<td width="100">'+info.lanes[i]+'</td>'
							+'<td width="100">'+info.kilss[i]+'</td>'
							+'<td width="100">'+info.deaths[i]+'</td>'
							+'<td width="100">'+info.assists[i]+'</td>'
							+'<td width="100">'+info.wins[i]+'</td>'
							+'<td width="100">'+info.agoTimeDate[i]+'</td>'
						}
					}
					$('#showDataTable').html(divList); /* div추가 */
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
		<table id="showDataTable">
		</table>
	</div>
	<div id="footer"></div>
</body>
</html>