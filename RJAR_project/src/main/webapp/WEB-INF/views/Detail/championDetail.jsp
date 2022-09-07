<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
   integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
   crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.js"
   integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
   crossorigin="anonymous"></script>

<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
   integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
   integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
   crossorigin="anonymous"></script>

<style type="text/css">
#champion_profile{
    width: 100%;
    height: 300px;
    background-color: antiquewhite;
}

#champ_img_box{
    width: 600px;
    height: 300px;
    background-color: blue;
}

#champ_img_box2{
    margin-left: 20px;
    margin-top: 0px;
    width: 150px;
    height: 200px;
    /* background-color: aliceblue; */
    float: left;
}

#lane_btn{
    width: 150px;
    height: 40px;
    margin-top: 40px;
    margin-left: 30px;
}

#champ_img{
    margin-top: 30px;
    margin-left: 10px;
    width: 160px;
    height: 170px;
}

.champ_skill{
    margin-top: 20px;
    width: 45px;
    height: 45px;
}

#champ_skill_box{
    margin-left: 30px;
    float: left;
}

#champ_skill_box>div{
    float: left;
    margin-left: 5px;
}

#nav{
    width: 100%;
    height: 50px;
    background-color: #77af9c;
}

#nav>nav>ul>span>li{
    margin-left: 80px;
    font-size: 20px;
    margin-top: 10px;
    float: left;
}

#nav>nav>ul>span>li>a{
    text-decoration-line: none;
    color: black;
}

#build_box{
    background-color: antiquewhite;
    overflow: hidden;
    width: 100%;
    height: 1080px;
}

#rune_box1{
    width: 1200px;
    height: 1080px;
    background-color: #d7fff1;
    float: left;
    margin-top: 20px;
    margin-left: 10px;
    border-radius: 8px;
}
#rune_box2{
    width: 1200px;
    height: 1080px;
    background-color: #d7fff1;
    float: left;
    margin-top: 20px;
    margin-left: 10px;
    border-radius: 8px;
    display: none;
}

/* .rune_table1{ */
/*      margin-top: 150px; */
/* } */

.rune_table,.rune_table2{
	float:left;
   	text-align: center;
}

.rune_table>thead>tr>th,
.rune_table2>thead>tr>th{
    width: 280px;
    height: 50px;
    /* border: solid 2px black; */
}

.rune_table>thead>tr>th>img,tbody>tr>th>img,
.rune_table2>thead>tr>th>img,tbody>tr>th>img{
    width: 45px;
    height: 45px;
    margin-left: 5px;
    margin-right: 5px;
}

#under1,#under1_1,#under2,#under1_2,#under3,#under1_3,#under4,#t2_under1,
#t2_under1_1,#t2_under2,#t2_under1_2,#t2_under3,#t2_under1_3,#t2_under4{
    border-right: 1px solid gray;
}

#under1>img,
#t2_under1>img{
    margin-bottom: 10px;
    margin-top: 10px;
}

#under1>img,#under2>img, #under1_1>img,#under1_2>img,#under3>img,
#t2_under2>img, #t2_under1_1>img,#t2_under1_2>img,#t2_under3>img{
    margin-bottom: 10px;
}

.runeWinPick{
	width: 200px;
    height: 280px;
    background-color: white;
    float: left;
    padding-top: 100px;
}

.runeWin{
    font-size: 25px;
    margin-left: 70px;
    margin-top: 100px;
}

.runePick{
    font-size: 25px;
    margin-left: 70px;
}

.perks>img,.t2_perks>img{
    background-color: black;
    border-radius: 100px;
    width: 35px;
    height: 35px;
    margin-top: 8px;
    margin-bottom: 8px;
    margin-left:8px;
    margin-right:8px;
}

#spell_box{
    float: left;
    background-color: aquamarine;
    margin-left: 15px;
    margin-top: 20px;
    margin-right: 15px;
    width: 530px;
    height: 200px;
    border-radius: 8px;
}

#spell_table{
    text-align: left;
    width: 500px;
    border: solid 1px;
    margin-top: 25px;
    margin-left: 15px;
}

#start_box{
    float: left;
    background-color: aquamarine;
    margin-left: 15px;
    margin-top: 20px;
    margin-right: 15px;
    width: 530px;
    height: 200px;
    border-radius: 8px;
}

