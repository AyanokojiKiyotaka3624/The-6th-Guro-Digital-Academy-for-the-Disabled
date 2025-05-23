package chap04.EX03;

public class ForStatement {

	public static void main(String[] args) {
		// for 문 : 조건의 참 일동안 반복, <== 배열. 컬렉션 의 값을 입력/출력
		/*
		  	for (초기값;조건;증강식) {
		  		// 실행될 구문 - 조건이 참일 동안 반복실행
		  	
		  		}
		 */

		// 0부터 99까지 반복 실행
		for (int i = 0 ; i < 100; i++ ) {
			
			System.out.println(i + "번 실행");
		}
		System.out.println("==========");
		
		// for 문으로 2 의 배수만 출력 300까지
		for (int i = 2; i <= 300; i+=2) {	// i = i+2 
			System.out.println(i + " 값을 출력 ");
		}
		
		System.out.println("==========");
		
		// for 문으로 6 의 배수만 출력 1000까지 출력
		for (int i = 6; i < 1000; i+=6) {	// i = i+2 
			System.out.println(i + " 값을 출력 ");
		}
		
		System.out.println("==========");
		
		// for 문을 잘못 처리하면 무한루프에 빠진다.
//		for (int i = 0 ; i < 10 ; i-- ) {
//			System.out.println(" 무한 루프 - 조건을 잘못 처리함. ");
//		}
		
		// for 문에서 조건을 빼면 무한 루프 ; 조건에 true 가 자동으로 JVM 이 넣는다.
//		for (int i = 0 ;  ; i++) {
//		System.out.println(i);
//		}
		
		// for 을 사용해서 2단을 출력
		for (int i=1 ; i < 10 ; i++ ) {
			System.out.println( "2 * " + i + " = " + (2 *i) );
		}
		
		System.out.println("==========");
		
		// for 문을 사용해서 3단 출력
		int dan = 3;
		
		for (int i = 1 ; i < 10 ; i++) {
			System.out.println( dan + " * " + i + " = " + (dan * i) ) ;
		}
		
		
		
		
		
		
	}

}
