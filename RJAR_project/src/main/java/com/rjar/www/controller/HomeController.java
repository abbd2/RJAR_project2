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
public class HomeController {

	@Autowired
	private ChampionDetailMM champmm;

	ModelAndView mav;

	// servlet-context.xml에서 해당 패키지 스캔
	@GetMapping(value = "/")
	public String home() {
		return "home";
	}

	@GetMapping(value = "/home")
	public String main() {

		return "home";
	}

	@GetMapping(value = "/championHome")
	public ModelAndView championDetail() {
		log.info("home 이지롱");
		String tier = "platinum";
		String lane = "TOP";
		mav = champmm.getChampionInfo(tier, lane);
		return mav;
	}

	@GetMapping(value = "/laboratory")
	public String laboratory() {

		return "laboratory";
	}

	@GetMapping(value = "/multiSearch")
	public String multiSearch() {

		return "multiSearch";
	}

	@GetMapping(value = "/community")
	public String community() {

		return "community";
	}

	@GetMapping(value = "/lck")
	public String lck() {

		return "lck";
	}

}
