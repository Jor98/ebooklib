package com.jor.ebooklib.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 读者实体
 * @author Administrator
 * CREATE TABLE `user` (
  `user_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '读者主键',
  `user_number` varchar(32) NOT NULL COMMENT '读者学号或证件号',
  `user_account` varchar(32) NOT NULL COMMENT '读者账号',
  `user_password` varchar(32) NOT NULL COMMENT '账号密码',
  `user_name` varchar(16) NOT NULL COMMENT '读者姓名',
  `user_phone` varchar(16) DEFAULT NULL COMMENT '读者手机号',
  `user_admin_id` bigint(32) NOT NULL COMMENT '开户管理员',
  PRIMARY KEY (`user_id`),
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
 */
public class User {
	private Long user_id;
	private String user_number;
	private String user_account;
	private String user_password;
	private String user_name;
	private String user_image;
	private Date user_birthday;
	private String user_email;
	private String user_gender;
	private Long user_borrowcount;
	private String user_state;
	
	private Set<Borrow> borrows = new HashSet<Borrow>();

	public Long getUser_id() {
		return user_id;
	}

	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}

	public String getUser_number() {
		return user_number;
	}

	public void setUser_number(String user_number) {
		this.user_number = user_number;
	}

	public String getUser_account() {
		return user_account;
	}

	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Set<Borrow> getBorrows() {
		return borrows;
	}

	public void setBorrows(Set<Borrow> borrows) {
		this.borrows = borrows;
	}

	public String getUser_image() {
		return user_image;
	}

	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}

	public Date getUser_birthday() {
		return user_birthday;
	}

	public void setUser_birthday(Date user_birthday) {
		this.user_birthday = user_birthday;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public Long getUser_borrowcount() {
		return user_borrowcount;
	}

	public void setUser_borrowcount(Long user_borrowcount) {
		this.user_borrowcount = user_borrowcount;
	}

	public String getUser_state() {
		return user_state;
	}

	public void setUser_state(String user_state) {
		this.user_state = user_state;
	}

	
	
}
