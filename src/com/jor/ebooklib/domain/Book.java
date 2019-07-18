package com.jor.ebooklib.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * 书本实体
 * @author Administrator
 * CREATE TABLE `book` (
  `book_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '书本主键',
  `book_name` varchar(32) NOT NULL COMMENT '书本名字',
  `book_author` varchar(16) NOT NULL COMMENT '书本作者',
  `book_isbn` varchar(32) DEFAULT NULL COMMENT '书本的isbn编号',
  `book_publishing` varchar(16) DEFAULT NULL COMMENT '书本出版社',
  `book_synopsis` varchar(255) DEFAULT NULL COMMENT '书本简介',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
 */
public class Book {
	private Long book_id;
	private String book_name;
	private String book_author;
	private String book_isbn;
	private String book_publishing;
	private String book_synopsis;
	private String book_image;
	private Long book_total;
	private Long book_residue;
	private String book_sortnumber;
	private String book_state;
	
	private Set<Books> bookss = new HashSet<Books>();
	private Set<Category> book_cates = new HashSet<Category>();

	public Set<Category> getBook_cates() {
		return book_cates;
	}

	public void setBook_cates(Set<Category> book_cates) {
		this.book_cates = book_cates;
	}

	public Long getBook_id() {
		return book_id;
	}

	public void setBook_id(Long book_id) {
		this.book_id = book_id;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getBook_author() {
		return book_author;
	}

	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}

	public String getBook_isbn() {
		return book_isbn;
	}

	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}

	public String getBook_publishing() {
		return book_publishing;
	}

	public void setBook_publishing(String book_publishing) {
		this.book_publishing = book_publishing;
	}

	public String getBook_synopsis() {
		return book_synopsis;
	}

	public void setBook_synopsis(String book_synopsis) {
		this.book_synopsis = book_synopsis;
	}

	public Set<Books> getBookss() {
		return bookss;
	}

	public void setBookss(Set<Books> bookss) {
		this.bookss = bookss;
	}

	public String getBook_image() {
		return book_image;
	}

	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}

	public Long getBook_total() {
		return book_total;
	}

	public void setBook_total(Long book_total) {
		this.book_total = book_total;
	}

	public Long getBook_residue() {
		return book_residue;
	}

	public void setBook_residue(Long book_residue) {
		this.book_residue = book_residue;
	}

	public String getBook_sortnumber() {
		return book_sortnumber;
	}

	public void setBook_sortnumber(String book_sortnumber) {
		this.book_sortnumber = book_sortnumber;
	}

	public String getBook_state() {
		return book_state;
	}

	public void setBook_state(String book_state) {
		this.book_state = book_state;
	}
	
	
}
