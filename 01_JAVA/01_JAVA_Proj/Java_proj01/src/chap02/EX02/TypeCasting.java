package chap02.EX02;

public class TypeCasting {

	public static void main(String[] args) {
		// type casting : 자바에서 = 왼쪽이 오른쪽은 동일한 타입이어야 한다.
			// byte < short < int < long < float < double
		// Up casting : 작은 자료형에서 큰 자료형으로 변환 : 수동으로 지정하지 않더라도 JVM이 자동으로 할당
		// Down cating : 큰 자료형에서 작은 자료형으로 변환 : 수동으로 명시해야 한다.

		int value1 = (int)5.3; // 다운 캐스팅
		long value2 = 1099999999 ;	// 업캐스팅 : 자동으로 이루어짐.... int -> long
		float value3 = (float) 5.8;	// 5.8은 double -> float 으로 다운 캐스팅
		double value4 = 10.77;	// 5.8 double
		
		
		
		System.out.println(value1);
		System.out.println(value2);
		
		
		System.out.println("==========");
		
		


		
		
		
	}

}
