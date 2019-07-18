package com.jor.ebooklib.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.jor.ebooklib.domain.User;

public interface UserDao extends BaseDao<User>{

	User login(User user);

	List findUserBorrow(Long user_id);

}
