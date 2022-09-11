package com.rjar.www.service.member;

import java.util.ArrayList;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.rjar.www.bean.Member;
import com.rjar.www.dao.IMemberDao;
import com.rjar.www.exception.CheckException;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberMM {

	@Autowired
	private IMemberDao mDao;
	
	@Autowired
	private Member member;

	ModelAndView mav;

	// 로그인
	public ModelAndView memberAccess(HttpSession session, Member mm) {

		mav = new ModelAndView();
		String view = null;
		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
		// 회원가입할 때 암호화해서 저장해뒀던 비밀번호를 받아옴
		String pwEncode = mDao.getSecurityPw(mm.getM_id());
		System.out.println("가져온 암호화된 비밀번호 : " + pwEncode);

		if (pwEncode != null) {
			if (pwEncoder.matches(mm.getM_pw(), pwEncode)) {
				System.out.println("로그인 중...");
				// 세션에 로그인 마킹
				session.setAttribute("m_id", mm.getM_id());
				view = "redirect:/home";
			}else { // 비밀번호 오류
				System.out.println("잘못된 비밀번호 :" + mm.getM_pw());
				view = "login";
				mav.addObject("check", 2);
			}
		} else {
			System.out.println("잘못된 아이디 :" + mm.getM_id());
			view = "login";
			mav.addObject("check", 2);
		}
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView memberJoin(Member mm) {
		// 비밀번호 암호화
		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
		mm.setM_pw(pwEncoder.encode(mm.getM_pw()));
		System.out.println("암호화된 밀번호 : " + mm.getM_pw());

		if (mDao.insertMember(mm)) {
			mav = new ModelAndView();
			mav.addObject("m_nick", mm.getM_nick());
			mav.setViewName("redirect:/join3");
			System.out.println("insert 성공");
			System.out.println("회원가입 페이지3으로 이동");
		} else {
			System.out.println("insert 실패");
		}

		return mav;
	}

	public String idAvailable(String m_id) {

		System.out.println("idAvailable 진입");

		// 유효성 검사를 통과한 아이디만 DB에서 검사
		if (m_id.length() < 5 || m_id.length() > 20 || !(Pattern.matches("[0-9|a-z]*", m_id))) {
			System.out.println("유효성 검사");
			// 오류를 발생시킴
			throw new CheckException("5~20자의 영문 소문자, 숫자만 사용 가능합니다.");
		} else {
			Member checkId = mDao.checkId(m_id);
			log.info(checkId);
			if (checkId != null) {
				throw new CheckException("이미 사용중인 아이디입니다.");
			}
			return "사용할 수 있는 아이디입니다.";
		} // end else

	} // end idAvaliable

	public String nickAvailable(String m_nick) {

		System.out.println("nickAvailable 진입");

		if (m_nick.length() < 2 || m_nick.length() > 10) {
			System.out.println("유효성 검사");
			// 오류를 발생시킴
			throw new CheckException("등록되지 않은 이름입니다.");
		}
		return "사용할 수 있는 닉네임입니다.";
	}
	
	public String nameAvailable(Member mm) {
		
		// 프론트에서 넘어온 값 저장
		String name = mm.getM_name();
		String tel = mm.getM_tel();
		String phone = mm.getM_phone();
		
		System.out.println("nameAvailable 진입");
		mm = mDao.checkName(name); // 서버에서 넘어온 값 저장
		log.info(mm);
		
		if(mm != null) {
			System.out.println("아이디 존재");
			if(!mm.getM_tel().equals(tel)) { // 통신사 같은지 검사
				System.out.println("통신사 틀림");
				throw new CheckException("올바른 통신사를 선택해주세요.");
			}else if(!mm.getM_phone().equals(phone)) {
				System.out.println("전화번호 틀림");
				throw new CheckException("올바른 전화번호를 입력해주세요.");
			}
			member.setM_id(mm.getM_id());
			return "";
		}else {
			System.out.println("아이디 존재하지 않음");
			throw new CheckException("가입되지 않은 이름입니다.");
		}
	}
	
}
