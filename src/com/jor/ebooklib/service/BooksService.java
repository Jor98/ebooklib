package com.jor.ebooklib.service;

import com.jor.ebooklib.domain.Books;

public interface BooksService {

	void save(Books books);

	Books findById(String books_id);

	void update(Books books);

}
