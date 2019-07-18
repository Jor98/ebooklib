package com.jor.ebooklib.dao.impl;

import java.util.List;

import com.jor.ebooklib.dao.UserDao;
import com.jor.ebooklib.domain.Admin;
import com.jor.ebooklib.domain.User;

public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

	public User login(User user) {
		// TODO Auto-generated method stub
		List<User> list = (List<User>) this.getHibernateTemplate().find(
				"from User where user_account=? and user_password = ?", user.getUser_account(), user.getUser_password());
		// 判断一下:
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public List findUserBorrow(Long user_id) {
		// TODO Auto-generated method stub
		List list = this.getHibernateTemplate().find("from Borrow as A,Book as B,Books as C where A.user.user_id = " + user_id);
		return list;
	}

}
