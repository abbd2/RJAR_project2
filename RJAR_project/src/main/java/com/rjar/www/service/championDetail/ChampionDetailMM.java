package com.rjar.www.service.championDetail;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.rjar.www.bean.Champion;
import com.rjar.www.dao.IchampionDao;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ChampionDetailMM {

	@Autowired
	private IchampionDao champDao;

	ModelAndView mav;

	public ModelAndView getChampionInfo(String tier, String lane) {

		mav = new ModelAndView();

		// 옵션에 띄울 티어/ 티어 색깔
		mav.addObject("tier", tier);

		// 챔피언 사진에 들어갈 value들
		List<Champion> nameIdList = champDao.getChampionList();
		mav.addObject("nameIdList", makechampList(nameIdList));

		// 챔피언티어 정보에 들어갈 value들
		List<Champion> tierList = champDao.getTierList(tier, lane);
		mav.addObject("tierList", makeTierList(tierList));
		mav.setViewName("Detail/championHome");

		return mav;
	}

	private String makeTierList(List<Champion> tierList) {

		StringBuilder sb = new StringBuilder();

		sb.append("<tr class = 'jool'>");
		sb.append("<th>순위</th>");
		sb.append("<th colspan=\"2\" style=\"padding-left: 45px;\">챔피언</th>");
//		<td>티어</td>
		sb.append("<th>승률</th>");
		sb.append("<th>픽률</th>");
		sb.append("<th>밴률</th>");
		sb.append("<th>상대하기 어려운 챔피언</th>");
		sb.append("<tr>");

		for (int i = 0; i < tierList.size(); i++) {

			sb.append("<tr class = 'jool'>");

			sb.append("<td style = 'width:50px;'><font style = 'text-align: center; text-weight: bold;'>" + (i + 1)
					+ "</font></td>");

			sb.append("<td>");
			sb.append("<form action = 'championDetail' method = 'get'>");
			sb.append("<input type = 'hidden' value = '" + tierList.get(i).getChampionId() + "' >");
			sb.append("<div class = 'tierChamp'>");
			sb.append("<img class = 'tierChampimg' src = https://ddragon.leagueoflegends.com/cdn/12.16.1/img/champion/"
					+ tierList.get(i).getChampionName() + ".png>");
			sb.append("</div>");
			sb.append("</form>");
			sb.append("</td>");

			sb.append("<td class = 'kr_name'><small style = 'font-weight: bolder'>"
					+ tierList.get(i).getChampion_kr_name() + "</small></td>");

			// 티어가 들어갈 자리
			sb.append("<td class = 'rate'><font>" + tierList.get(i).getWinRate() + "</font></td>");
			sb.append("<td class = 'rate'><font>" + tierList.get(i).getBanRate() + "</font></td>");
			sb.append("<td class = 'rate'><font>" + tierList.get(i).getPickRate() + "</font></td>");

			sb.append("<td style = 'padding-left:20px;'>");
			sb.append("<div class = 'counter' value = " + tierList.get(i).getCounter1() + ">");
			sb.append("<img class = 'counterimg' src = https://ddragon.leagueoflegends.com/cdn/12.16.1/img/champion/"
					+ tierList.get(i).getCounter1() + ".png>");
			sb.append("</div>");

			sb.append("<div class = 'counter' value = " + tierList.get(i).getCounter2() + ">");
			sb.append("<img class = 'counterimg' src = https://ddragon.leagueoflegends.com/cdn/12.16.1/img/champion/"
					+ tierList.get(i).getCounter2() + ".png>");
			sb.append("</div>");

			sb.append("<div class = 'counter' value = " + tierList.get(i).getCounter3() + ">");
			sb.append("<img class = 'counterimg' src = https://ddragon.leagueoflegends.com/cdn/12.16.1/img/champion/"
					+ tierList.get(i).getCounter3() + ".png>");
			sb.append("</div>");
			sb.append("</td>");

			sb.append("</tr>");

		}

		return sb.toString();
	}

	private String makechampList(List<Champion> nameIdList) {

		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < nameIdList.size(); i++) {
			sb.append("<form action = 'championDetail' method = 'get'>");
			sb.append("<input type = 'hidden' value = '" + nameIdList.get(i).getChampionId() + "' >");
			sb.append("<div class = 'champion'>");
			sb.append("<img class = 'listimg' src = https://ddragon.leagueoflegends.com/cdn/12.16.1/img/champion/"
					+ nameIdList.get(i).getChampionName() + ".png>");
			sb.append("<br><small class = 'championName''>" + nameIdList.get(i).getChampion_kr_name() + "</small>");
			sb.append("</div>");
			sb.append("</form>");
		}

		return sb.toString();
	}

	public String restTierList(Champion champ) {
		List<Champion> restTierList = champDao.getTierList(champ.getTier(), champ.getLane());
		String tierList = makeTierList(restTierList);
		return tierList;
	}

	public String restChampionList(Champion champ) {
		String lane = champ.getLane();
		String all = "all";

		List<Champion> restChampionList = null;

		if (lane.equals(all)) {
			restChampionList = champDao.getChampionList();
		} else {
			restChampionList = champDao.getLaneChamp(lane);
		}
		
		String championList = makechampList(restChampionList);
		return championList;
	}

	public String getRotationChamp() {
	    String url = "https://kr.api.riotgames.com/lol/platform/v3/champion-rotations?api_key=RGAPI-5abbd2a5-6403-43ab-a67b-bdc1c426bcaf";

	    RestTemplate restTemplate = new RestTemplate();
	    String apiResult = restTemplate.getForObject(url, String.class);
	    
	    //받아온 내용 json으로 파싱
	    JsonParser parser = new JsonParser();
	    JsonObject jsonObj = (JsonObject)parser.parse(apiResult);
	    
	    //원하는 value값 꺼내고 그걸 다시 String 배열로 파싱
	    Gson gson = new Gson();
	    String[] freeChampionList = gson.fromJson(jsonObj.get("freeChampionIds"), String[].class);
	    
	    //챔피언 아이디로 검색한 후 리스트에 담음
	    List<Champion> rotationList = new ArrayList<>();
	    for (int i = 0; i < freeChampionList.length; i++) {
	    	int championId = Integer.parseInt(freeChampionList[i]);
	    	Champion rotationChampion = champDao.getRotaion(championId);
	    	rotationList.add(rotationChampion);
		}
	    //리스트를 통해 태그 생성
	    String rotationImg = makechampList(rotationList);
	    
		return rotationImg;
	}

	public List<Champion> getSelectChamp(String text) {
		List<Champion> selectResult = champDao.getSelectChamp(text);
		
		return selectResult;
	}

}