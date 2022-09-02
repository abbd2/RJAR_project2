package com.rjar.www.service.championDetail;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

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
		
		//옵션에 띄울 티어/ 티어 색깔
		mav.addObject("tier",tier);
		
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
		
		sb.append("<tr>");
		sb.append("<th>순위</th>");
		sb.append("<th colspan=\"2\" style=\"padding-left: 45px;\">챔피언</th>");
//		<td>티어</td>
		sb.append("<th>승률</th>");
		sb.append("<th>픽률</th>");
		sb.append("<th>밴률</th>");
		sb.append("<th>상대하기 어려운 챔피언</th>");
		sb.append("<tr>");
		
		for (int i = 0; i < tierList.size(); i++) {
			
			sb.append("<tr>");
			
            sb.append("<td style = 'width:50px;'><font style = 'text-align: center; text-weight: bold;'>"+(i+1)+"</font></td>");			
            
			sb.append("<td>");
			sb.append("<div class = 'tierChamp' value = " + tierList.get(i).getChampionId() + ">");
			sb.append("<img class = 'tierChampimg' src = https://ddragon.leagueoflegends.com/cdn/12.16.1/img/champion/"
					+ tierList.get(i).getChampionName() + ".png>");
			sb.append("</div>");
			sb.append("</td>");
			
			sb.append("<td class = 'kr_name'><small style = 'font-weight: bolder'>"+tierList.get(i).getChampion_kr_name()+"</small></td>");
			
			//티어가 들어갈 자리
			sb.append("<td class = 'rate'><font>"+tierList.get(i).getWinRate()+"</font></td>");
			sb.append("<td class = 'rate'><font>"+tierList.get(i).getBanRate()+"</font></td>");
			sb.append("<td class = 'rate'><font>"+tierList.get(i).getPickRate()+"</font></td>");
			
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
			sb.append("<div class = 'champion' value = " + nameIdList.get(i).getChampionId() + ">");
			sb.append("<img class = 'listimg' src = https://ddragon.leagueoflegends.com/cdn/12.16.1/img/champion/"
					+ nameIdList.get(i).getChampionName() + ".png>");
			sb.append("<br><small class = 'championName''>"+nameIdList.get(i).getChampion_kr_name() +"</small>");
			sb.append("</div>");
			i++;
		}

		
		return sb.toString();
	}

	public String restTierList(Champion champ) {
		List<Champion> restTierList = champDao.getTierList(champ.getTier(), champ.getLane());
		String tierList = makeTierList(restTierList);
		return tierList;
	}
	
	

}