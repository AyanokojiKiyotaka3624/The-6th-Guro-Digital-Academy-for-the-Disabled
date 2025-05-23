package LAB.EX1;

import java.util.Scanner;

public class Switch_2 {

	public static void main(String[] args) {
		// switch 문을 사용해서 
		// ﻿사칙연산 기호(+,-,*,/)을 입력받아 두 수를 연산하는 프로그램을 작성하세요.

		 try (Scanner scanner = new Scanner(System.in)) {
			// 입력 받기
	        System.out.print("첫 번째 숫자를 입력해 주세요: ");
	        double num1 = scanner.nextDouble();

	        System.out.print("연산자 (+, -, *, /)를 입력해 주세요: ");
	        char operator = scanner.next().charAt(0);  // 문자 하나 입력 받기

	        System.out.print("두 번째 숫자를 입력해 주세요: ");
	        double num2 = scanner.nextDouble();

	        double result;

	        switch (operator) {
	            case '+':
	                result = num1 + num2;
	                System.out.println("결과: " + result);
	                break;
	            case '-':
	                result = num1 - num2;
	                System.out.println("결과: " + result);
	                break;
	            case '*':
	                result = num1 * num2;
	                System.out.println("결과: " + result);
	                break;
	            case '/':
	                if (num2 == 0) {
	                    System.out.println("0으로 나눌 수 없습니다.");
	                } else {
	                    result = num1 / num2;
	                    System.out.println("결과: " + result);
	                }
	                break;
	            default:
	                System.out.println("올바른 연산자를 입력해 주세요. (+, -, *, /)");
	        }
		}
		
		
		
	}

}
