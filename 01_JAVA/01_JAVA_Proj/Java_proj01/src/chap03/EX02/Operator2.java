package chap03.EX02;

public class Operator2 {

	public static void main(String[] args) {
		// 비교 연산자 : < : 작다 . > : 크다 , <= : 크거나 같다. >= : 크거나 같다 , == : 같다 . != : 같지 않다.
			// 비교한 결과를 true. false
		
		System.out.println( 3 < 5 ); 	// true
		System.out.println( 3 > 5 ); 	// false
		System.out.println( 3 <= 5 ); 	// true
		System.out.println( 5 <= 5 ); 	// true
		System.out.println( 4 == 5 ); 	// false
		System.out.println( 4 != 5 ); 	// true
		
		/* 대입 연산자 : = : 오른쪽의 값을 왼쪽 변수에 저장
			+= : a += b (즉약 표현) <== a = a + b (풀어쓴 표현)
			-= : a -= b (즉약 표현) <== a = a - b (풀어쓴 표현)
			*= : a *= b (즉약 표현) <== a = a * b (풀어쓴 표현)
			/= : a /= b (즉약 표현) <== a = a / b (풀어쓴 표현)
		*/
		
		int vall = 2 ;
		System.out.println(vall += 7); 	// vall = vall + 7 , 출력값은 9
		System.out.println(vall -= 7); 	// vall = vall - 7 , 출력값은 2
		System.out.println(vall *= 7); 	// vall = vall * 7 , 출력값은 14
		System.out.println(vall /= 7);	// vall = vall / 7 , 출력값은 2
		
	}

}
