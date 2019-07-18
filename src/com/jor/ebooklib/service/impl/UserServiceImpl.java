package com.jor.ebooklib.service.impl;

import java.util.List;


import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.jor.ebooklib.dao.UserDao;
import com.jor.ebooklib.domain.PageBean;
import com.jor.ebooklib.domain.User;
import com.jor.ebooklib.service.UserService;

@Transactional
public class UserServiceImpl implements UserService{
	//注入DAO
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public User login(User user) {
		// TODO Auto-generated method stub
		return userDao.login(user);
	}

	public void save(User user) {
		// TODO Auto-generated method stub
		userDao.save(user);
	}

	public PageBean<User> findByPage(DetachedCriteria detachedCriteria, Integer currPage, Integer pageSize) {
		// TODO Auto-generated method stub
		PageBean<User> pageBean = new PageBean<User>();
		// 封装当前页数:
		pageBean.setCurrPage(currPage);
		// 封装每页显示记录数:
		pageBean.setPageSize(pageSize);
		// 封装总记录数:
		// 调用DAO:
		Integer totalCount  = userDao.findCount(detachedCriteria);
		pageBean.setTotalCount(totalCount);
		// 封装总页数:
		Double tc = totalCount.doubleValue();
		Double num = Math.ceil(tc/pageSize);
		pageBean.setTotalPage(num.intValue());
		// 封装每页显示数据的集合
		Integer begin = (currPage - 1) * pageSize;
		List<User> list = userDao.findByPage(detachedCriteria,begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	public User findById(Long user_id) {
		User user = userDao.findById(user_id);
		return user;
	}

	public void delete(User user) {
		// TODO Auto-generated method stub
		userDao.delete(user);
	}

	public void update(User user) {
		// TODO Auto-generated method stub
		userDao.update(user);
	}

	@Override
	public List findUserBorrow(Long user_id) {
		// TODO Auto-generated method stub
		return userDao.findUserBorrow(user_id);
	}

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return userDao.findAll();
	}

}
