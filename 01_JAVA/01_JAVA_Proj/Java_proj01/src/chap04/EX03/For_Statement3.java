package chap04.EX03;

public class For_Statement3 {

	public static void main(String[] args) {
		// for 문에서 도달 할 수 없는 코드 오류
		
		// 1. 무한 루프 하위에서 코드를 작성하면 : 도달 할 수 없는 코드 오류
//		for (int i =0 ; ; i++) {
//			System.out.println(i);
//		}
		
//		System.out.println(" 도달 할 수 없는 코드 오류 발생 ");
		
		// 2. break; 구문 다음의 코드를 작성 하면 : 도달 할 수 없는 코드 오류
		
		for (int i =0 ; i < 1000 ; i++ ) {
			
			if ( i == 100 ) {
				break;
//				System.out.println(" 도달 할 수 없는 오루 발생 ");
			}
			System.out.println(i);
		}
		
		System.out.println("========== continue ==========");
		
		// continue : 하위의 코드를 실행없이 증감식으로 이동함.
		
		// for문을 사용해서 3의 배수는 제거하고 1 ~ 1000 까지의 값을 출력
		for (int i =1 ; i <=10; i++) {
			
			if ( i % 3 == 0 ) { 	// 3의 배수
				continue;
				
			}
			
			System.out.println(i);
		}
		
		
		
		

	}

}
