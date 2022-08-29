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
		
		log.info("tier=" + tier);
		log.info("lane=" + lane);

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
		
		for (int i = 0; i < tierList.size(); i++) {
			
			sb.append("<td>"+i+1+"<td>");
			
			sb.append("<td>");
			sb.append("<div class = 'tierChamp' value = " + tierList.get(i).getChampionId() + ">");
			sb.append("<img src = https://ddragon.leagueoflegends.com/cdn/10.6.1/img/champion/"
					+ tierList.get(i).getChampionName() + ".png>");
			sb.append("</div>");
			sb.append("</td>");
			
			sb.append("<td>"+tierList.get(i).getChampionName()+"</td>");
			
			sb.append("<td><small>"+tierList.get(i).getChampion_kr_name()+"</small></td>");
			
			//티어가 들어갈 자리
			
			sb.append("<td>"+tierList.get(i).getWinRate()+"</td>");
			sb.append("<td>"+tierList.get(i).getBanRate()+"</td>");
			sb.append("<td>"+tierList.get(i).getPickRate()+"</td>");
			
			sb.append("<td>");
			sb.append("<div class = 'counter' value = " + tierList.get(i).getCounter1() + ">");
			sb.append("<img src = https://ddragon.leagueoflegends.com/cdn/10.6.1/img/champion/"
					+ tierList.get(i).getCounter1() + ".png>");
			sb.append("</div>");
			sb.append("<div class = 'counter' value = " + tierList.get(i).getCounter2() + ">");
			sb.append("<img src = https://ddragon.leagueoflegends.com/cdn/10.6.1/img/champion/"
					+ tierList.get(i).getCounter2() + ".png>");
			sb.append("</div>");
			sb.append("<div class = 'counter' value = " + tierList.get(i).getCounter3() + ">");
			sb.append("<img src = https://ddragon.leagueoflegends.com/cdn/10.6.1/img/champion/"
					+ tierList.get(i).getCounter3() + ".png>");
			sb.append("</div>");
			sb.append("</td><br>");
						
		}
		
		
		return sb.toString();
	}

	private String makechampList(List<Champion> nameIdList) {
		
		try {
			for (int i = 0; i < nameIdList.size(); i++) {				
				System.out.println("nameIdList는 " + nameIdList.get(i).getChampionId());
			}
			
		} catch(Exception e) {
			System.out.println(e);
		}
			
		StringBuilder sb = new StringBuilder();
		
		for (int i = 0; i < nameIdList.size(); i++) {

			sb.append("<div class = 'champion' value = " + nameIdList.get(i).getChampionId() + ">");
			sb.append("<img src = https://ddragon.leagueoflegends.com/cdn/10.6.1/img/champion/"
					+ nameIdList.get(i).getChampionName() + ".png>");
			sb.append("<br><small>"+nameIdList.get(i).getChampion_kr_name() +"</small>");
			sb.append("</div>");
		}

		
		return sb.toString();
	}
	
	

}