#start_table{
    text-align: left;
    width: 500px;
    border: solid 1px;
    margin-top: 25px;
    margin-left: 15px;
}
</style>
</head>
<body>
   <jsp:include page="../header.jsp"></jsp:include>
   
   <div id="champion_profile">
    <div id="champ_img_box">
        <div id="lane_btn_box">
            <button id="lane_btn" value ="${lane1}">${lane1}</button>
            <button id="lane_btn" value ="${lane2}">${lane2}</button>
        </div>
        <div id="champ_img_box2">
            <img id="champ_img" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/champion/${championName}.png" alt="">
        </div>
        <div id="champ_text">
                <h2 style="margin-top: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;${championName}-${lane1}</h2><br>
                <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;챔피언 티어 : 3티어</h5>
         </div>
         <div id="champ_skill_box">
            <div id="p">
                <img class="champ_skill" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/passive/${championName}_Passive.png" alt="">
            </div>
            <div id="q">
                <img class="champ_skill" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/spell/${championName}Q.png" alt="">
            </div>
            <div id="w">
                <img class="champ_skill" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/spell/${championName}W.png" alt="">
            </div>
            <div id="e">
                <img class="champ_skill" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/spell/${championName}E.png" alt="">
            </div>
            <div id="r">
                <img class="champ_skill" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/spell/${championName}R.png" alt="">
            </div>
        </div>
    </div>
</div>
<div id="nav">
    <nav>
        <ul style="list-style: none; margin: 0px;">
            <span><li><a href="#">빌드</a></li></span>
            <span><li><a href="#">룬</a></li></span>
            <span><li><a href="#">카운터</a></li></span>
        </ul>
    </nav>
