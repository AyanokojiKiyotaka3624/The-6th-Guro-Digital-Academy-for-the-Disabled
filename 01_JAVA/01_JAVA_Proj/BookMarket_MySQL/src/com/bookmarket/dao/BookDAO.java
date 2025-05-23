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

	private final String url = "jdbc:mysql://localhost:3306/bookmarket";
	private final String user = "root";
	private final String password = "1234";

	public Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, user, password);

	}

	public void insert(Book book) {
		String sql = "INSERT INTO books VALUES (?, ?, ?, ?, ?, ?, STR_TO_DATE(?, '%Y/%m/%d'))";
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

	public List<Book> getAll() {
		List<Book> list = new ArrayList<>();
		String sql = "SELECT * FROM books";
		try (Connection conn = getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {
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

	public void update(Book book) {
		String sql = "UPDATE books SET title=?, price=?, author=?, description=?, category=?, publish_date=STR_TO_DATE(?, '%Y/%m/%d') WHERE isbn=?";
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

