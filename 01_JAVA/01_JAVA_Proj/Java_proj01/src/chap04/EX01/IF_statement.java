package chap04.EX01;

public class IF_statement {

	public static void main(String[] args) {
		// if 구문 : 3가지 타입이 있다. if 만 , if ~ else , if ~ else if..else if.<== 조건이 여러개일때
		// if 문은 실행후 break 가 내장되어 있다. , switch 문은 break를 넣어야 한다.
			// break : switch , for , while , do while문에서 구문을 빠저나올때
		
		// Type 1 : if 구문만 존재할때
		int value1 = 5;
		
		if (value1 > 3) {
			System.out.println("실행됨");	// 조건이 true 일때 실행됨
			
		}

			// 실행문이 1개인 경우 () 생략할 수 있다. 생략되면 JVM 이 할당함.
		if (value1 > 2 )
			System.out.println("실행됨2");
		
		if (value1 > 10 ) {
			System.out.println("실행3"); // 조건이 false 구문이 작동 되지 않음
		}
		System.out.println();
		
		// Type 2 : if ~ else 	<==> 3항 연산자로 처리 (한라인으로 처리)
		boolean bool1 = true;
		boolean bool2 = false;
		
		if (bool1) {
			// 조건이 참일때 작동
			System.out.println("실행4"); 		// 실행4
		}else {
			// 조건이 거짓일때 작동
			System.out.println("실행5");
		}
		
		// if else는 3항 연산자로 간략 하게 처리
		System.out.println((bool2) ? "실행6": "실행7"); 	//실행7

		// Type 3 : 조건이 여러개 일때 처리
		
		// 학점을 출력 하는 프로그램 : A 학점 , B 학점 , C 학점 , 조건에 맞는 블락을 실행후 break로 if 문을 빠저나온다.
		
		int value2 = 75;
		
		if ( value2 >= 90 ) {
			System.out.println("A 학점");
		}else if ( value2 >= 80 ) {
			System.out.println("B 학점");
		}else if ( value2 >= 70 ) {
			System.out.println("C 학점");
		}else if ( value2 >= 60 ) {
			System.out.println("D 학점");
		} else {
			System.out.println("F 학점");
		}
		System.out.println("==========");
		
		// 문제 있는 프로그램 < 새밀하게 조건을 처리해야함 > 
		if ( value2 >= 60 ) {
			System.out.println("D 학점");
		}else if ( value2 >= 60 ) {
			System.out.println("C 학점");
		}else if ( value2 >= 70 ) {
			System.out.println("B 학점");
		}else if ( value2 >= 80 ) {
			System.out.println("A 학점");
		} else {
			System.out.println("F 학점");
		}
		
		// 문제 해결된 프로그램 : 조건을 새밀 하게 처리 : true && true 일때만 전체 true
		if ( value2 >= 90 && value2 < 70 ) {
			System.out.println("D 학점");
		}else if ( value2 >= 70 && value2 < 80 ) {
			System.out.println("C 학점");
		}else if ( value2 >= 80 && value2 < 90 ) {
			System.out.println("B 학점");
		}else if ( value2 >= 90 && value2 < 100 ) {
			System.out.println("A 학점");
		} else {
			System.out.println("F 학점");
		}
		
		
		
		
		
		
		
		
		
		
	}

}
