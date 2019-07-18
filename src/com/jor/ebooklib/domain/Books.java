package com.jor.ebooklib.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * 实体书
 * @author Administrator
 * CREATE TABLE `books` (
  `books_id` varchar(16) NOT NULL COMMENT '实体书编号',
  `is_borrow` varchar(1) NOT NULL COMMENT '是否借出 0-否 1-是',
  `books_book_id` bigint(32) NOT NULL COMMENT '书本信息索引外键',
  PRIMARY KEY (`books_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */
public class Books {
	private String books_id;
	private String is_borrow;
	
	private Set<Borrow> borrow_b = new HashSet<Borrow>() ;
	private Book book = new Book();

	public String getBooks_id() {
		return books_id;
	}

	public void setBooks_id(String books_id) {
		this.books_id = books_id;
	}

	public String getIs_borrow() {
		return is_borrow;
	}

	public void setIs_borrow(String is_borrow) {
		this.is_borrow = is_borrow;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Set<Borrow> getBorrow_b() {
		return borrow_b;
	}

	public void setBorrow_b(Set<Borrow> borrow_b) {
		this.borrow_b = borrow_b;
	}
	
	
}
