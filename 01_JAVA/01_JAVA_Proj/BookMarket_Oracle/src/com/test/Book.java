package com.test;

// DTO : DB 테이블의 컬럼이 매핑
public class Book {
	String bookNum;		// 책의 고유 번호
	String bookName;	// 책의 이름
	int bookPrice;		// 책의 가격

	
	
	// 생성자 : 기본생성자, 모든 필드의 값을 초기화 하는 생성자 1
	public Book() {}
	public Book(String bookNum, String bookName, int bookPrice) {
		super();
		this.bookNum = bookNum;
		this.bookName = bookName;
		this.bookPrice = bookPrice;
	}
	
	
	// getter, setter
	public String getBookNum() {
		return bookNum;
	}
	public void setBookNum(String bookNum) {
		this.bookNum = bookNum;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public int getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}

	
	// toString() 오버 라이딩
	@Override
	public String toString() {
		return "BookTest [bookNum=" + bookNum + ", bookName=" + bookName + ", bookPrice=" + bookPrice + "]";
	}
	
}
