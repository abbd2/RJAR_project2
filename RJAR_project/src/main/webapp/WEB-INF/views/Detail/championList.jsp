<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">
.tierVersion{
	width: 549px;
}

.selectOption {
	width: 200px;
	height: 55px;
	margin: 5px;
	color: #006fff;
	border-radius: 7px;
	border: 2px solid black;
 	font-size: 20px;
	font-weight: bold;
}

option{
	font-weight: bold;
}

.laneDiv{
	border: 1px solid gray;
	width: 200px;
}

.lane {
	margin-left: 18px;;
	width: 89px;
	height: 60px;
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

.Laneimg {
	float: left;
	width: 500px;
	height: 55px;
	margin-bottom: 10px;
}

.tierList {
	float: right;
	width: 600px;
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
	font-size: 12px;
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
/* 	margin-left: 20px; */
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
						<td class = "laneDiv" style="width: 110px;">
							<button class="lane">
								<span>탑</span>
							</button>
						</td>
						<td class = "laneDiv" style="width: 110px">
							<button class="lane">
								<span>정글</span>
							</button>
						</td>
						<td class = "laneDiv" style="width: 110px">
							<button class="lane">
								<span>미드</span>
							</button>
						</td>
						<td class = "laneDiv" style="width: 110px">
							<button class="lane">
								<span>원딜</span>
							</button>
						</td>
						<td class = "laneDiv" style="width: 110px">
							<button class="lane">
								<span>서폿</span>
							</button>
						</td>
					</tr>
				</table>
			</form>
		<div class="tierList">
			<table class="tierList">${tierList}
			</table>
		</div>
		<div>
			<input id="searchInput" type="text" placeholder="챔피언 검색(가렌, 그라가스...)">
		</div>

		<div style="width: 500px;">

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

		</div>
		<div class="champList">${nameIdList}</div>
	</div>
</body>
<script type="text/javascript">
	$('.chamImg').click(
			function() {
				let data_eName = $(this).attr("data-eName");
				let data_lane = $(this).attr("data-lane");
				let data_code = $(this).attr("data-code");
				let $form = $("<form></form>");
				$form.attr("action", "champInfo");
				$("<input>").attr("name", "img")
						.val($(this).attr("data-eName")).appendTo($form);
				$("<input>").attr("name", "lane")
						.val($(this).attr("data-lane")).appendTo($form);
				$("<input>").attr("name", "code")
						.val($(this).attr("data-code")).appendTo($form);

				$form.appendTo("body");
				$form.submit();
			});
</script>
</html>