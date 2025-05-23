package LAB.EX02;

import java.util.Scanner;

public class Lab_04_08 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a; // 사용자 입력 변수

        while (true) {
            System.out.println("=============================================");
            System.out.println("1. 구구단 출력 ");
            System.out.println("2. 19단 출력");
            System.out.println("3. 1 ~ 1000까지 3의 배수 출력");
            System.out.println("4. 10개의 정수를 입력받아 그 수들 중 짝수의 개수 출력");
            System.out.println("5. 프로그램 종료");
            System.out.println("=============================================");
            System.out.print("위의 내용을 정수로 입력 하세요 >>> ");
            a = sc.nextInt();

            switch (a) {
                case 1:
                    ew(sc);
                    break;
                case 2:
                    cd();
                    break;
                case 3:
                    ol();
                    break;
                case 4:
                    hj(sc);
                    break;
                case 5:
                    System.out.println("프로그램을 종료합니다.");
                    sc.close();
                    return; // main 종료 -> 프로그램 종료
                default:
                    System.out.println("잘못된 입력입니다.");
            }
            System.out.println(); // 보기 좋게 줄바꿈
        }
    }

    // 1. 구구단 출력
    public static void ew(Scanner sc) {
        System.out.print("출력할 단을 입력하세요 (2~9): ");
        int z = sc.nextInt();
        if (z < 2 || z > 9) {
            System.out.println("2~9단만 입력 가능합니다.");
            return;
        }
        for (int a = 1; a <= 9; a++) {
            System.out.printf("%d x %d = %d\n", z, a, z * a);
        }
    }

    // 2. 19단 출력
    public static void cd() {
        for (int l = 1; l <= 19; l++) {
            for (int k = 1; k <= 19; k++) {
                System.out.printf("%2d x %2d = %3d\t", l, k, l * k);
            }
            System.out.println();
        }
    }

    // 3. 1~1000까지 3의 배수 출력
    public static void ol() {
        for (int m = 1; m <= 1000; m++) {
            if (m % 3 == 0) {
                System.out.print(m + " ");
            }
        }
        System.out.println();
    }

    // 4. 10개의 정수를 입력받아 그 중 짝수 개수 출력
    public static void hj(Scanner sc) {
        int cou = 0;
        System.out.println("10개의 정수를 입력하세요:");
        for (int b = 0; b < 10; b++) {
            int g = sc.nextInt();
            if (g % 2 == 0) {
                cou++;
            }
        }
        System.out.println("짝수의 개수: " + cou);
    }
}
