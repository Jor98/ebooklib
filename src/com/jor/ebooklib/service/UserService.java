package com.jor.ebooklib.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.jor.ebooklib.domain.PageBean;
import com.jor.ebooklib.domain.User;

public interface UserService {

	User login(User user);

	void save(User user);

	PageBean<User> findByPage(DetachedCriteria detachedCriteria, Integer currPage, Integer pageSize);

	User findById(Long user_id);

	void delete(User user);

	void update(User user);

	List findUserBorrow(Long user_id);

	List<User> findAll();

}
