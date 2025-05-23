package chap03.EX01;

public class ArithmeticOperator {

	public static void main(String[] args) {
		// 산술 연산자 ( +, -, *, /, %(나눈 나머지) <== 2의 배수, 3의 배수
		
		System.out.println( 5 + 3 ); // 8
		System.out.println( 5 - 3 ); // 2
		System.out.println( 5 * 3 ); // 15
		System.out.println( 5 % 3 ); // 2 <== 나머지 값만 출력
		System.out.println();
		
		// 증강 연산자 : ++ :1씩증가 , -- :1씩감소 , 변수 앞에 , 병수 뒤
		int a = 10 ;
		a++;
		System.out.println(a);	// 11
		a++;
		System.out.println(a);	// 12
		++a ;
		System.out.println(a);	// 13 
		System.out.println();
		
		int b = 20 ;
		b-- ;
		System.out.println(b); 	// 19
		--b;
		System.out.println(b); 	// 18
		System.out.println();
		
		// 비트 연산자 : & <== (and)모두 참일때 참, | <==(or)
		// 하나만 참이면 참, ~ <== (not) 참일때 거짓 , 거짓일때 참, ^ <== (xor) 모두 같을때 거짓, 다를때 참 
		
		System.out.println(3 & 2); 	// 2
		System.out.println(true & false); 	// false
		System.out.println(false & false); 	// false
		System.out.println(false & true); 	// false
		System.out.println(true & true); 	// true
		System.out.println();
		
		System.out.println(3 | 2); 	// 3
		System.out.println(true | false); 	// true
		System.out.println(false | false); 	// false
		System.out.println(false | true); 	// true
		System.out.println(true | true); 	// true
		System.out.println();
		
		System.out.println(3 ^ 2); 	// 3
		System.out.println(true ^ false); 	// true
		System.out.println(false ^ false); 	// false
		System.out.println(false ^ true); 	// true
		System.out.println(true ^ true); 	// false
		System.out.println();

		System.out.println( ~2); 	// 3
		System.out.println( !false); 	// true
		System.out.println( !true); 	// false
		System.out.println();
		
		
		// 논리 연산자 : && <= (and) 모두 참일때 참, || <= (or) 하나만 참 이면 참 , ^ <= (xor) 앞뒤가 같으면 거짓, 다르면 참
				// ! <= (not) : 참이면 거짓, 거짓이면 참
			// 쇼트 서킷이 발생할 수 있다.비트 연산자를 사용하면 쇼트서킷을 방지할 수 있다.
				// 쇼트 서킷은 &&연산에서 앞의 값이 false 일 경우 뒷 코드를 실행하지 않는다.
					// || 연산에서 앞의 값이 true 이면 뒤의 코드를 실행하지 않는다.
		
		// &&
		System.out.println(true && true); // true
		System.out.println(true && false); // false
		System.out.println(false && true); // false <== 쇼트 서킷 발생
		System.out.println(false && false); // false <== 쇼트 서킷 발생
		System.out.println();
		
		// ||
		System.out.println(true || true); // true <== 쇼트 서킷 발생
		System.out.println(true || false); // true <== 쇼트 서킷 발생
		System.out.println(false|| true); // true
		System.out.println(false || false); // false
		System.out.println();
		
		// ^ : 앞 뒤의 값이 같으면 false . 다르면 true
		System.out.println(true ^ true); // false
		System.out.println(true ^ false); // true
		System.out.println(false^ true); // true
		System.out.println(false ^ false); // flase
		System.out.println();
		
		System.out.println("===쇼트 서키쇼 예제===");
		
		int vall = 3;
		System.out.println(false && ++vall > 6 ) ; 	// 쇼트 서킷 발생
		// System.out.println(false & ++vall > 6 ) ; <== 쇼트 서킷 방지 . 비트 연산자를 사용
		
		System.out.println(vall ); 	// 4출력 되야 되는데 쇼트 서킷으로 실행 안됨 3이 출력
		
		System.out.println("==========");
		int val2 = 5 ;
		 System.out.println(true || ++val2 > 7 ); // 쇼트 서킷 발생 . 5
		// System.out.println(true | ++val2 > 7 ); // 쇼트 서킷 방지 , 비트연산자 . 6
		System.out.println(val2); 
		
		

	}

}
