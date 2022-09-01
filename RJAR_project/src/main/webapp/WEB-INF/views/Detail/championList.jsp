<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">
.tierVersion {
	width: 549px;
}

#selectOption {
	width: 200px;
	height: 55px;
	margin: 5px;
	border-radius: 7px;
	border: 2px solid black;
	font-size: 20px;
	font-weight: bold;
}

option {
	font-weight: bold;
}

.laneTd {
	border: 1px solid gray;
	width: 200px;
	padding: 0px;
}

.lane_ {
	width: 130px;
	height: 66px;
	background-color: white;
	border: hidden;
	text-align: center;
	font-weight: bold;
}

.champList {
	width: 545px;
}

.champion { /* 이미지 감싼 태그 */
	margin-left: 10px;
	margin-top: 3px;
	float: left;
	width: 60px;
	height: 80px;
}

.listimg {
	width: 60px;
	height: 60px;
}

.championName {
	margin: auto;
	display: block;
	width: 50px;
	/* 이 두께를 넘어가야 ..처리됨 */
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	font-weight: bold;
}

.laneimg {
	float: left;
	width: 500px;
	height: 55px;
	margin-bottom: 10px;
	border-radius: 5px;
}

.laneimg tr td{
	padding: 0px;
}
#free{
	background-color: white;
    border: hidden;
}

.a_img{
	background-color: white;
    border: hidden;
}

.tierList {
	float: right;
	width: 650px;
}

.tierList th {
	padding-top: 10px;
	padding-bottom: 10px;
	font-size: 12px;
	text-align: center;
	"
}

.tierList tr {
	border-top: solid 1px lightgray;
}

.tierChamp { /* 티어리스트 챔피언 사진 - 나중에 작업 */
	
}

.tierChampimg {
	width: 45px;
	height: 45px;
}

.counter {
	float: left;
	width: 30px;
	height: 30px;
}

.counterimg {
	width: 30px;
	height: 30px;
}

.kr_name {
	display: block;
	width: 180px;
	margin-left: 0px;
	margin-top: 10px;
	text-align: center;
}

.rate {
	width: 80px;
	font-weight: bold;
}

small {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	height: 16px;
	text-align: center;
	font-size: 15px;
	line-height: 1.33;
}

font {
	margin-left: 17px;
	font-size: 13px;
}

.ui-autocomplete {
	overflow-y: scroll;
	overflow-x: hidden;
}

.chamImg {
	border: none;
	width: 100px;
	float: left;
	overflow: auto;
	margin-left: 10px;
}

.i_cham {
	border-radius: 8px;
}

#searchInput {
	width: 500px;
	height: 45px;
	margin-bottom: 10px;
	border-radius: 5px;
	border: solid 2px lightgray;
}

#searchInput:focus {
	outline: solid 2px #B3CDFF;
}
</style>


</head>
<body>
	<div style="width: 1200px; margin: auto;">
		<table style="width: 1200px;">
			<tr>
				<td style="width: 450px;">
					<form id="select" action="tierOrLane" method="get">
						<div class="tierVersion">
							<select id="selectOption" name="tier">
								<option id="bronze" value="bronze" style="color: #964b00;">+Bronze</option>
								<option id="silver" value="silver" style="color: #c0c0c0;">+Silver</option>
								<option id="gold" value="gold" style="color: #ffd700;">+Gold</option>
								<option id="platinum" value="platinum" style="color: #006fff;">+Platinum</option>
								<option id="diamond" value="diamond" style="color: #87cefa;">+Diamond</option>
							</select>
						</div>
						<input class="lane_" value="TOP" name="lane" type="hidden">
					</form>
				</td>
				<td class="laneTd">
					<button class="lane_" value="TOP">
						<span>탑</span>
					</button>
				</td>
				<td class="laneTd">
					<button class="lane_" value="JUNGLE">
						<span>정글</span>
					</button>
				</td>
				<td class="laneTd">
					<button class="lane_" value="MIDDLE">
						<span>미드</span>
					</button>
				</td>
				<td class="laneTd">
					<button class="lane_" value="BOTTOM">
						<span>원딜</span>
					</button>
				</td>
				<td class="laneTd">
					<button class="lane_" value="UTILITY">
						<span>서폿</span>
					</button>
				</td>
			</tr>
		</table>

		<div class="tierList">
				<table class="tierList">${tierList}
				</table>
		</div>
		<div>
			<input id="searchInput" type="text" placeholder="챔피언 검색(가렌, 그라가스...)">
		</div>

		<div>
			<table class="laneimg">
				<tr>
					<td><button class="a_img" value = "all"><img
							name="All"
							src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-fill.png"
							width="50px;" height="50px;"></button>
					</td>
					<td><button class="a_img" value = "TOP"><img
							name='Top'
							src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-top.png"
							width="50px;" height="50px;"></button>
					</td>
					<td><button class="a_img" value = "JUNGLE"><img
							name='Jungle'
							src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-jungle.png"
							width="50px;" height="50px;"></button>
					</td>
					<td><button class="a_img" value = "MIDDLE"><img
							name='Middle'
							src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-middle.png"
							width="50px;" height="50px;"></button>
					</td>
					<td><button class="a_img" value = "BOTTOM"><img
							name='Bot'
							src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-bottom.png"
							width="50px;" height="50px;"></button>
					</td>
					<td><button class="a_img" value = "UTILITY"><img
							name='Supporter'
							src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-utility.png"
							width="50px;" height="50px;"></button>
					</td>
					<td><button id = "free"><img
							name='free'
							src="https://s-lol-web.op.gg/images/icon/icon-rotation.svg"
							width="50px;" height="50px;"></button>
					</td>
				</tr>
			</table>

		</div>
		<div class="champList">${nameIdList}</div>
	</div>
</body>
<script type="text/javascript">
	
</script>
</html>