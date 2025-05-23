package chap04.LAB;

import java.util.Scanner;

public class For_Statement {

	public static void main(String[] args) {
		// 스캐너로 단을 입력 받아서 출력 하는 프로그램을 생성 , for 문을 사용해서 작성.
		Scanner scanner = new Scanner(System.in);

		System.out.println("출력할 단을 정수로 입력하세요");
		int dan = scanner.nextInt();
		
		// for 문으로 입력받은 단을 출력
		System.out.println( dan + " 단 출력 ");
		System.out.println("==========");
		
		for (int i = 1 ; i < 10 ; i++) {
			System.out.println( dan + " * " + i + " = " + (dan * i));
		}
		
		
		
		
//		System.out.print("출력할 단을 입력하세요: ");
//        int dan = scanner.nextInt();
//        
//        System.out.println(dan + "단 출력:");
//        for (int i = 1; i <= 9; i++) {
//            System.out.println(dan + " x " + i + " = " + (dan * i));
//        }
		
		
		
	}

}
