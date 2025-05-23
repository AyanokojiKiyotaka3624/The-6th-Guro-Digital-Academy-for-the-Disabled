package com.test;

import java.util.ArrayList;

public class FluitTest {

    public static void main(String[] args) {
        // Fluit 객체 5개 생성
        Fluit apple = new Fluit("Apple", "Red", 10);
        Fluit banana = new Fluit("Banana", "Yellow", 8);
        Fluit grape = new Fluit("Grape", "Purple", 15);
        Fluit orange = new Fluit("Orange", "Orange", 12);
        Fluit kiwi = new Fluit("Kiwi", "Green", 6);

        // ArrayList에 저장
        ArrayList<Fluit> fluitList = new ArrayList<>();
        fluitList.add(apple);
        fluitList.add(banana);
        fluitList.add(grape);
        fluitList.add(orange);
        fluitList.add(kiwi);

        // 일반 for문 출력
        System.out.println("== 일반 for문 출력 ==");
        for (int i = 0; i < fluitList.size(); i++) {
            System.out.println(fluitList.get(i));
        }

        // 향상된 for문 출력
        System.out.println("\n== 향상된 for문 출력 ==");
        for (Fluit f : fluitList) {
            System.out.println(f);
        }
    }
}
