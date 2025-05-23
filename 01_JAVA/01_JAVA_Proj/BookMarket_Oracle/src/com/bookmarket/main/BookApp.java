package com.bookmarket.main;

import com.bookmarket.controller.BookController;
import com.bookmarket.dao.BookDAO;

public class BookApp {

	public static void main(String[] args) {
		// 프로그램의 시작점
		BookController bookcontroller = new BookController();
		bookcontroller.run();
		
		// DB 연결 상태 확인
		// 1. 객체 생성 , 다른 패키지에 클래스가 존재할 경우 import 가 필요함.
		BookDAO bookDAO = new BookDAO();
		
		
		// 예외 처리 : try {}catch(Exception e) {} , 프로그램의 오류가 발생 하더라도 프로그램이 멈추지 않도록 처리
		try {
			// try 블락에 오류가 발생되면 catch 블락이 실행됨.
			// try 블락에 오류가 없으면 catch 블락은 작동 되지 않는다.
			bookDAO.getConnection();
			System.out.println("DB 연결이 성공적으로 접속 했습니다. ");

		} catch (Exception e) {
			System.out.println("DB 연결이 실패 했습니다. ");
			e.printStackTrace();
			
		}
		
		System.out.println("프로그램이 정상 종료 됨");

	}

}
