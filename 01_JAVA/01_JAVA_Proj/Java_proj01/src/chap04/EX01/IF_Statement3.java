package chap04.EX01;

import java.util.Scanner;

public class IF_Statement3 {

	public static void main(String[] args) {
		// 기본 자료형일때 값 비교 : ==
		
		Scanner sc = new Scanner(System.in);
		
		// 10, 20, 30, 40 의 배수를 판별 하는 프로그램
		
		System.out.println("10의 배수를 입력해 주세요>>>");
		int a = sc.nextInt();
		
		if (a == 10) {
			System.out.println("10을 입력 받았습니다. ");
		}else if ( a == 20 ) {
			System.out.println("20을 입력 받았습니다. ");
		}else if ( a == 30 ) {
			System.out.println("30을 입력 받았습니다. ");
		}else if ( a == 40 ) {
			System.out.println("40을 입력 받았습니다. ");
		}else {
			System.out.println("10 ~ 40 값만 입력 해주세요. ");
		}
		
		sc.close();
		
		
	}

}
