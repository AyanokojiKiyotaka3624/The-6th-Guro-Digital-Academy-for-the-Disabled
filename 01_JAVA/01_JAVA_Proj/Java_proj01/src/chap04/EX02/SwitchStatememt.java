package chap04.EX02;

import java.util.Scanner;

public class SwitchStatememt {

	public static void main(String[] args) {
		// Switch 문 : break 가 미포함. if 문으로 변환 가능

		// 1. Switch 문 break를 미포함 한 경우, default 블락에는 break 를 생략한다.
			// break를 넣지 않으면 특정 case 로 점프후 다음 case 를 실행함.
			// case 2 로 점프후 아래 내용 실행 : B, C, D
		int val1 = 2;
		
		switch (val1) {
		case 1:
			System.out.println("A");
			
		case 2:
			System.out.println("B");
			
		case 3:
			System.out.println("C");
			
		default :
			System.out.println("D");
			
			
		}
		
		// 2. switch 문에 break를 포함한 경우
		char value2 = 'A';
		
		switch (value2) {
		case 'A' :
			System.out.println("A");
			break;
		case 'B' :
			System.out.println("B");
			break;
		case 'C' :
			System.out.println("C");
			break;
		default :
			System.out.println("D");
		}
		
		// switch 문은 if 문으로 변환
		int value3 = 2;
		
		if ( value3 == 1 ) {
			System.out.println("실행1 - if");
		}else if ( value3 == 2 ) {
			System.out.println("실행2 - if");
		}else if ( value3 == 3 ) {
			System.out.println("실행3 - if");
		}else {
			System.out.println("실행4 - if");
		}
		
		// switch 문에서 break 의 사용 ,
		
		// 월을 입력 받아서 해당월의 마지막 날짜를 출력 하는 프로그램
		// 31일 : 1월, 3월, 5월 7월, 8월, 10월, 12월
		// 28일 : 2월
		// 30일 : 4월, 6월, 9월, 11월
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("월을 입력 하세요>>>");
		int mon = scanner.nextInt();
		
		switch (mon) {
		case 1: case 3: case 5: case 7: case 8: case 10: case 12:
			System.out.println( "입력하신 " + mon + "월은 마지막 날이 31일 입니다. " );
		break;
		case 2:
			System.out.println( "입력하신 " + mon + "월은 마지막 날이 28일 입니다. " );
		break;
		case 4: case 6: case 9: case 11:
			System.out.println( "입력하신 " + mon + "월은 마지막 날이 30일 입니다. " );
		break;
	default :
		System.out.println( " 잘못 입력 하셨습니다. 정수 1 ~ 12 까지의 값을 넣으세요 " );
		
		}
		
		
		System.out.println("==========");
		
		// if 문으로 변환
		if (mon == 1 || mon == 3 || mon == 5 || mon == 7 || mon == 8 || mon == 10 || mon == 12 ) {
			System.out.println("if 문으로 출력 : 입력하신 " + mon +"월은 마지막 날이 31일 입니다. ");
			
		}else if (mon == 2) {
			System.out.println("if 문으로 출력 : 입력하신 " + mon +"월은 마지막 날이 28일 입니다. ");
		}else if (mon == 4 || mon == 6 || mon == 9 || mon == 11 ) {
			System.out.println("if 문으로 출력 : 입력하신 " + mon +"월은 마지막 날이 30일 입니다. ");
		}else {
			System.out.println("잘못 입력 하셨습니다. 점수 1 ~ 12 까지의 값을 넣으세요");
		}
		
		
		
		
		
		
		
	}

}
