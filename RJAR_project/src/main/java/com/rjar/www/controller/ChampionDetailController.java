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
	public ModelAndView championDetail(Champion champ) {
		mav = champmm.getChampionInfo(champ.getTier(), champ.getLane());
		return mav;
	}

	@GetMapping(value = "/clickDetail")
	public ModelAndView clickDetail(Champion champ) {
		String tier = "platinum";
		mav = champmm.clickDetail(champ.getChampionId(), tier);
		return mav;
	}

	// 검색창 입력 후 엔터 쳤을 때
	@GetMapping(value = "/selectDetail")
	public ModelAndView selectDetail(Champion champ) {
		String tier = "platinum";
		mav = champmm.selectDetail(champ.getChampion_kr_name(), tier);
		return mav;
	}

	@GetMapping(value = "/runeLine")
	public ModelAndView runeLine(Champion champ) {
		mav = champmm.runeInfo(champ.getChampionName(), champ.getLane(), champ.getTier());
		return mav;
	}

	@GetMapping(value = "/counterInfo")
	public ModelAndView counterInfo(Champion champ) {
		mav = champmm.counterInfo(champ.getChampionName(), champ.getLane(), champ.getTier());
		return mav;
	}

	@GetMapping(value = "/tierDetail")
	public ModelAndView tierDetail(Champion champ) {
		mav = champmm.selectDetail(champ.getChampionName(), champ.getTier());
		return mav;
	}
	@GetMapping(value = "/counterCal")
	public ModelAndView counterCal(Champion champ) {
		mav = champmm.counterCal(champ.getChampionName(), champ.getCounter1(), champ.getLane(), champ.getTier());
		return mav;
	}

}
