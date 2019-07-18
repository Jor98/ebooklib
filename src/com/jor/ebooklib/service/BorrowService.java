package com.jor.ebooklib.service;

import org.hibernate.criterion.DetachedCriteria;

import com.jor.ebooklib.domain.Borrow;
import com.jor.ebooklib.domain.PageBean;

public interface BorrowService {

	Borrow findById(Long borrow_id);

	void update(Borrow borrow);

	void save(Borrow borrow);

	PageBean<Borrow> findByPage(DetachedCriteria detachedCriteria, Integer currPage, Integer pageSize);

}
