package com.bookmarket.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bookmarket.model.Book;

public class BookDAO {
	// DAO ( Data Access Object ) : DB에게 CRUD하는 메소드를 가지고 DB를 조작 한다.

	// DataBase Connection : DB 연결 , 상수 : 값을 수정 할 수 없도록 설정
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String user = "C##BOOKMARKET";
	private final String password = "1234";

	public Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, user, password);

	}

	// DB에 Insert 메소드 : Book 을 인풋 받아서 DB에 저장
	public void insert(Book book) {
		String sql = "INSERT INTO books VALUES (?, ?, ?, ?, ?, ?, TO_DATE(?, 'YYYY/MM/DD'))";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, book.getIsbn());
			ps.setString(2, book.getTitle());
			ps.setInt(3, book.getPrice());
			ps.setString(4, book.getAuthor());
			ps.setString(5, book.getDescription());
			ps.setString(6, book.getCategory());
			ps.setString(7, book.getPublishDate());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	// DB에 레코드를 읽어 와서 출력
	public List<Book> getAll() {
		List<Book> list = new ArrayList<>();
		String sql = "SELECT * FROM books";
		
		// rs (ResultSet)는 select한 레코드 전체를 담는 객체
		try (Connection conn = getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {
			
			// re.next() : 다음 레코드가 존재하면 True, 커서를 다음 래코드로 이동
			while (rs.next()) {
				Book book = new Book(rs.getString("isbn"), rs.getString("title"), rs.getInt("price"),
						rs.getString("author"), rs.getString("description"), rs.getString("category"),
						rs.getDate("publish_date").toString());
				list.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// DB에 Update 메소드 : Book을 인풋 받아서 DB에 수정
	public void update(Book book) {
		String sql = "UPDATE books SET title=?, price=?, author=?, description=?, category=?, publish_date=TO_DATE(?, 'YYYY/MM/DD') WHERE isbn=?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, book.getTitle());
			ps.setInt(2, book.getPrice());
			ps.setString(3, book.getAuthor());
			ps.setString(4, book.getDescription());
			ps.setString(5, book.getCategory());
			ps.setString(6, book.getPublishDate());
			ps.setString(7, book.getIsbn());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// DB에 Delete 메소드 : Book 을 인풋 받아서 DB에 삭제
	public void delete(String isbn) {
		String sql = "DELETE FROM books WHERE isbn=?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, isbn);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
