package com.test;

import java.util.ArrayList;
import java.util.List;

public class BookTest {

	public static void main(String[] args) {
		
		// List<Book> bookList = new ArrayList<Book>();
		
		// ArrayList : 컬렉션 : 방이 자동으로 늘어남. 배열은 방이 고정되어 있다.
		
		// ArrayList 객체 선언
		List<Book> bookList1 = new ArrayList<Book>();
		
        Book book1 = new Book("SN1234", "Java책", 30000);
        Book book2 = new Book("SN1235", "SQL책", 40000);
        Book book3 = new Book("SN1236", "HTML책", 50000);
        Book book4 = new Book("SN1237", "Spring책", 60000);
        
        // 북 객체를 ArrayList에 저장
        bookList1.add(book1);
        bookList1.add(book2);
        bookList1.add(book3);
        bookList1.add(book4);

        // 출력 : 
        System.out.println("방의갯수 : " + bookList1.size());
        
        for (int i = 0 ; i < bookList1.size() ; i++) {
        	System.out.println(bookList1.get(i));
        }
        System.out.println("===== 향상된 for문 =====");
        for (Book b : bookList1) {
        	System.out.println(b);
        }
        
        
        
        
        
        
        
        
        
        
	}
}
