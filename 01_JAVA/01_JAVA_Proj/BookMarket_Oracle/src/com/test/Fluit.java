package com.test;

public class Fluit {
    private String fluitName;
    private String fluitColor;
    private int fluitCnt;

    // 기본 생성자
    public Fluit() {
    }

    // 모든 필드를 받는 생성자
    public Fluit(String fluitName, String fluitColor, int fluitCnt) {
        this.fluitName = fluitName;
        this.fluitColor = fluitColor;
        this.fluitCnt = fluitCnt;
    }

    // Getter & Setter
    public String getFluitName() {
        return fluitName;
    }

    public void setFluitName(String fluitName) {
        this.fluitName = fluitName;
    }

    public String getFluitColor() {
        return fluitColor;
    }

    public void setFluitColor(String fluitColor) {
        this.fluitColor = fluitColor;
    }

    public int getFluitCnt() {
        return fluitCnt;
    }

    public void setFluitCnt(int fluitCnt) {
        this.fluitCnt = fluitCnt;
    }

    // toString() 메서드
    @Override
    public String toString() {
        return "Fluit{" +
                "fluitName='" + fluitName + '\'' +
                ", fluitColor='" + fluitColor + '\'' +
                ", fluitCnt=" + fluitCnt +
                '}';
    }
}






