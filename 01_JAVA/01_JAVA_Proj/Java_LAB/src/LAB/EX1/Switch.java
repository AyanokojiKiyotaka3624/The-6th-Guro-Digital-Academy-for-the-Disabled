package LAB.EX1;

import java.util.Scanner;

public class Switch {

    public static void main(String[] args) {
        // Switch 문을 사용해서
        // 월을 입력받아 해당 월의 계절(봄, 여름, 가을, 겨울)을 출력하는 프로그램

        try (Scanner scanner = new Scanner(System.in)) {
			System.out.print("월을 입력하세요 (1~12): ");
			int month = scanner.nextInt();

			String season;

			switch (month) {
			    case 3: case 4: case 5:
			        season = "봄";
			        break;
			    case 6: case 7: case 8:
			        season = "여름";
			        break;
			    case 9: case 10: case 11:
			        season = "가을";
			        break;
			    case 12: case 1: case 2:
			        season = "겨울";
			        break;
			    default:
			        season = "잘못된 입력입니다.";
			}

			System.out.println("계절: " + season);
		}
    }
}