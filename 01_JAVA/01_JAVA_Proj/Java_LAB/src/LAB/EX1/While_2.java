package LAB.EX1;

public class While_2 {

    public static void main(String[] args) {
        // 1부터 100까지의 짝수만 출력하는 프로그램을 작성하세요.

        int i = 1;

        while (i <= 100) {
            if (i % 2 == 0) {
                System.out.println(i);
            }
            i++;
        }
    }
}
