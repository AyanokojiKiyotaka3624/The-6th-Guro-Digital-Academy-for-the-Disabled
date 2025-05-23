package chap04.EX01;

import java.util.Scanner;

public class IF_Statement2 {

	public static void main(String[] args) {
		// 스캐너로 봄, 여름, 가을, 겨울을 입력 받아서 각 계절에 정보를 출력 하는 프로그램
		
		// 기본 자료형 : 변수와 값이 모두 stack 공간에 저장됨 , byte , short, int , long , char , boolean , Double , float
		//		== <== Stack 의 값을 비교
		// 참조 자료형 : 변수와 변수의 참조주소 가 stack 공간에 저장이 되고, 값은 Heap 공간에 저장됨. String 참조 자료형, 첫자를 대문자로 시작
		//		변수명.equals(비교값)
		
		// 기본 자료형의 값을 비교 : ==
		int a = 10 ;
		int b = 10 ;
		
		System.out.println(a == b); 	// stack의 값을 비교할때 사용됨
		
		// 참조 자료형의 값을 비교 : 참조객체. equals("값")
		String c = new String("안녕"); 	// 객체 생성
		String d = new String("안녕");
		
		System.out.println( c == d ); 	// false == stcak 주소를 비교, stack 주소의 번지가 각각 다르다.
		System.out.println(c.equals(d)); // true , Heap의 값을 비교. 
		
		System.out.println("============");
		Scanner sc = new Scanner(System.in);
		System.out.println("좋아하는 계절을 입력해 주세요.>> ");
		String e = sc.next();
		
		if (e.equals("봄")) {
			System.out.println("당신은 봄을 참 좋아하는 군요");
			
		} else if (e.equals("여름")) {
			System.out.println("당신은 여름을 참 좋아하는 군요");
		} else if (e.equals("여름")) {
			System.out.println("당신은 가을을 참 좋아하는 군요");
		} else if (e.equals("여름")) {
			System.out.println("당신은 겨울을 참 좋아하는 군요");
		} else {
			System.out.println("계절을 정확히 입력하세요. >>> ");
		}
		
		sc.close();
		
		
		
		
	}

}
