package com.jor.ebooklib.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.jor.ebooklib.dao.BorrowDao;
import com.jor.ebooklib.domain.Borrow;
import com.jor.ebooklib.domain.PageBean;
import com.jor.ebooklib.domain.User;
import com.jor.ebooklib.service.BorrowService;

@Transactional
public class BorrowServiceImpl implements BorrowService{
	private BorrowDao borrowDao;

	public void setBorrowDao(BorrowDao borrowDao) {
		this.borrowDao = borrowDao;
	}

	@Override
	public Borrow findById(Long borrow_id) {
		// TODO Auto-generated method stub
		return borrowDao.findById(borrow_id);
	}

	@Override
	public void update(Borrow borrow) {
		// TODO Auto-generated method stub
		borrowDao.update(borrow);
	}

	@Override
	public void save(Borrow borrow) {
		// TODO Auto-generated method stub
		borrowDao.save(borrow);
	}

	@Override
	public PageBean<Borrow> findByPage(DetachedCriteria detachedCriteria, Integer currPage, Integer pageSize) {
		// TODO Auto-generated method stub
		PageBean<Borrow> pageBean = new PageBean<Borrow>();
		// 封装当前页数:
		pageBean.setCurrPage(currPage);
		// 封装每页显示记录数:
		pageBean.setPageSize(pageSize);
		// 封装总记录数:
		// 调用DAO:
		Integer totalCount  = borrowDao.findCount(detachedCriteria);
		pageBean.setTotalCount(totalCount);
		// 封装总页数:
		Double tc = totalCount.doubleValue();
		Double num = Math.ceil(tc/pageSize);
		pageBean.setTotalPage(num.intValue());
		// 封装每页显示数据的集合
		Integer begin = (currPage - 1) * pageSize;
		List<Borrow> list = borrowDao.findByPage(detachedCriteria,begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}
	
}
