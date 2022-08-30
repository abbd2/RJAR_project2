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
	margin-left: 70px;
}

.selectOption {
	width: 150px;
	height: 50px;
	margin: 5px;
}

.champList {
	width: 450px;
}

.champion { /* 이미지 감싼 태그 */
	margin-left: 10px; 
	float: left;
	width: 50px; 
	height: 70px; 
}

.listimg {
	width: 50px; 
	height: 50px; 	
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

.Laneimg {
<<<<<<< HEAD
	float: left;
	width: 550px;
=======
	width: 450px;
>>>>>>> parent of db881f2 (챔피언 분석 css)
	height: 55px;
	margin-bottom: 10px;
}

<<<<<<< HEAD
.tierList {
	float: right;
	width: 650px;
}
=======
>>>>>>> parent of db881f2 (챔피언 분석 css)


<<<<<<< HEAD
.tierList th{
	padding-top: 10px;
	padding-bottom: 10px;
	font-size: 12px;
	text-align: center;"
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
	font-size: 12px;
}
=======
>>>>>>> parent of db881f2 (챔피언 분석 css)

.ui-autocomplete {
	overflow-y: scroll;
	overflow-x: hidden;
}

/* 포지션 이미지 파트 */
/* table.position { */
/* 	border: solid 1px lightgray; */
/* 	width: 440px; */
/* 	margin-left: 70px; */
/* 	margin-bottom: 10px; */
/* 	/* border-collapse: separate; */ */
/* 	border-radius: 8px; */
/* } */

td:nth-child(-n) {
	border-left: solid 1px lightgray;
}

td:nth-child(-n+5) {
	border-right: solid 1px lightgray;
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

small {
	overflow: hidden;
	white-space: nowrap;
	width: 46px;
	text-overflow: ellipsis;
	height: 16px;
	font-size: 12px;
	line-height: 1.33;
	margin: 2px 0 8px
}

#searchInput {
	width: 300px;
	height: 30px;
	margin-bottom: 10px;
	margin-left: 20px;
	border-radius: 5px;
	border: solid 1px lightgray;
}

#searchInput:focus {
	outline: solid 2px #B3CDFF;
}


</style>


</head>
<body>
<<<<<<< HEAD
	<div style="width: 1200px; margin: auto;">
			<form action="">
				<table style="width: 1200px;">
					<tr>
						<td style="width: 450px;">
							<div class="tierVersion">
								<select class="selectOption">
									<option value="platinum" style ="color: #006fff;">+Platinum</option>
									<option value="bronze" style ="color: #964b00;">+Bronze</option>
									<option value="silver" style ="color: #c0c0c0;">+Silver</option>
									<option value="gold" style ="color: #ffd700;">+Gold</option>
									<option value="diamond" style ="color: #87cefa;">+Diamond</option>
								</select>
								<!-- 		</select> <select id="versionSelect" class="selectOption"> -->
								<!-- 			<option value="12.14.456.5556">12.14</option> -->
								<!-- 			<option value="12.13.456.5556">12.13</option> -->
								<!-- 		</select> -->
							</div>
							</td>
						<td class = "laneDiv">
							<button class="lane">
								<span>탑</span>
							</button>
						</td>
						<td class = "laneDiv">
							<button class="lane">
								<span>정글</span>
							</button>
						</td>
						<td class = "laneDiv">
							<button class="lane">
								<span>미드</span>
							</button>
						</td>
						<td class = "laneDiv">
							<button class="lane">
								<span>원딜</span>
							</button>
						</td>
						<td class = "laneDiv">
							<button class="lane">
								<span>서폿</span>
							</button>
						</td>
					</tr>
				</table>
			</form>
		<div class="tierList">
			<table class="tierList">
			<tr>
			<th>순위</th>
			<th colspan = "2"  style = "padding-left:45px;">챔피언</th>
