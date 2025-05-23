package LAB.EX1;

import java.util.Scanner;

public class IF {

	public static void main(String[] args) {
		// ﻿﻿If 문 (조건문)﻿
		// 세 정수를 입력받아 가장 큰 수를 출력하는 프로그램을 작성하세요.﻿

		try (Scanner scanner = new Scanner(System.in)) {
			System.out.print("세 정수를 입력하세요: ");
			int a = scanner.nextInt();
			int b = scanner.nextInt();
			int c = scanner.nextInt();

			int max = a;

			if (b > max) {
			    max = b;
			}

			if (c > max) {
			    max = c;
			}

			System.out.println("가장 큰 값: " + max);
		}
		
		
	}

}