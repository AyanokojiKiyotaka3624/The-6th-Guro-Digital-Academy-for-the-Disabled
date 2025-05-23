package LAB.EX1;

import java.util.Arrays;

public class MAX {

	public static void main(String[] args) {
		// 모든 원소를 4가지 방법으로 출력하는 프로그램을 작성하세요. 

		 int[] arr = {10, 20, 30, 40, 50};

	        // 1. System.out.println() 직접 사용
	        System.out.println("== 1. System.out.println() 각각 출력 ==");
	        System.out.println(arr[0]);
	        System.out.println(arr[1]);
	        System.out.println(arr[2]);
	        System.out.println(arr[3]);
	        System.out.println(arr[4]);

	        // 2. 일반 for문
	        System.out.println("\n== 2. 일반 for문 ==");
	        for (int i = 0; i < arr.length; i++) {
	            System.out.println("arr[" + i + "] = " + arr[i]);
	        }

	        // 3. 향상된 for문 (for-each)
	        System.out.println("\n== 3. 향상된 for문 ==");
	        for (int num : arr) {
	            System.out.println(num);
	        }

	        // 4. Arrays.toString()
	        System.out.println("\n== 4. Arrays.toString() ==");
	        System.out.println(Arrays.toString(arr));

	}

}
