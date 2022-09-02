package com.rjar.www.dao;

public interface IMemberDao {

	// MemberMapper.xml에서 함수명을 기반으로 찾는다
	boolean checkId(String id);
}
