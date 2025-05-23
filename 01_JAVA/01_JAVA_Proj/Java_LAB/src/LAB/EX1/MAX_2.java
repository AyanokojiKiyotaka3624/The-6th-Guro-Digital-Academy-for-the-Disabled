package LAB.EX1;

public class MAX_2 {

	public static void main(String[] args) {
		// ﻿정수 배열의 평균을 계산하는 프로그램을 작성하세요.

		int[] arr = {10, 20, 30, 40, 50};

        int sum = 0;

        // 배열의 합 구하기
        for (int i = 0; i < arr.length; i++) {
            sum += arr[i];
        }

        // 평균 계산 (정수 -> 실수형으로 형변환)
        double average = (double) sum / arr.length;

        System.out.println("배열의 합: " + sum);
        System.out.println("배열의 평균: " + average);
		
	}

}
