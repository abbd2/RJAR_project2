package com.rjar.www.advice;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.rjar.www.exception.CheckException;

@RestControllerAdvice
public class ControllerAdviceRest {
	// 한글 깨짐 방지
	private HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/plain;charset=utf-8");
		return headers;
	}

	// 아이디 중복 체크 예외
	// ex.getMessage()가 한글일때 getHeaders() 호출할것.
	@ExceptionHandler(CheckException.class) // 처리할 예외처리 타입 선언
	public ResponseEntity<String> dupExceptionHandler(CheckException ex) {
		System.out.println("@RestControllerAdvice 진입");
		System.out.println("CheckException Advice");
		return new ResponseEntity<String>(ex.getMessage(), getHeaders(), HttpStatus.EXPECTATION_FAILED); // 417 error
	}
}
