package com.rjar.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rjar.www.bean.Champion;
import com.rjar.www.service.championDetail.ChampionDetailMM;


@Controller
public class ChampionDetailController {
	
	@Autowired
	private ChampionDetailMM champmm;
	
	ModelAndView mav;
	
	@GetMapping(value = "/tierOrLane")
	public ModelAndView championDetail(Champion champ){
		mav = champmm.getChampionInfo(champ.getTier(), champ.getLane());
		return mav;
	}
	
	@GetMapping(value = "/clickDetail")
	public ModelAndView clickDetail(Champion champ){
		mav = champmm.clickDetail(champ.getChampionId());
		return mav;
	}
	//검색창 입력 후 엔터 쳤을 때
	@GetMapping(value = "/selectDetail")
	public ModelAndView selectDetail(Champion champ){
		System.out.println("챔피언 이름은 "+champ.getChampion_kr_name());
		mav = champmm.selectDetail(champ.getChampion_kr_name());			
		return mav;
	}
	
	

}
