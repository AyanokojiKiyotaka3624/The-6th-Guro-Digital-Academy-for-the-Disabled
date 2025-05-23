package chap02.EX01;

public class UseDataType {

	public static void main(String[] args) {
		// 한줄 주석 : 프로그램에서 컴파일에서 제외 되는 내용
		/*
		 * 여러줄 주석
		 */

		// main 메소드 는 java 에서 view 에 해당
		
		// 변수는 반드시 선언 해서 사용함. 변수에 들어갈 자료형을 지정
		// 변수 선언과 동시에 값할당.
		int a = 3;
		
		// 변수 언언과 값 할당 분리
		int b ;
		b= 4;
		
		System.out.println(a);
		System.out.println(b);
		System.out.println();
		
		// 기본 자료형 (8개) : 정수(byte, short, int, long) 실수( float, double ) 문자(char), 참/거짓(boolean)
			// 메모리의 스택공간에 저장됨
			// 소문자로 시작
		// 참조 자료형 (무한대) : 객체, 배열, 안토패아스, 컬렉션
			// 메모리의 힙공간의 저장됨
			// sring : 문자열을 담는 자료형, (객체)
			// 첫자가 대문자로 시작

		// 계산기 : 실행에서 calc
		byte aa = -100; 	// -128 ~ 127 까지의 정수만 할당.
		
		// short : 2byte = 16bit : -32,768 ~ 136767 범위의 정수의 값만 할당
		short bb = -32768;
		// int : 1byte = 32bit : 2,147,483,648 ~ 2,147,483,647
		int cc = 2147483647;
		
		long dd = 2147483647700000L;	// long 형의 값넣을 때 L , l
		
		
		// 실수 : float, double (기본)
		
		
		// float 은 소수점 7자리까지의 정밀도를 유지
		float ee = 3.7777777F;	// float에 실수의 값을 넣을때 F , f
		
		System.out.println(ee);
		
		// double : 소수점 15자리까지 정밀도가 유지됨 : 좀더 정확한 계산 필요
		double ff = 8.8888888888888889999999999;
		System.out.println(ff);
		
		// boolean : true, false 값만 할당가능
		boolean gg = true;
		
		// char : 한글자만 입력, ''를 사용해서 값을 할당.
		// 유니 코드표 : 구글 검색 : 유니코드 변환기 , 아스키 코드(영문소/대. 숫자. 특수문자) 값으로 넣을 수 있음.
		char hh = 'A';
		
		System.out.println(hh);
		
		char ii = '가';
		char jj ='\uac00';
		char kk = 65 ; // A
		
		
		System.out.println(ii);
		System.out.println(jj);
		System.out.println(kk); // A
		System.out.println("==========");
		
		// int i = 10;  전역 변수
		
		// 반복문(for) 을 사용해서 A(65) ~ Z(90) 까지 출력
		for (int i= 65 ; i < 91 ; i++ ) {
			char alpabat = (char) i ;
			System.out.print(alpabat);
		}
		System.out.println();
		
		// 반복문(for) 을 사용해서 소문자 a(97) ~ Z(122) 까지 출력
		for (int i = 97; i <123 ; i++) {
			char alpabat = (char)i ;
			System.out.print(alpabat);
			
		}
		
		
		
	}

}
