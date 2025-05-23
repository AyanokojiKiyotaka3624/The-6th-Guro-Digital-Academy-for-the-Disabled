package chap04.LAB;

public class For_Statement2 {

	public static void main(String[] args) {
		// 2중 for 문을 사용해서 1단 ~ 19단까지 출력
		
		// 바깥쪽 for 단을 출력하는 for , 안쪽 for 각 단의 1 ~ 19 까지 출력
		
		for (int i = 1 ; i < 20 ; i++ ) {
			System.out.println(i + "단 출력 ");
			System.out.println("==========");
			for (int j = 1; j <20 ; j++ ) {
				System.out.println(i + " * " + j + " = " + (i * j));
			}
		System.out.println();
		
		}
		

	}

}
