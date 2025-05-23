package chap02.EX04;

// 외부 라이브러리 import
import java.util.Scanner;

public class ScannerTest {

	public static void main(String[] args) {
		// Scanner 사용법 : 콘솔에서 값을 입력받아서 처리함.	Scanner 라이브러리가 import
		//		객체를 생성 , 모두 사용후 메모리에서 제거해 줘야한다.
		
		// 1. Scanner 객체 생성 
		Scanner scanner = new Scanner(System.in);
		// 클래스명 객체명 = 힙에저장 객체명(생성자);
		
		System.out.println("이름을 입력하세요 >>>");
		String name = scanner.next();
		
		System.out.println("나이를 입력하세요 >>>");
		int age = scanner.nextInt();
		
		System.out.println("몸무개를 입력하세요 >>>");
		double waight = scanner.nextDouble();
		
		System.out.println("당신의 이름은 " + name + "이고, " + " 나이는 " + age + "살이고, 몸무개는 " + waight + "kg 입니다");
		
		// 스캐너 사용후 메모리에서 제거
		scanner.close();
		
	}

}
