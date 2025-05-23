package com.bookmarket.model;

// DTO : 테이블의 컬럼명과 동일한 명/자료형을 정의함
	// DB의 테이블의 컬럼과 매핑됨
public class Book {
	
	// private는 객체명, 변수형으로 값을 직접 넣지 못하도록 보안세팅함
	// 생성자 호출, 세터 활용 필드에 직접 값 넣을 수 있음
    private String isbn;
    private String title;
    private int price;
    private String author;
    private String description;
    private String category;
    private String publishDate;


    // 생성자, getter, setter, toString() 자동으로 생성 해줌
    public Book() {}
    
    public Book(String isbn, String title, int price, String author,
                String description, String category, String publishDate) {
        this.isbn = isbn;
        this.title = title;
        this.price = price;
        this.author = author;
        this.description = description;
        this.category = category;
        this.publishDate = publishDate;
    }

    
    // 모든 필드에 대한 getter:필드의 정보를 읽을때 사용, setter: 필드의 값을 할당할때 사용
	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	// toString() 메소드 오버라이딩 : 객체 자체를 출력시 주소를 출력하지 않고 객체의 필드의 값을 출력하도록 설정
	@Override
	public String toString() {
		return "Book [isbn=" + isbn + ", title=" + title + ", price=" + price + ", author=" + author + ", description="
				+ description + ", category=" + category + ", publishDate=" + publishDate + "]";
	}
}
