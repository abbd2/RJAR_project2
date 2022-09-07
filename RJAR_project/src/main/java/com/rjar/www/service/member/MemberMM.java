package com.rjar.www.service.member;

import java.util.regex.Pattern;

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

	ModelAndView mav;

	public ModelAndView memberJoin(Member mm) {
		// 비밀번호 암호화
		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
		mm.setM_pw(pwEncoder.encode(mm.getM_pw()));
		System.out.println("암호화된 밀번호 : " + mm.getM_pw());
		
		// TODO
		// 나중에 뒤로가기했을 때의 접근 처리 해야함
		if (mDao.insertMember(mm)) {
			mav = new ModelAndView();
			mav.addObject("m_nick", mm.getM_nick());
			mav.setViewName("join3");
			System.out.println("insert 성공");
		}else {
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
			throw new CheckException("2~10자만 사용 가능합니다.");
		} else {
			Member checkNick = mDao.checkNick(m_nick);
			log.info(checkNick);
			if (checkNick != null) {
				throw new CheckException("이미 사용중인 닉네임입니다.");
			}
		}
		return "사용할 수 있는 닉네임입니다.";
	}

}
