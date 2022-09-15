package com.rjar.www.controller.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rjar.www.bean.Member;
import com.rjar.www.service.member.MemberMM;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MemberController {

	@Autowired
	private MemberMM membermm;

	@Autowired
	private Member member;

	ModelAndView mav;

	@GetMapping(value = "/login")
	public String login() {

		return "login";
	}

	@PostMapping(value = "/access")
	public ModelAndView access(HttpSession session, Member mm) {
		System.out.println("로그인");
		mav = membermm.memberAccess(session, mm);

		return mav;
	}

	@PostMapping(value = "/logout")
	public String logout(HttpSession session) {
		System.out.println("로그아웃");
		if (session.getAttribute("m_id") != null) {
			session.invalidate(); // 세션 무효화
			System.out.println("세션 무효화");
		} else {
			System.out.println("아이디 null");
			session.invalidate(); // 세션 무효화
		}
		return "redirect:/home";
	}

	@GetMapping(value = "/join")
	public String join() {
		System.out.println("회원가입 페이지로 이동");
		return "join";
	}

	@GetMapping(value = "/join2")
	public String join2() {
		System.out.println("회원가입 페이지2로 이동");
		return "join2";
	}

	@PostMapping(value = "memberJoin")
	public ModelAndView memberJoin(Member mm) {
		log.info(mm);
		membermm.checkUser(mm.getM_name());
		mav = membermm.memberJoin(mm);
		return mav;
	}

	@GetMapping(value = "/join3")
	public ModelAndView join3(@RequestParam(value = "m_nick", required = false) String m_nick) {

		mav = new ModelAndView();
		mav.addObject("m_nick", m_nick);
		mav.setViewName("join3");

		return mav;
	}

	@GetMapping(value = "/findId")
	public String findId() {
		System.out.println("아이디 찾기 페이지로 이동");
		return "findId";
	}

	@GetMapping(value = "/findId2")
	public ModelAndView findId2() {

		System.out.println("아이디 찾기2 페이지로 이동");

		mav = new ModelAndView();
		System.out.println(member.getM_id());
		mav.addObject("m_id", member.getM_id());
		mav.setViewName("findId2");
		log.info(mav);

		return mav;
	}

	@GetMapping(value = "/findPw")
	public String findPw() {
		System.out.println("비밀번호 찾기 페이지로 이동");
		return "findPw";
	}

	@GetMapping(value = "/checkPw")
	public String checkPw(Member mm) {

		return membermm.checkId(mm);
	}

	@GetMapping(value = "/findPw2")
	public ModelAndView findPw2(@RequestParam(value = "m_id", required = false) String m_id) {

		System.out.println("비밀번호 찾기2 페이지로 이동");
		mav = new ModelAndView();
		mav.addObject("m_id", m_id); // 변경전 비밀번호를 알기위해 m_id 전송
		mav.setViewName("findPw2");

		return mav;
	}

	@PostMapping(value = "/changePw")
	public ModelAndView changePw(String m_pw, String currentPw) {

		log.info("changePw : " + m_pw);
		log.info("currentPw : " + currentPw);
		String view = membermm.changePw(m_pw, currentPw);
		mav.setViewName(view);

		return mav;
	}

}