</div>
<div>
<button type="button" id="top1" class="btn btn-primary" style="width:100px; height:50px;">
TOP1
</button>
<button type="button" id="top2" class="btn btn-primary" style="width:100px; height:50px;">
TOP2
</button>
</div>
<div id="build_box">
    <div id="rune_box1">
        <table class="rune_table">
        <thead>
        <tr>
        <th style="border-right: 1px solid gray;">
        	${mainRunePng.get(0)}
        </th>
        </tr>
        </thead> <!-- 꼭대기 -->
        
        <tbody>
     	<c:choose>
     	<c:when test="${runes1.getMain_rune()==8100||runes1.getMain_rune()==8000}">
     		<tr>
     		<th id="under1">
     		${mainRunePng.get(1)}
     		${mainRunePng.get(2)}
     		${mainRunePng.get(3)}
     		${mainRunePng.get(4)}
     		</th>
     		</tr>
     	</c:when>
     	 <c:otherwise >
     	 	<tr>
     		<th id="under1">
     		${mainRunePng.get(1)}
     		${mainRunePng.get(2)}
     		${mainRunePng.get(3)}
     		</th>
     		</tr>
     	 </c:otherwise>
     	</c:choose><!-- 4층 -->
     	
     	<c:choose>
     	<c:when test="${runes1.getMain_rune()==8100||runes1.getMain_rune()==8000}">
     		<tr>
     		<th id="under2">
     		${mainRunePng.get(5)}
     		${mainRunePng.get(6)}
     		${mainRunePng.get(7)}
     		</th>
     		</tr>
     		<tr>
     		<th id="under3">
     		${mainRunePng.get(8)}
     		${mainRunePng.get(9)}
     		${mainRunePng.get(10)}
     		</th>
     		</tr>
     	</c:when>
     	 <c:otherwise >
     	 	<tr>
     		<th id="under2">
     		${mainRunePng.get(4)}
     		${mainRunePng.get(5)}
     		${mainRunePng.get(6)}
     		</th>
     		</tr>
     	 	<tr>
     		<th id="under3">
     		${mainRunePng.get(7)}
     		${mainRunePng.get(8)}
     		${mainRunePng.get(9)}
     		</th>
     		</tr>
     	 </c:otherwise>
     	</c:choose><!-- 3층 2층 -->
     	
     	<c:choose>
     	<c:when test="${runes1.getMain_rune()==8100}">
     		<tr>
     		<th id="under4">
     		${mainRunePng.get(11)}
     		${mainRunePng.get(12)}
     		${mainRunePng.get(13)}
     		${mainRunePng.get(14)}
     		</th>
     		</tr>
     	</c:when>
     	<c:when test="${runes1.getMain_rune()==8000}">
     		<tr>
     		<th id="under4">
     		${mainRunePng.get(11)}
     		${mainRunePng.get(12)}
     		${mainRunePng.get(13)}
     		</th>
     		</tr>
     	</c:when>
     	<c:otherwise >
     		<tr>
     		<th id="under4">
     		${mainRunePng.get(10)}
     		${mainRunePng.get(11)}
     		${mainRunePng.get(12)}
     		</th>
     		</tr>
     	</c:otherwise>
     	</c:choose>
     	</tbody>
        </table> <!-- main runeBox-->
        
        <table class ="rune_table">
        <thead>
        	<tr>
        <th style="border-right: 1px solid gray;">
        	${subRunePng.get(0)}
        </th>
        </tr>
        </thead>
        <tr><th style="height: 68px; border-right: 1px solid gray;"></th></tr>
        <c:choose>
     	<c:when test="${runes1.getSub_rune()==8100||runes1.getSub_rune()==8000}">
     		<tr>
     		<th id="under2">
     		${subRunePng.get(5)}
     		${subRunePng.get(6)}
     		${subRunePng.get(7)}
     		</th>
     		</tr>
     		<tr>
     		<th id="under1_1">
     		${subRunePng.get(8)}
     		${subRunePng.get(9)}
     		${subRunePng.get(10)}
     		</th>
     		</tr>
     	</c:when>
     	 <c:otherwise >
     	 	<tr>
     		<th id="under1_1">
     		${subRunePng.get(4)}
     		${subRunePng.get(5)}
     		${subRunePng.get(6)}
     		</th>
     		</tr>
     	 	<tr>
     		<th id="under1_2">
     		${subRunePng.get(7)}
     		${subRunePng.get(8)}
     		${subRunePng.get(9)}
     		</th>
     		</tr>
     	 </c:otherwise>
     	</c:choose>
     	
     	<c:choose>
     	<c:when test="${runes1.getSub_rune()==8100}">
     		<tr>
     		<th id="under1_3">
     		${subRunePng.get(11)}
     		${subRunePng.get(12)}
     		${subRunePng.get(13)}
     		${subRunePng.get(14)}
     		</th>
     		</tr>
     	</c:when>
     	<c:when test="${runes1.getSub_rune()==8000}">
     		<tr>
     		<th id="under1_3">
     		${subRunePng.get(11)}
     		${subRunePng.get(12)}
     		${subRunePng.get(13)}
     		</th>
     		</tr>
     	</c:when>
     	<c:otherwise >
     		<tr>
     		<th id="under1_3">
     		${subRunePng.get(10)}
     		${subRunePng.get(11)}
     		${subRunePng.get(12)}
     		</th>
     		</tr>
     	</c:otherwise>
     	</c:choose>
        </table> <!-- sub_runeBox -->
        
        <table class="rune_table">
        <thead>
        <tr><th style="height: 50px; border-right: 1px solid gray;"></th></tr>
        </thead>
        <tr><th style="height: 70px; border-right: 1px solid gray;"></th></tr>
        <tr>
        <th class="perks" style="border-right: 1px solid gray;">
        <img id ="statperks1" src="https://opgg-static.akamaized.net/images/lol/perkShard/5008.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5008">
        <img id ="statperks2" src="https://opgg-static.akamaized.net/images/lol/perkShard/5005.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5005">
        <img id ="statperks3" src="https://opgg-static.akamaized.net/images/lol/perkShard/5007.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5007">
        </th>
        </tr>
        <tr>
        <th class="perks" style="border-right: 1px solid gray;">
        <img id ="statperks4" src="https://opgg-static.akamaized.net/images/lol/perkShard/5008.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5008">
        <img id ="statperks5" src="https://opgg-static.akamaized.net/images/lol/perkShard/5002.png?image=q_auto,f_webp,w_48&v=1662451509143"
        data-value = "5002">
        <img id ="statperks6" src="https://opgg-static.akamaized.net/images/lol/perkShard/5003.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5003">
        </th>
        </tr>
        <tr>
        <th class="perks" style="border-right: 1px solid gray;">
        <img id ="statperks7" src="https://opgg-static.akamaized.net/images/lol/perkShard/5001.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5001">
        <img id ="statperks8" src="https://opgg-static.akamaized.net/images/lol/perkShard/5002.png?image=q_auto,f_webp,w_48&v=1662451509143"
        data-value = "5002">
        <img id ="statperks9" src="https://opgg-static.akamaized.net/images/lol/perkShard/5003.png?image=q_auto,f_webp,w_48&v=1662451509143"
        data-value = "5003">
        </th>
        </tr>
        </table>
        <div class="runeWinPick">
        <font class="runeWin">${rune_win1}%</font> <br> 
        <font class="runePick">${rune_pick1}</font>   
        <font style="color: gray;">게임</font>
        </div>
    </div><!-- rune_box1 -->
    
    
    
    
    
    
    
    <div id = "rune_box2">
        <table class="rune_table2">
        <thead>
        <tr>
        <th style="border-right: 1px solid gray;">
        	${mainRunePng2.get(0)}
        </th>
        </tr>
        </thead> <!-- 꼭대기 -->
        
        <tbody>
     	<c:choose>
     	<c:when test="${runes2.getMain_rune()==8100||runes2.getMain_rune()==8000}">
     		<tr>
     		<th id="t2_under1">
     		${mainRunePng2.get(1)}
     		${mainRunePng2.get(2)}
     		${mainRunePng2.get(3)}
     		${mainRunePng2.get(4)}
     		</th>
     		</tr>
     	</c:when>
     	 <c:otherwise >
     	 	<tr>
     		<th id="t2_under1">
     		${mainRunePng2.get(1)}
     		${mainRunePng2.get(2)}
     		${mainRunePng2.get(3)}
     		</th>
     		</tr>
     	 </c:otherwise>
     	</c:choose><!-- 4층 -->
     	
     	<c:choose>
     	<c:when test="${runes2.getMain_rune()==8100||runes2.getMain_rune()==8000}">
     		<tr>
     		<th id="t2_under2">
     		${mainRunePng2.get(5)}
     		${mainRunePng2.get(6)}
     		${mainRunePng2.get(7)}
     		</th>
     		</tr>
     		<tr>
     		<th id="t2_under3">
     		${mainRunePng2.get(8)}
     		${mainRunePng2.get(9)}
     		${mainRunePng2.get(10)}
     		</th>
     		</tr>
     	</c:when>
     	 <c:otherwise >
     	 	<tr>
     		<th id="t2_under2">
     		${mainRunePng2.get(4)}
     		${mainRunePng2.get(5)}
     		${mainRunePng2.get(6)}
     		</th>
     		</tr>
     	 	<tr>
     		<th id="t2_under3">
     		${mainRunePng2.get(7)}
     		${mainRunePng2.get(8)}
     		${mainRunePng2.get(9)}
     		</th>
     		</tr>
     	 </c:otherwise>
     	</c:choose><!-- 3층 2층 -->
     	
     	<c:choose>
     	<c:when test="${runes2.getMain_rune()==8100}">
     		<tr>
     		<th id="t2_under4">
     		${mainRunePng2.get(11)}
     		${mainRunePng2.get(12)}
     		${mainRunePng2.get(13)}
     		${mainRunePng2.get(14)}
     		</th>
     		</tr>
     	</c:when>
     	<c:when test="${runes2.getMain_rune()==8000}">
     		<tr>
     		<th id="t2_under4">
     		${mainRunePng2.get(11)}
     		${mainRunePng2.get(12)}
     		${mainRunePng2.get(13)}
     		</th>
     		</tr>
     	</c:when>
     	<c:otherwise >
     		<tr>
     		<th id="t2_under4">
     		${mainRunePng2.get(10)}
     		${mainRunePng2.get(11)}
     		${mainRunePng2.get(12)}
     		</th>
     		</tr>
     	</c:otherwise>
     	</c:choose>
     	</tbody>
        </table> <!-- main runeBox-->
        
        <table class ="rune_table2">
        <thead>
        	<tr>
        <th style="border-right: 1px solid gray;">
        	${subRunePng2.get(0)}
        </th>
        </tr>
        </thead>
        <tr><th style="height: 68px; border-right: 1px solid gray;"></th></tr>
        <c:choose>
     	<c:when test="${runes2.getSub_rune()==8100||runes2.getSub_rune()==8000}">
     		<tr>
     		<th id="t2_under1_1">
     		${subRunePng2.get(5)}
     		${subRunePng2.get(6)}
     		${subRunePng2.get(7)}
     		</th>
     		</tr>
     		<tr>
     		<th id="t2_under1_2">
     		${subRunePng2.get(8)}
     		${subRunePng2.get(9)}
     		${subRunePng2.get(10)}
     		</th>
     		</tr>
     	</c:when>
     	 <c:otherwise >
     	 	<tr>
     		<th id="under1_1">
     		${subRunePng2.get(4)}
     		${subRunePng2.get(5)}
     		${subRunePng2.get(6)}
     		</th>
     		</tr>
     	 	<tr>
     		<th id="t2_under1_2">
     		${subRunePng2.get(7)}
     		${subRunePng2.get(8)}
     		${subRunePng2.get(9)}
     		</th>
     		</tr>
     	 </c:otherwise>
     	</c:choose>
     	
     	<c:choose>
     	<c:when test="${runes2.getSub_rune()==8100}">
     		<tr>
     		<th id="t2_under1_2">
     		${subRunePng2.get(11)}
     		${subRunePng2.get(12)}
     		${subRunePng2.get(13)}
     		${subRunePng2.get(14)}
     		</th>
     		</tr>
     	</c:when>
     	<c:when test="${runes2.getSub_rune()==8000}">
     		<tr>
     		<th id="t2_under1_3">
     		${subRunePng2.get(11)}
     		${subRunePng2.get(12)}
     		${subRunePng2.get(13)}
     		</th>
     		</tr>
     	</c:when>
     	<c:otherwise >
     		<tr>
     		<th id="t2_under1_3">
     		${subRunePng2.get(10)}
     		${subRunePng2.get(11)}
     		${subRunePng2.get(12)}
     		</th>
     		</tr>
     	</c:otherwise>
     	</c:choose>
        </table> <!-- sub_runeBox -->
        
        <table class="rune_table2">
        <thead>
        <tr><th style="height: 50px; border-right: 1px solid gray;"></th></tr>
        </thead>
        <tr><th style="height: 70px; border-right: 1px solid gray;"></th></tr>
        <tr>
        <th class="t2_perks" style="border-right: 1px solid gray;">
        <img id ="statperks10" src="https://opgg-static.akamaized.net/images/lol/perkShard/5008.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5008">
        <img id ="statperks11" src="https://opgg-static.akamaized.net/images/lol/perkShard/5005.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5005">
        <img id ="statperks12" src="https://opgg-static.akamaized.net/images/lol/perkShard/5007.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5007">
        </th>
        </tr>
        <tr>
        <th class="t2_perks" style="border-right: 1px solid gray;">
        <img id ="statperks13" src="https://opgg-static.akamaized.net/images/lol/perkShard/5008.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5008">
        <img id ="statperks14" src="https://opgg-static.akamaized.net/images/lol/perkShard/5002.png?image=q_auto,f_webp,w_48&v=1662451509143"
        data-value = "5002">
        <img id ="statperks15" src="https://opgg-static.akamaized.net/images/lol/perkShard/5003.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5003">
        </th>
        </tr>
        <tr>
        <th class="t2_perks" style="border-right: 1px solid gray;">
        <img id ="statperks16" src="https://opgg-static.akamaized.net/images/lol/perkShard/5001.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5001">
        <img id ="statperks17" src="https://opgg-static.akamaized.net/images/lol/perkShard/5002.png?image=q_auto,f_webp,w_48&v=1662451509143"
        data-value = "5002">
        <img id ="statperks18" src="https://opgg-static.akamaized.net/images/lol/perkShard/5003.png?image=q_auto,f_webp,w_48&v=1662451509143"
        data-value = "5003">
        </th>
        </tr>
        </table>
        <div class="runeWinPick">
        <font class="runeWin">${rune_win2}%</font> <br> 
        <font class="runePick">${rune_pick2}</font>   
        <font style="color: gray;">게임</font>
        </div>
     </div> <!--end rune_box   -->







    <div id="spell_box">
        <table id="spell_table">
            <thead style="font-size: 20px;">
                <tr>
                    <th>소환사 주문</th>
                    <th>픽률</th>
                    <th>승률</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>
                        <img style="width: 50px; height: 50px; margin-right: 10px;" src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/spell/${spell1}.png" alt="">
                        <img style="width: 50px; height: 50px;" src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/spell/${spell2}.png" alt="">
                    </th>
                    <th>
                        픽률<br>
                        게임수
                    </th>
                    <th>
                        승률
                    </th>
                </tr>
                <tr>
                    <th>
                        <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/spell/SummonerBoost.png" alt="">
                        <img style="width: 50px; height: 50px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/spell/SummonerBoost.png" alt="">
                    </th>
                    <th>
                        픽률<br>
                        게임수
                    </th>
                    <th>
                        승률
                    </th>
                </tr>
            </tbody>
        </table>
    </div> <!-- end spell_box -->
    
    <div id="start_box">
        <table id="start_table">
            <thead style="font-size: 20px;">
                <tr>
                    <th>시작 아이템</th>
                    <th>픽률</th>
                    <th>승률</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>
                        <img style="width: 50px; height: 50px; margin-right: 10px;" src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/spell/SummonerBoost.png" alt="">
                        <img style="width: 50px; height: 50px;" src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/spell/SummonerBoost.png" alt="">
                    </th>
                    <th>
                        픽률<br>
                        게임수
                    </th>
                    <th>
                        승률
                    </th>
                </tr>
                <tr>
                    <th>
                        <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/spell/SummonerBoost.png" alt="">
                        <img style="width: 50px; height: 50px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/spell/SummonerBoost.png" alt="">
                    </th>
                    <th>
                        픽률<br>
                        게임수
                    </th>
                    <th>
                        승률
                    </th>
                </tr>
            </tbody>
        </table>
    </div> <!-- end start_box -->
        
    </div> <!--end build_box-->
