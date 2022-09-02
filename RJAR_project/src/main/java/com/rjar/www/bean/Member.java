package com.rjar.www.bean;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class Member {

	private int m_num;
	private String m_id;
	private String m_nick;
	private String m_phone;
	private String m_pw;
	private String m_name;
	private String m_tel;
	private int m_que;
	private String m_ans;

}
