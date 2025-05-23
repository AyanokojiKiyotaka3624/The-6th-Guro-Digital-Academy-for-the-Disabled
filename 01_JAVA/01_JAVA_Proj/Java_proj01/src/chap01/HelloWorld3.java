package chap01;

// 패키지 : 클래스를 관리하는 폴더 개념 , 제일 첫라인에 산입 되어야 한다.

public class HelloWorld3 {

	public static void main(String[] args) {
		// 리터럴 : 변수/상수에 저장된 실제 값
		
		// 자료형 변수 = 리터럴 ;
			// 정수 : byte(1byte) , Short(2byte) , int(4byte) , long(8byte)
			// 실수 : float(4byte) , double(8byte)
			// 문자 : char , 문자 1자 'A'
			// 불리언 : boolean , true/false
		
			// 문자열 : String , ""
		
		byte bb = 7;
		short cc = 10;
		int a = 3;
		long kk = 333;
		
		float ee = 444.33F;
		double b = 10.5;
		
		boolean c = true;
		char d = 'A';

		String abc = "오늘은 풀스택 개강일 입니다. ";
		// +가 연산자로 사용된 경우
		System.out.println(a + kk);
		
		System.out.println("바이트 출력 : " + bb );
		System.out.println("short 출력 : " + cc);
		System.out.println("int 출력 " + a );
		System.out.println(abc);
		
		// + 는 연산자 : 정수 , 실수
		// + String 과 같이 사용하면 연결 연산자로 사용됨
	}

}