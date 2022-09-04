package com.rjar.www.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rjar.www.service.member.MemberMM;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value = "/member")
public class MemberRestController {
	
	@Autowired
	private MemberMM mm;
	
								// 리턴 값한글 깨짐 방지
	@GetMapping(value="/checkId", produces="text/plain;charset=utf-8")  
	public ResponseEntity<String> idAvailable(String m_id){
		// 오류를 이용하여 분기를 정함
		return ResponseEntity.ok(mm.idAvailable(m_id));
	}

}
