package LAB.EX1;

import java.util.Scanner;

public class While {

    public static void main(String[] args) {
        // 1부터 N까지의 합을 구하는 프로그램을 작성하세요.

        try (Scanner scanner = new Scanner(System.in)) {
            System.out.print("N을 입력하세요: ");
            int N = scanner.nextInt();

            int sum = 0;
            int i = 1;

            while (i <= N) {
                sum += i;
                i++;
            }

            System.out.println("1부터 " + N + "까지의 합: " + sum);
        }
    }
}
