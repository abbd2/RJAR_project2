package com.rjar.www.service.member;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.rjar.www.advice.IdCheckException;
import com.rjar.www.bean.Member;
import com.rjar.www.dao.IMemberDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@RequiredArgsConstructor
public class MemberMM {

	private final IMemberDao mDao;

	ModelAndView mav;

	public ModelAndView memberJoin() {

		return mav;
	}

	public String idAvailable(String m_id) {

		System.out.println("idAvailable 진입");
//		boolean checkId = mDao.checkId(m_id);
		Member checkId = mDao.checkId(m_id);
		if (checkId != null) {
			System.out.println("분기 진입");
			throw new IdCheckException("사용할 수 없는 아이디입니다.");
		}
		return "사용할 수 있는 아이디입니다.";

	}

}
