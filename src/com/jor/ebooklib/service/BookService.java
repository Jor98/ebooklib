package com.jor.ebooklib.service;

import org.hibernate.criterion.DetachedCriteria;

import com.jor.ebooklib.domain.Book;
import com.jor.ebooklib.domain.PageBean;

public interface BookService {

	void save(Book book);

	PageBean<Book> findByPage(DetachedCriteria detachedCriteria, Integer currPage, Integer pageSize);

	Book findById(Long book_id);

	void delete(Book book);

	void update(Book book);

}
