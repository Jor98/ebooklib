package com.jor.ebooklib.domain;

import java.util.HashSet;
import java.util.Set;

public class Category {
	private Long category_id;
	private String category_name;
	
	private Set<Book> cate_books = new HashSet<Book>();
	
	public Set<Book> getCate_books() {
		return cate_books;
	}
	public void setCate_books(Set<Book> cate_books) {
		this.cate_books = cate_books;
	}
	public Long getCategory_id() {
		return category_id;
	}
	public void setCategory_id(Long category_id) {
		this.category_id = category_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
}
