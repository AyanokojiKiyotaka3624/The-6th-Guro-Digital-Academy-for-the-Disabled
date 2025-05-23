package chap04.EX04;

public class Whlle_Statement {

	public static void main(String[] args) {
		// while 문 : 조건이 참일 동안 반복. for 문으로 변환가능
		/*
		 	초기식
		 	while (조건) {
		 		 조건일 참일 동안 실행;
		 		 증감식
		 	}
		 	
		 	for ( 초기값 ; 조건 ; 증감식 ) {
		 		조건이 참일 동안 실행;
		 		}
		 	
		 */

		// 1부터 1000까지의 정수 출력
		
//		int i = 1;	// 초기값
		int i;
		i = 1;
		while (i <= 100) {	// 조건
			
			System.out.println(i);
			i++;	// 증감식
		}
		
		System.out.println("========== 1~ 10 까지 2의 배수는 제거후 출력 : while ==========");
		
		int j = 1 ;
		while (j <= 10) {
			if (j % 2==0) {
				j++;
				continue;
			}
			System.out.println(j);
			j++;
		}
		
		
		
		
		
		
	}

}
