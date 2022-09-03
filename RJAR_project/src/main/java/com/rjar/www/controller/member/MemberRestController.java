package com.rjar.www.controller.member;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rjar.www.service.member.MemberMM;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/member")
public class MemberRestController {
	
	private final MemberMM mm;
	
								// 리턴 값한글 깨짐 방지
	@GetMapping(value="/checkId", produces="text/plain;charset=utf-8")  
	public ResponseEntity<String> idAvailable(String m_id){
		// 오류를 이용하여 분기를 정함
		System.out.println("레스트 컨트롤러 진입");
		return ResponseEntity.ok(mm.idAvailable(m_id));
	}

}
