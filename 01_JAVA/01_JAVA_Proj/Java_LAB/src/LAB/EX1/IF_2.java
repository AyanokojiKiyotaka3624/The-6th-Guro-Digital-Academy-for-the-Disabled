package LAB.EX1;

import java.util.Scanner;

public class IF_2 {

	public static void main(String[] args) {
		// ﻿If 문 (조건문)﻿﻿
		// ﻿체온을 입력받아 37.5도 이상이면 "발열", 35.0도 이하면 "저체온", 그 외에는 "정상"을 출력하는 프로그램을 작성하세요.

		try (Scanner scanner = new Scanner(System.in)) {
			System.out.print("체온을 입력하세요: ");
			double temperature = scanner.nextDouble();

			if (temperature >= 37.5) {
			    System.out.println("발열");
			} else if (temperature <= 35.0) {
			    System.out.println("저체온");
			} else {
			    System.out.println("정상");
			}
		}
		
	}

}