</body>
<script type="text/javascript">
statperks_list =[${statperks1}, ${statperks2}, ${statperks3}];
statperks_list2 = [${statperks2_1}, ${statperks2_2}, ${statperks2_3}];
	
$(function () {
	statperks_ids1 = [$("#statperks1"),$("#statperks2"),$("#statperks3")]	
	statperks_ids2 = [$("#statperks4"),$("#statperks5"),$("#statperks6")]
	statperks_ids3 = [$("#statperks7"),$("#statperks8"),$("#statperks9")]
	console.log(${statperks3});
	console.log(${statperks2});
	console.log(${statperks1});
	for (var i = 0; i < statperks_ids1.length; i++) {
		if (${statperks3} === Number(statperks_ids1[i].attr("data-value"))){
			console.log('같음');
		} else{
			statperks_ids1[i].css("filter", "grayscale(100%)");
		}
	}
	for (var i = 0; i < statperks_ids2.length; i++) {
		if (${statperks2} === Number(statperks_ids2[i].attr("data-value"))){
			console.log('같음');
		} else{
			statperks_ids2[i].css("filter", "grayscale(100%)");
		}
	}
	for (var i = 0; i < statperks_ids3.length; i++) {
		if (${statperks1} === Number(statperks_ids3[i].attr("data-value"))){
			console.log('같음');
		} else{
			statperks_ids3[i].css("filter", "grayscale(100%)");
		}
	}
	
});