<!-- <td>티어</td> -->
			<th>승률</th>
			<th>픽률</th>
			<th>밴률</th>
			<th>상대하기 어려운 챔피언</th>
			</tr>
			${tierList}
			</table>
		</div>
		<div>
			<input id="searchInput" type="text" placeholder="챔피언 검색(가렌, 그라가스...)">
		</div>

		<div>

			<table class="Laneimg" style="width: 500px;">
				<tr>
					<td class="a_img" id="all"><a class="all"
						href="javascript:Aj('./champion_list','#champion_list')"> <img
							name="All"
							src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-fill.png"
							width="50px;" height="50px;">
					</a></td>
					<td class="a_img" id="top"><a class='aTop'
						href="javascript:Aj('./Top','#champion_list')"> <img
							name='Top'
							src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-top.png"
							width="50px;" height="50px;">
					</a></td>
					<td class="a_img" id="jungle"><a
						href="javascript:Aj('./Jungle','#champion_list')"> <img
							name='Jungle'
							src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-jungle.png"
							width="50px;" height="50px;">
					</a></td>
					<td class="a_img" id="mid"><a
						href="javascript:Aj('./Middle','#champion_list')"> <img
							name='Middle'
							src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-middle.png"
							width="50px;" height="50px;">
					</a></td>
					<td class="a_img" id="bot"><a
						href="javascript:Aj('./Bot','#champion_list')"> <img
							name='Bot'
							src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-bottom.png"
							width="50px;" height="50px;">
					</a></td>
					<td class="a_img" id="supporter"><a
						href="javascript:Aj('./Supporter','#champion_list')"> <img
							name='Supporter'
							src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-utility.png"
							width="50px;" height="50px;">
					</a></td>
					<td class="a_img" id="free"><a
						href="javascript:Aj('free','#champion_list')"> <img
							name='free'
							src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-utility.png"
							width="50px;" height="50px;">
					</a></td>
				</tr>
			</table>
=======
>>>>>>> parent of db881f2 (챔피언 분석 css)

	<form action="">
		<div class="tierVersion">
			<select id="tierSelect" class="selectOption">
				<option value="bronze">+Bronze</option>
				<option value="silver">+Silver</option>
				<option value="gold">+Gold</option>
				<option value="platinum">+Platinum</option>
				<option value="diamond">+Diamond</option>
			</select>
			<!-- 		</select> <select id="versionSelect" class="selectOption"> -->
			<!-- 			<option value="12.14.456.5556">12.14</option> -->
			<!-- 			<option value="12.13.456.5556">12.13</option> -->
			<!-- 		</select> -->
		</div>
	</form>
	<div>
		<input id="searchInput" type="text" placeholder="챔피언 검색(가렌, 그라가스...)">
	</div>
	
	<div style = "width : 450px;">
	<table class="Laneimg">
		<tr>
			<td class="a_img" id="all"><a class="all"
				href="javascript:Aj('./champion_list','#champion_list')"> <img
					name="All"
					src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-fill.png"
					width="40px;" height="40px;">
			</a></td>
			<td class="a_img" id="top"><a class='aTop'
				href="javascript:Aj('./Top','#champion_list')"> <img name='Top'
					src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-top.png"
					width="40px;" height="40px;">
			</a></td>
			<td class="a_img" id="jungle"><a
				href="javascript:Aj('./Jungle','#champion_list')"> <img
					name='Jungle'
					src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-jungle.png"
					width="40px;" height="40px;">
			</a></td>
			<td class="a_img" id="mid"><a
				href="javascript:Aj('./Middle','#champion_list')"> <img
					name='Middle'
					src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-middle.png"
					width="40px;" height="40px;">
			</a></td>
			<td class="a_img" id="bot"><a
				href="javascript:Aj('./Bot','#champion_list')"> <img name='Bot'
					src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-bottom.png"
					width="40px;" height="40px;">
			</a></td>
			<td class="a_img" id="supporter" ><a
				href="javascript:Aj('./Supporter','#champion_list')"> <img
					name='Supporter'
					src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-utility.png"
					width="40px;" height="40px;">
			</a></td>
			<td class="a_img" id="free"><a
				href="javascript:Aj('free','#champion_list')"> <img name='free'
					src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-utility.png"
					width="40px;" height="40px;">
			</a></td>
		</tr>
	</table>
	</div>
	<div class = "champList">
		${nameIdList}
	</div>

	<script type="text/javascript">
		$('.chamImg').click(
				function() {
					let data_eName = $(this).attr("data-eName");
					let data_lane = $(this).attr("data-lane");
					let data_code = $(this).attr("data-code");
					let $form = $("<form></form>");
					$form.attr("action", "champInfo");
					$("<input>").attr("name", "img").val(
							$(this).attr("data-eName")).appendTo($form);
					$("<input>").attr("name", "lane").val(
							$(this).attr("data-lane")).appendTo($form);
					$("<input>").attr("name", "code").val(
							$(this).attr("data-code")).appendTo($form);

					$form.appendTo("body");
					$form.submit();
				});
	</script>
</body>
</html>