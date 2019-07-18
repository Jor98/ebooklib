package com.jor.ebooklib.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.jor.ebooklib.dao.AdminDao;
import com.jor.ebooklib.domain.Admin;

public class AdminDaoImpl extends BaseDaoImpl<Admin> implements AdminDao{

	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
//		System.out.println(admin.toString());
		List<Admin> list = (List<Admin>) this.getHibernateTemplate().find(
				"from Admin where admin_account=? and admin_password = ?", admin.getAdmin_account(), admin.getAdmin_password());
		// 判断一下:
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

}
