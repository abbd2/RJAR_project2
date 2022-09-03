package com.rjar.www.exception;

public class IdCheckException extends RuntimeException {

	public IdCheckException(String msg) {
		// @ExceptionHandler(IdCheckException.class)로 진행
		super(msg);
		System.out.println("IdCheckException 진입");
	}

}
