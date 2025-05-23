package chap01.ex01;

public class PlusOperator {

	public static void main(String[] args) {
		// + 연산자 가 연산으로 사용될때
		
		int a = 10;
		int b = 20;
		
		System.out.println("a 와 b의 합 : " + (a+b));
		
		
		// + 가 연결의 의미로 사용될때 : string + String 연결 할때 사용됨

		System.out.println(7 + a);	// 연산자 : 17
		
		System.out.println("7" + a); // 연결을 의미 : 710
	}

}
