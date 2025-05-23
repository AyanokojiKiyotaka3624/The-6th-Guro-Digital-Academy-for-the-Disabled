package chap02.EX05;

import java.util.Scanner;

public class Scanner_LAB {

	public static void main(String[] args) {
		// 스캐너로 국어 점수 , 영어 점수 , 과학 점수 , 음악 점수를 입력 받아서, 각 과목이 입력 받은 값을 출력하고, 합계, 평균을 출력
		// 1. 스캐너 선언
		Scanner sc = new Scanner(System.in);
		
		System.out.println("국어점수를 입력해주세요>>>");
		int kor = sc.nextInt();
		System.out.println("영어점수를 입력하세요>>>");
		int eng = sc.nextInt();
		System.out.println("과학점수를 입력하세요>>>");
		int sience = sc.nextInt();
		System.out.println("음악점수를 입력하세요>>>");
		int music = sc.nextInt();
		
		
		int sum = kor + eng + sience + music ;
		double avg = sum / 4.0 ;
		
		System.out.println("합계계는 " + sum);
		System.out.println("평균은 " + avg);
		
		sc.close();
		
//        // 각 과목 점수 입력
//        System.out.print("국어 점수: ");
//        int korean = scanner.nextInt();
//
//        System.out.print("영어 점수: ");
//        int english = scanner.nextInt();
//
//        System.out.print("과학 점수: ");
//        int science = scanner.nextInt();
//
//        System.out.print("음악 점수: ");
//        int music = scanner.nextInt();
//
//        // 합계 및 평균 계산
//        int total = korean + english + science + music;
//        double average = total / 4.0;
//
//        // 결과 출력
//        System.out.println("\n입력된 점수:");
//        System.out.println("국어: " + korean);
//        System.out.println("영어: " + english);
//        System.out.println("과학: " + science);
//        System.out.println("음악: " + music);
//        System.out.println("합계: " + total);
//        System.out.printf("평균: %.2f\n", average);
//
//        scanner.close();
	}

}
