package LAB.EX1;

public class For_2 {

	public static void main(String[] args) {
		// ﻿이중 for 문을 사용하여 구구단 전체를 출력하는 프로그램을 작성하세요.

        for (int dan = 2; dan <= 9; dan++) {
            System.out.println("== " + dan + "단 ==");
            for (int i = 1; i <= 9; i++) {
                System.out.println(dan + " x " + i + " = " + (dan * i));
            }
            System.out.println(); // 줄 바꿈
        }
		
	}

}
