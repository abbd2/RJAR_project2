package com.rjar.www.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rjar.www.bean.Member;
import com.rjar.www.service.championDetail.ChampionDetailMM;
import com.rjar.www.service.member.MemberMM;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HomeController {

	@Autowired
	private ChampionDetailMM champmm;
	@Autowired
	private MemberMM membermm;

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
		String tier = "platinum";
		String lane = "TOP";
		mav = champmm.getChampionInfo(tier, lane);
		return mav;
	}
	
	@GetMapping(value = "/championDetail")
	public ModelAndView championDetailInfo(HttpServletRequest request, String championName, String lane) {
		log.info("championDetail");
		championName = request.getParameter("championName");
		lane = request.getParameter("lane");
		mav = champmm.getChampionDetailInfo(championName, lane);
		
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

		return "community/communityHome";
	}

	@GetMapping(value = "/lck")
	public String lck() {

		return "lck";
	}

	@GetMapping(value = "/login")
	public String login() {

		return "login";
	}
	
	@GetMapping(value = "/join")
	public String join() {

		return "join";
	}
	
	@GetMapping(value = "/join2")
	public String join2() {

		return "join2";
	}
	
	@GetMapping(value = "/join3")
	public String join3(Member mm) {
		log.info(mm);
		membermm.memberJoin(mm);

		return "join3";
	}

}
