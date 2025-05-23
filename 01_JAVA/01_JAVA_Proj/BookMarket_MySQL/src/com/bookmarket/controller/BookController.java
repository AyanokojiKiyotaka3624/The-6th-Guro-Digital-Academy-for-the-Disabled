package com.bookmarket.controller;

import java.util.List;
import java.util.Scanner;

import com.bookmarket.dao.BookDAO;
import com.bookmarket.model.Book;

public class BookController {
	// Controller : 사용자의 요청을 처리 ( 사용자는 Controller 에게 CRUD 요청을 보낸다. )
		// Backend 에게 비즈니스 로직을 처리함. ( 사용자의 요청 정보를 DTO (Book.java) 담아서 DAO의 메소드를 호출 한다.
	
	// 전체 프로세스 : 사용자가 요청 <==> Controller <==> DTO(Book.java) <==> DAO(BookDAO.java) <==> DB

    private final BookDAO dao = new BookDAO();
    private final Scanner sc = new Scanner(System.in);

    public void run() {
        while (true) {
            System.out.println("\n1. 전체 조회 | 2. 등록 | 3. 수정 | 4. 삭제 | 0. 종료");
            System.out.print("선택: ");
            int menu = sc.nextInt();
            sc.nextLine();

            switch (menu) {
                case 1 -> showAll();
                case 2 -> addBook();
                case 3 -> updateBook();
                case 4 -> deleteBook();
                case 0 -> {
                    System.out.println("종료합니다.");
                    return;
                }
                default -> System.out.println("잘못된 선택입니다.");
            }
        }
    }

    // DB 테이블(BOOKS)의 모든 레코드를 출력해달라고 요청
    private void showAll() {
    	System.out.println("1번을 호출했습니다.");
        List<Book> list = dao.getAll();
        for (Book b : list) {
            System.out.println(b);
        }
        System.out.println("전체 레코드가 잘 출력 되었습니다 >>>");
    }
    // DB에 책을 추가(Insert)
    private void addBook() {
    	System.out.println("2번을 호출했습니다.");
        System.out.print("ISBN: ");
        String isbn = sc.nextLine();
        System.out.print("제목: ");
        String title = sc.nextLine();
        System.out.print("가격: ");
        int price = sc.nextInt(); sc.nextLine();
        System.out.print("저자: ");
        String author = sc.nextLine();
        System.out.print("설명: ");
        String description = sc.nextLine();
        System.out.print("카테고리: ");
        String category = sc.nextLine();
        System.out.print("출판일(YYYY/MM/DD): ");
        String date = sc.nextLine();

        Book b = new Book(isbn, title, price, author, description, category, date);
        dao.insert(b);
    }

    private void updateBook() {
    	System.out.println("3번을 호출했습니다.");
    	
        System.out.print("수정할 ISBN: ");
        String isbn = sc.nextLine();
        System.out.print("새 제목: ");
        String title = sc.nextLine();
        System.out.print("새 가격: ");
        int price = sc.nextInt(); sc.nextLine();
        System.out.print("새 저자: ");
        String author = sc.nextLine();
        System.out.print("새 설명: ");
        String description = sc.nextLine();
        System.out.print("새 카테고리: ");
        String category = sc.nextLine();
        System.out.print("새 출판일(YYYY/MM/DD): ");
        String date = sc.nextLine();

        Book b = new Book(isbn, title, price, author, description, category, date);
        dao.update(b);
        System.out.println("업데이트가 잘 완료 되었습니다. >>>");
    }

    private void deleteBook() {
    	System.out.println("4번을 호출했습니다.");
        System.out.print("삭제할 ISBN: ");
        String isbn = sc.nextLine();
        dao.delete(isbn);
        System.out.println("성공적으로 잘 삭제 되었습니다.");
    }
	
}
