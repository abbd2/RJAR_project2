package com.rjar.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rjar.www.bean.Champion;
import com.rjar.www.service.championDetail.ChampionDetailMM;

import lombok.extern.log4j.Log4j;

@Log4j
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
	


}
