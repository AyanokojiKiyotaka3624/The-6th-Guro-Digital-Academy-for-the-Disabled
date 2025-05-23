package LAB.EX1;

public class For {

	public static void main(String[] args) {
		// ﻿1부터 100까지의 짝수의 합을 출력하는 프로그램을 작성하세요.
		
        int sum = 0;

        for (int i = 1; i <= 100; i++) {
            if (i % 2 == 0) {
                sum += i;
            }
        }

        System.out.println("1부터 100까지의 짝수의 합: " + sum);


	}

}
