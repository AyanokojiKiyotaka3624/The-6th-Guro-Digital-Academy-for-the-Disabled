package chap04.EX03;

public class For_Statement {

	public static void main(String[] args) {
		// for 문에서 무한루프 탈출 하기 : if 조건 break 를 사용해서 탈출
		
		for (int i = 0 ;  ; i++ ) {
			// true 동안 실행됨
			
			if (i > 2000) {
				break;
			}
			
			System.out.println(i);
			
		}

		// 2중 for 문을 사용해서 1단 ~ 9단을 출력 하기 ,
		// 바깥쪽 for 는 단을 출력함. 안쪽 for 문 해당 단에서 1 ~ 9 까지 곱함.
		for (int i = 1 ; i < 10 ; i++ ) {
			System.out.println(i + "단 출력 ");
			System.out.println("==========");
			for (int j = 1; j <10 ; j++ ) {
				System.out.println(i + " * " + j + " = " + (i * j));
			}
			System.out.println();
			
		}
		
		
		
		
		
		
		
		
		
		
		
	}

}
