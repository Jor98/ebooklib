package com.jor.ebooklib.domain;

import java.util.Date;

/**
 * 借书实体
 * @author Administrator
 * CREATE TABLE `borrow` (
  `borrow_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '借阅主键',
  `borrow_user_id` bigint(32) NOT NULL COMMENT '借书读者',
  `borrow_books_id` varchar(16) NOT NULL COMMENT '所借图书',
  `date_to_return` date DEFAULT NULL COMMENT '应还日期',
  `date_return` date DEFAULT NULL COMMENT '归还日期',
  `is_return` varchar(1) NOT NULL COMMENT '是否归还 0-否 1-是',
  `is_overtime` varchar(1) DEFAULT NULL COMMENT '是否超时 0-否 1-是',
  PRIMARY KEY (`borrow_id`),
  KEY `user_id` (`user_id`),
  KEY `books_id` (`books_id`),
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`books_id`) REFERENCES `books` (`books_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */
public class Borrow {
	private Long borrow_id;
	private Date borrow_date;
	private Date date_to_return;
	private Date date_return;
	private String is_return;
	private String is_overtime;
	
	private Books books = new Books();
	private User user = new User();
	public Long getBorrow_id() {
		return borrow_id;
	}
	public void setBorrow_id(Long borrow_id) {
		this.borrow_id = borrow_id;
	}
	public Date getBorrow_date() {
		return borrow_date;
	}
	public void setBorrow_date(Date borrow_date) {
		this.borrow_date = borrow_date;
	}
	public Date getDate_to_return() {
		return date_to_return;
	}
	public void setDate_to_return(Date date_to_return) {
		this.date_to_return = date_to_return;
	}
	public Date getDate_return() {
		return date_return;
	}
	public void setDate_return(Date date_return) {
		this.date_return = date_return;
	}
	public String getIs_return() {
		return is_return;
	}
	public void setIs_return(String is_return) {
		this.is_return = is_return;
	}
	public String getIs_overtime() {
		return is_overtime;
	}
	public void setIs_overtime(String is_overtime) {
		this.is_overtime = is_overtime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Books getBooks() {
		return books;
	}
	public void setBooks(Books books) {
		this.books = books;
	}
	
	
}
