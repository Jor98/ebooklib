package com.jor.ebooklib.web.action;

import com.jor.ebooklib.domain.Books;
import com.jor.ebooklib.service.BookService;
import com.jor.ebooklib.service.BooksService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class BooksAction extends ActionSupport implements ModelDriven<Books>{
	private Books books = new Books();
	
	public Books getModel() {
		// TODO Auto-generated method stub
		return books;
	}
	
	private BooksService booksService;
	public void setBooksService(BooksService booksService) {
		this.booksService = booksService;
	}

	public void test() {
		Books tempbooks = booksService.findById(books.getBooks_id());
	}
}
