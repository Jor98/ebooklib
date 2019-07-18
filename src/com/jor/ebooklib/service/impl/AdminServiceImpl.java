package com.jor.ebooklib.service.impl;

import org.springframework.transaction.annotation.Transactional;

import com.jor.ebooklib.dao.AdminDao;
import com.jor.ebooklib.domain.Admin;
import com.jor.ebooklib.service.AdminService;

@Transactional
public class AdminServiceImpl implements AdminService{

	//注入DAO
	private AdminDao adminDao;
	
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.login(admin);
		
	}

}
