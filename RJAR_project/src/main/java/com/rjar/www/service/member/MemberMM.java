package com.rjar.www.service.member;

import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.rjar.www.bean.Member;
import com.rjar.www.dao.IMemberDao;
import com.rjar.www.exception.CheckException;
import com.rjar.www.exception.CheckUserException;
import com.rjar.www.exception.IdCheckException;
import com.rjar.www.exception.NoMatchingPwException;

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
			} else { // 비밀번호 오류
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

	// 메소드 오버로딩
	public String checkId(Member mm) {

		// 프론트에서 넘어온 값 저장
		log.info("프론트 값 : " + mm);
		String id = mm.getM_id();
		int que = mm.getM_que();
		String ans = mm.getM_ans();

		mm = mDao.checkPw(id); // 서버에서 넘어온 값 저장
		log.info("서버 값 : " + mm);

		if (mm != null) {
			if (que != mm.getM_que() || !ans.equals(mm.getM_ans())) {
				throw new IdCheckException("질문 또는 답변이 틀립니다.");
			}
			member.setM_id(mm.getM_id());
			member.setM_pw(mm.getM_pw());
			return "redirect:/findPw2";
		} else {
			throw new IdCheckException("가입되지 않은 아이디입니다.");
		}
	}

	public String nickAvailable(String m_nick) {

		System.out.println("nickAvailable 진입");

		if (m_nick.length() < 2 || m_nick.length() > 10) {
			System.out.println("유효성 검사");
			// 오류를 발생시킴
			throw new CheckException("닉네임은 2글자 이상 10글자 이하로 이루어져야 합니다.");
		} else {
			if (mDao.checkNick(m_nick) != null) {
				throw new CheckException("이미 존재하는 닉네임입니다.");
			}
			return "사용할 수 있는 닉네임입니다.";
		}
	}

	public String nameAvailable(Member mm) {

		// 프론트에서 넘어온 값 저장
		String name = mm.getM_name();
		String tel = mm.getM_tel();
		String phone = mm.getM_phone();

		System.out.println("nameAvailable 진입");
		mm = mDao.checkName(name); // 서버에서 넘어온 값 저장
		log.info(mm);

		if (mm != null) {
			System.out.println("아이디 존재");
			if (!mm.getM_tel().equals(tel) || !mm.getM_phone().equals(phone)) { // 통신사 같은지 검사
				System.out.println("통신사 틀림");
				throw new CheckException("올바르지 않은 정보입니다.");
			}
			member.setM_id(mm.getM_id());
			return "";
		} else {
			System.out.println("아이디 존재하지 않음");
			throw new CheckException("가입되지 않은 이름입니다.");
		}
	}

	public String changePw(String m_pw, String currentPw) {

		int result = mDao.changePw(member);

		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
		m_pw = pwEncoder.encode(m_pw); // 변경할 비밀번호 암호화
		member.setM_pw(m_pw);
		System.out.println(m_pw);

		if (result > 0) {
			System.out.println(result + " 비밀번호 변경 성공");
			return "redirect:/login";
		} else {
			throw new NoMatchingPwException("오류");
		}
	}

	public void checkUser(String m_name) {

		String result = mDao.checkUser(m_name);
		System.out.println("result" + result);

		if (result != null) {
			System.out.println("!null");
			throw new CheckUserException("alert(\'이미 생성된 계정이 존재합니다.\')");
		} else {
			System.out.println("null");
		}
	}

}
