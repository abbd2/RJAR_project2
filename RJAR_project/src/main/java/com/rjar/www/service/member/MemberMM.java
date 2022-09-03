package com.rjar.www.service.member;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.ModelAndView;

import com.rjar.www.bean.Member;
import com.rjar.www.dao.IMemberDao;
import com.rjar.www.exception.IdCheckException;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
@RestControllerAdvice
public class MemberMM {

	@Autowired
	private IMemberDao mDao;

	ModelAndView mav;

	public ModelAndView memberJoin() {

		return mav;
	}

	public String idAvailable(String m_id) {

		System.out.println("idAvailable 진입");
		Member checkId = mDao.getMemberInfo(m_id);
		log.info(checkId);
		if (checkId != null) {
			System.out.println("분기 진입");
			// 오류를 발생시킴
			throw new IdCheckException("사용할 수 없는 아이디입니다.");
		} else if (m_id.length() < 5 || m_id.length() > 20 || !(Pattern.matches("[0-9|a-z]*", m_id))) {
			throw new IdCheckException("5~20자의 영문 소문자, 숫자만 사용 가능합니다.");
		}
		return "사용할 수 있는 아이디입니다.";

	}

}
