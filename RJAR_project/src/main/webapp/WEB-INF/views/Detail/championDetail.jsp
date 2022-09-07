<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

#rune_box{
    width: 800px;
    height: 1080px;
    background-color: #d7fff1;
    float: left;
    margin-top: 20px;
    margin-left: 10px;
    border-radius: 8px;
}

#rune_table{
    margin-top: 150px;
}

#rune_table,#rune_table2{
    text-align: center;
}

#rune_table>thead>tr>th,
#rune_table2>thead>tr>th{
    width: 280px;
    height: 50px;
    /* border: solid 2px black; */
}

#rune_table>thead>tr>th>img,tbody>tr>th>img,
#rune_table2>thead>tr>th>img,tbody>tr>th>img{
    width: 34px;
    height: 34px;
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


.perks>img,.t2_perks>img{
    background-color: black;
    border-radius: 100px;
    width: 30px;
    height: 30px;
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
            <button id="lane_btn">탑</button>
            <button id="lane_btn">미드</button>
        </div>
        <div id="champ_img_box2">
            <img id="champ_img" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/champion/${championName}.png" alt="">
        </div>
        <div id="champ_text">
                <h2 style="margin-top: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;${championName}-${lane}</h2><br>
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

<div id="build_box">
    <div id="rune_box">
        <table id="rune_table">
            <thead>
                <tr>
                    <th id="category1" style="border-right: 1px solid gray;">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/7200_Domination.png" alt="">
                    </th>
                    <th id="category2" style="border-right: 1px solid gray;">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/7201_Precision.png" alt="">
                    </th>
                    <th>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th id="under1">
                        <img style="filter: grayscale(100%);" src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/Electrocute/Electrocute.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/Predator/Predator.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/DarkHarvest/DarkHarvest.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/HailOfBlades/HailOfBlades.png" alt="">
                    </th>
                    <th style="border-right: 1px solid gray;"></th>

                </tr>
                <tr>
                    <th id="under2">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/CheapShot/CheapShot.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/TasteOfBlood/GreenTerror_TasteOfBlood.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/SuddenImpact/SuddenImpact.png" alt="">
                    </th>
                    
                    <th id="under1_1">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Precision/Overheal.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Precision/Triumph.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Precision/PresenceOfMind/PresenceOfMind.png" alt="">
                    </th>

                    <th class="perks">
                        <img src="/img/5008.webp" alt="">
                        <img src="/img/5005.webp" alt="">
                        <img src="/img/5007.webp" alt="">
                    </th>
                </tr>
                <tr>
                    <th id="under3">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/ZombieWard/ZombieWard.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/GhostPoro/GhostPoro.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/EyeballCollection/EyeballCollection.png" alt="">
                    </th>
                    
                    <th id="under1_2">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Precision/LegendAlacrity/LegendAlacrity.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Precision/LegendTenacity/LegendTenacity.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Precision/LegendBloodline/LegendBloodline.png" alt="">
                    </th>

                    <th class="perks">
                        <img src="/img/5008.webp" alt="">
                        <img src="/img/5002.webp" alt="">
                        <img src="/img/5003.webp" alt="">
                    </th>
                </tr>
                <tr>
                    <th id="under4">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/TreasureHunter/TreasureHunter.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/IngeniousHunter/IngeniousHunter.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/RelentlessHunter/RelentlessHunter.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/UltimateHunter/UltimateHunter.png" alt="">
                    </th>
                    
                    <th id="under1_3">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Precision/CoupDeGrace/CoupDeGrace.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Precision/CutDown/CutDown.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Sorcery/LastStand/LastStand.png" alt="">
                    </th>
                    <th class="perks">
                        <img src="/img/5001.webp" alt="">
                        <img src="/img/5002.webp" alt="">
                        <img src="/img/5003.webp" alt="">
                    </th>
                </tr>
            </tbody>
        </table>

        <br>
        <hr width="800px" color="gray">

        <table id="rune_table2" style="margin-top: 20px;">
            <thead>
                <tr>
                    <th id="t2_category1" style="border-right: 1px solid gray;">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/7200_Domination.png" alt="">
                    </th>
                    <th id="t2_category2" style="border-right: 1px solid gray;">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/7201_Precision.png" alt="">
                    </th>
                    <th>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th id="t2_under1">
                        <img style="filter: grayscale(100%);" src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/Electrocute/Electrocute.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/Predator/Predator.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/DarkHarvest/DarkHarvest.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/HailOfBlades/HailOfBlades.png" alt="">
                    </th>

                    <th style="border-right: 1px solid gray;"></th>

                </tr>
                <tr>
                    <th id="t2_under2">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/CheapShot/CheapShot.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/TasteOfBlood/GreenTerror_TasteOfBlood.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/SuddenImpact/SuddenImpact.png" alt="">
                    </th>
                    
                    <th id="t2_under1_1">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Precision/Overheal.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Precision/Triumph.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Precision/PresenceOfMind/PresenceOfMind.png" alt="">
                    </th>

                    <th class="t2_perks">
                        <img src="/img/5008.webp" alt="">
                        <img src="/img/5005.webp" alt="">
                        <img src="/img/5007.webp" alt="">
                    </th>
                </tr>
                <tr>
                    <th id="t2_under3">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/ZombieWard/ZombieWard.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/GhostPoro/GhostPoro.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/EyeballCollection/EyeballCollection.png" alt="">
                    </th>
                    
                    <th id="t2_under1_2">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Precision/LegendAlacrity/LegendAlacrity.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Precision/LegendTenacity/LegendTenacity.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Precision/LegendBloodline/LegendBloodline.png" alt="">
                    </th>

                    <th class="t2_perks">
                        <img src="/img/5008.webp" alt="">
                        <img src="/img/5002.webp" alt="">
                        <img src="/img/5003.webp" alt="">
                    </th>
                </tr>
                <tr>
                    <th id="t2_under4">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/TreasureHunter/TreasureHunter.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/IngeniousHunter/IngeniousHunter.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/RelentlessHunter/RelentlessHunter.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/UltimateHunter/UltimateHunter.png" alt="">
                    </th>
                    
                    <th id="t2_under1_3">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Precision/CoupDeGrace/CoupDeGrace.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Precision/CutDown/CutDown.png" alt="">
                        <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Sorcery/LastStand/LastStand.png" alt="">
                    </th>
                    <th class="t2_perks">
                        <img src="/img/5001.webp" alt="">
                        <img src="/img/5002.webp" alt="">
                        <img src="/img/5003.webp" alt="">
                    </th>
                </tr>
            </tbody>
        </table>
    </div> <!--end rune_box-->  

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
</html>