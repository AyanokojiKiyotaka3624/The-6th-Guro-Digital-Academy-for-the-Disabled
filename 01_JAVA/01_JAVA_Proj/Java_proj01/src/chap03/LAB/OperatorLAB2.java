package chap03.LAB;

import java.util.Scanner;

public class OperatorLAB2 {

	public static void main(String[] args) {
		// 스캐너를 사용해서 점수 값을 인풋 받아서 홀수/짝수 인지 판별하는 프로그램을 출력해 보세요. (삼항 연산자 사용)
		// 스캐너를 사용해서 점수 값을 인풋 받아서 60점 이상이면 합격/불합격 입니다.를 판별하는 프로그램을 풀력해보세요 (삼항 연산자)
		// 완료시간 : 10시 50분까지.
		
//		Scanner scanner = new Scanner(System.in);
//
//		System.out.print("정수를 입력하세요: ");
//		int number = scanner.nextInt();
//
//		String result = (number % 2 == 0) ? "짝수" : "홀수";
//		System.out.println("입력한 숫자 " + number + "는(은) " + result + "입니다.");
//
//		scanner.close();
		
		
 Scanner scanner = new Scanner(System.in);
        
       	System.out.print("점수를 입력하세요: ");
        int score = scanner.nextInt();
        
        String result = (score >= 60) ? "합격" : "불합격";
        System.out.println("결과: " + result);
        
        scanner.close();
		
		
	}

}
