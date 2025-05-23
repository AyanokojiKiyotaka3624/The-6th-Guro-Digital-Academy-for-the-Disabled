package chap03.EX03;

public class Operator3 {
	public static void main(String[] args) {
		/*
		 	삼한 연산자 : (조건) ? 조건이참일때값:조건이거짓일때값
		 */
		
		System.out.println( (true)? 10 : 20 ); // 10
		System.out.println( (false)? 10 : 20 ); // 20
		
		// 변수의 값을 담아서 처리
		
		boolean b = true ;
		
		int a = (b) ? 30 : 40 ;
		
		System.out.println(a); // 30
		
		boolean c = false ;
		
		int d = (c)? 50 : 60 ;
		System.out.println(d); // 60
		
		
		
		
		
		
		
	}

}
