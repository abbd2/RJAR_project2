package com.rjar.www.dao;

import java.util.List;

import com.rjar.www.bean.Member;

public interface IMemberDao {

	// MemberMapper.xml에서 함수명을 기반으로 찾는다
	Member checkId(String m_id);
	
	Member checkNick(String m_nick);
	
	boolean insertMember(Member mm);
	
	String getSecurityPw(String m_id);
	
	Member checkName(String m_name);
	
	Member checkPw(String m_id);

	int changePw(Member mm);

	String checkUser(String m_name);

	List<Member> getMyPageInfo(String m_nick);
}
