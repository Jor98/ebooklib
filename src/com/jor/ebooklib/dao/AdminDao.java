package com.jor.ebooklib.dao;

import com.jor.ebooklib.domain.Admin;

/**
 * //管理员的Dao接口
 * @author Administrator
 *
 */
public interface AdminDao extends BaseDao<Admin>{

	Admin login(Admin admin);

}
