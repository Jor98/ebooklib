package com.jor.ebooklib.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * 管路员实体
 * @author Administrator
 * CREATE TABLE `admin` (
  `admin_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '管理员主键',
  `admin_account` varchar(32) NOT NULL COMMENT '管理员账号',
  `admin_password` varchar(32) NOT NULL COMMENT '账号密码',
  `admin_name` varchar(16) NOT NULL COMMENT '管理员主键',
  `admin_phone` varchar(16) DEFAULT NULL COMMENT '管理员手机号',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
 */
public class Admin {
	private Long admin_id;
	private String admin_account;
	private String admin_password;
	private String admin_name;
	private String admin_phone;
	private String admin_image;

	public Long getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(Long admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_account() {
		return admin_account;
	}

	public void setAdmin_account(String admin_account) {
		this.admin_account = admin_account;
	}

	public String getAdmin_password() {
		return admin_password;
	}

	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public String getAdmin_phone() {
		return admin_phone;
	}

	public void setAdmin_phone(String admin_phone) {
		this.admin_phone = admin_phone;
	}

	public String getAdmin_image() {
		return admin_image;
	}

	public void setAdmin_image(String admin_image) {
		this.admin_image = admin_image;
	}

	@Override
	public String toString() {
		return "Admin [admin_id=" + admin_id + ", admin_account=" + admin_account + ", admin_password=" + admin_password
				+ ", admin_name=" + admin_name + ", admin_phone=" + admin_phone + "]";
	}
	
	
}
