package LAB.EX1;

import java.util.Scanner;

public class Do_while {

	public static void main(String[] args) {
		// ﻿비밀번호를 맞출 때까지 반복 입력받는 프로그램을 작성하세요.

		   try (Scanner scanner = new Scanner(System.in)) {
			final String correctPassword = "1234";
	        String input;

	        do {
	            System.out.print("비밀번호를 입력하세요: ");
	            input = scanner.nextLine();
	            
	            if (!input.equals(correctPassword)) {
	                System.out.println("비밀번호가 틀렸습니다. 다시 시도하세요.");
	            }
	        } while (!input.equals(correctPassword));
		}

	        System.out.println("비밀번호가 일치합니다. 로그인 성공!");
		
	}

}
