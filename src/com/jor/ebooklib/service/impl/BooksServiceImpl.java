package com.jor.ebooklib.service.impl;

import org.springframework.transaction.annotation.Transactional;

import com.jor.ebooklib.dao.BooksDao;
import com.jor.ebooklib.domain.Books;
import com.jor.ebooklib.service.BooksService;

@Transactional
public class BooksServiceImpl implements BooksService {
	private BooksDao booksDao;

	public void setBooksDao(BooksDao booksDao) {
		this.booksDao = booksDao;
	}

	@Override
	public void save(Books books) {
		booksDao.save(books);
	}

	@Override
	public Books findById(String books_id) {
		// TODO Auto-generated method stub
		return booksDao.findById(books_id);
	}

	@Override
	public void update(Books books) {
		// TODO Auto-generated method stub
		booksDao.update(books);
	}
}
