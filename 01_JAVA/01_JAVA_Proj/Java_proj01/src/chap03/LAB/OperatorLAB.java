package chap03.LAB;

import java.util.Scanner;

public class OperatorLAB {

	public static void main(String[] args) {
		// 스캐너를 사용해서 점수 값을 인풋 받아서 홀수/짝수 인지 판별하는 프로그램을 출력해 보세요. (삼항 연산자 사용)
		// 스캐너를 사용해서 점수 값을 인풋 받아서 60점 이상이면 합격/불합격 입니다.를 판별하는 프로그램을 풀력해보세요 (삼항 연산자)
		// 완료시간 : 10시 50분까지.
		
		/*
		 * 	조건에 처리될 내용 : (조건) ? "짝수" : "홀수" 
		 * a % 2 == 0
		 */
		
		System.out.println( 5 % 2 ) ; 	// % : 나머지 값을 출력. 홀수
		System.out.println( 6 % 2 ) ; 	// 0 짝수
		
		// 3의 배수 판별 : 어떤수를 3로 나누었을때 나머지 : 0
		System.out.println( 7 % 3 ) ;
		System.out.println( 9 % 3 ) ; 	// 3의 배수
		
		// 1. 스캐너 장착
//		Scanner sc = new Scanner(System.in);
//		
//		System.out.println("정수를 입력하세요>>>");
//		int a = sc.nextInt();
//		
//		System.out.println( ( a % 2 == 0 )? "짝수": "홀수") ;
		
		Scanner sc = new Scanner(System.in);
		System.out.println("점수를 입력하세요>>>");
		int a = sc.nextInt();
		
		System.out.println( ( a > 60 )? "합격": "불합격");
		
		
		
		
		
	}

}