$("#top1").click(function(){
	
	$("#rune_box1").css("display", "block");
	$("#rune_box2").css("display", "none");
	
});

$("#top2").click(function(){
	let statperks_ids4 = [$("#statperks10"),$("#statperks11"),$("#statperks12")]	
	let statperks_ids5 = [$("#statperks13"),$("#statperks14"),$("#statperks15")]
	let statperks_ids6 = [$("#statperks16"),$("#statperks17"),$("#statperks18")]
	for (var i = 0; i < statperks_ids4.length; i++) {
 		if (${statperks2_3} === Number(statperks_ids4[i].attr("data-value"))){
			console.log('같음');
		} else{
			statperks_ids4[i].css("filter", "grayscale(100%)");
		}
	}
	for (var i = 0; i < statperks_ids5.length; i++) {
		if (${statperks2_2} === Number(statperks_ids5[i].attr("data-value"))){
			console.log('같음');
		} else{
			statperks_ids5[i].css("filter", "grayscale(100%)");
		}
	}
	for (var i = 0; i < statperks_ids6.length; i++) {
		if (${statperks2_1} === Number(statperks_ids6[i].attr("data-value"))){
			console.log('같음');
		} else{
			statperks_ids6[i].css("filter", "grayscale(100%)");
		}
	}
	
	$("#rune_box2").css("display", "block");
	$("#rune_box1").css("display", "none");
});
</script>
</html>