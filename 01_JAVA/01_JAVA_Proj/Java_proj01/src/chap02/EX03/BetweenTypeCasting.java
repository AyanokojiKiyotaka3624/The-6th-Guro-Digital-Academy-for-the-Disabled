package chap02.EX03;

import java.nio.file.FileSystemAlreadyExistsException;

public class BetweenTypeCasting {

	public static void main(String[] args) {
		// 연산 과정에서의 타입캐스팅 : 연산자 두 자료형의 타입이 일치해야 한다.
				// upcasting : 자동으로 일어난다. 작은 -> 큰
				// downcasting : 수동으로 명시해야 한다. 큰 -> 작은
		
		// 1. 같은 자료형 끼리의 연산
		int value1 = 3 + 5 ;
		int value2 = 8 / 5 ;
		float value3 = 3.0F + 5.0F;
		double value4 = 8.0 / 5.0 ;
		
		System.out.println(value1);	// 8
		System.out.println(value2);	// 1 : 몫만 출력됨 , 나머지는 출력이 안됨
		System.out.println(value3);
		System.out.println(value4);
		System.out.println();
		
		// 2. 다른 자료형 끼리의 연산
		// int balue5 = (5 + 3.5) ; // 오류 발생 : 왼쪽은 int = 오른쪽은 double
		double value6 = 5 + 3.5 ;	// 정상 작동	double = double
		
		int value7 = 5 + (int)3.5 ;	// 실수3.5를 점수로 다운캐스팅 해서 
		
		// 특수한 경우 : byte. short는 연산 결과를 int 타입으로 지정해 줘야한다.
		byte data1 = 7;
		byte data2 = 10;
		short data77 = 88;
		
		
		// byte data3 = data1 + data2;	// 오류 발생
		int data3 = data1 + data2;
		
		// short data4 = data1 + data77 ; // 오류 발생
		int data4 = data1 + data77 ;
		
		System.out.println("========== 문제풀이 ==========");
		int kor = 85;
		int eng = 91;
		int match = 77;
		
		// 합계 : 점
		// 평균 : 점
		
		
		int ace = kor + eng + match ;
		double ace1 = (double)(kor + eng + match)/3 ;
		
		System.out.println(ace);
 		System.out.println(ace1);
 		
 		int sum = kor + eng + match ;
 		double avg = sum / 3.0 ;
 		
 		System.out.println("합계 : " + (kor + eng + match) + " 점");
 		System.out.println("합계 : " + sum + " 점");
 		System.out.println("평균 : " + (kor + eng + match) / 3.0 + " 점" );
 		System.out.println("평균 : " + avg + " 점");
 		
	}

}