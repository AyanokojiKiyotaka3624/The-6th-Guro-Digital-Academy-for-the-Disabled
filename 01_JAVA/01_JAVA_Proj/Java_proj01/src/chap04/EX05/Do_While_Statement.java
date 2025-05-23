package chap04.EX05;

public class Do_While_Statement {

	public static void main(String[] args) {
		/*
			do while 문 : 조건이 참일 동안 반복 , for while , do while
						: 무조건 조건에 상관없이 1번을 실행
						
				초기값
				do {
					실행문;
					증감식;
					} while (조건) ;
					
					
				초기값
				while (조건) {
					실행문;
					증감식;
				}
				
		 */
		
		// 1. do while 문 사용
		
		int i = 1;
		
		do {
			System.out.println(i);
			i++;
		} while ( i < 10 );
		
		
		System.out.println("==========");
		// 1 ~ 1000 까지 10 씩 증가하는 프로그램 작성 , 증강을 10씩 처리 해서 출력
		
		int j = 10;
		do {
			System.out.println(j);
			j+=10; 	// j = j + 10
		}while (j <1000);
		
		
		System.out.println("==========");
		// 1~100 까지 10 씩 증가하는 프로그램 작성 , 1씩 증가하면서 if 조건으로 처리함.
		int k = 1;
		do {
			if (k % 10 == 0 ) {
				System.out.println(k);
			}
			k++;
		}while( k <=100 );
		
		System.out.println("==========");
		// 1~100 까지 10 씩 증가하는 프로그램 작성 , 1씩 증가하면서 continue로 처리
		
		int g = 10;
		do {
			if (g % 10 != 0) {	// 10의 배수가 아니면 true
			g++;
			continue;
			}
				
			System.out.println(g);
			g++;
			
		}while (g <= 100);
		
		
		
		
		
		
		}
		

	}