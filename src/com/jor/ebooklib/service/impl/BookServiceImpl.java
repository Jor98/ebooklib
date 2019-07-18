package com.jor.ebooklib.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.jor.ebooklib.dao.BookDao;
import com.jor.ebooklib.domain.Book;
import com.jor.ebooklib.domain.PageBean;
import com.jor.ebooklib.domain.User;
import com.jor.ebooklib.service.BookService;

@Transactional
public class BookServiceImpl implements BookService {
	private BookDao bookDao;

	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}

	public void save(Book book) {
		// TODO Auto-generated method stub
		bookDao.save(book);
	}

	public PageBean<Book> findByPage(DetachedCriteria detachedCriteria, Integer currPage, Integer pageSize) {
		// TODO Auto-generated method stub
		PageBean<Book> pageBean = new PageBean<Book>();
		// 封装当前页数:
		pageBean.setCurrPage(currPage);
		// 封装每页显示记录数:
		pageBean.setPageSize(pageSize);
		// 封装总记录数:
		// 调用DAO:
		Integer totalCount  = bookDao.findCount(detachedCriteria);
		pageBean.setTotalCount(totalCount);
		// 封装总页数:
		Double tc = totalCount.doubleValue();
		Double num = Math.ceil(tc/pageSize);
		pageBean.setTotalPage(num.intValue());
		// 封装每页显示数据的集合
		Integer begin = (currPage - 1) * pageSize;
		List<Book> list = bookDao.findByPage(detachedCriteria,begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	public Book findById(Long book_id) {
		// TODO Auto-generated method stub
		Book book = bookDao.findById(book_id);
		return book;
	}

	public void delete(Book book) {
		// TODO Auto-generated method stub
		bookDao.delete(book);
	}

	public void update(Book book) {
		// TODO Auto-generated method stub
		bookDao.update(book);
	}
	
	
}
