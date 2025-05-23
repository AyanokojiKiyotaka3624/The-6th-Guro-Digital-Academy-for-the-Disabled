package chap04.LAB;

public class Label_LAB {

	public static void main(String[] args) {
		// 구구단 출력 , 홀수단만 출력하되 continue, break를 사용해서 , 단을 1씩증가 false 단만 출력

		        for (int dan = 1; dan <= 9; dan++) {
		            if (dan % 2 == 0) continue; // 짝수 단은 건너뜀
		            
		            System.out.println("=== " + dan + "단 ===");
		            for (int num = 1; num <= 9; num++) {
		                System.out.println(dan + " x " + num + " = " + (dan * num));
		            }

			
			}
		
		
	}

}
