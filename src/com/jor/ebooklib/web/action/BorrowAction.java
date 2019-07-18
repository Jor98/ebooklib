package com.jor.ebooklib.web.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.criterion.DetachedCriteria;

import com.jor.ebooklib.domain.Books;
import com.jor.ebooklib.domain.Borrow;
import com.jor.ebooklib.domain.PageBean;
import com.jor.ebooklib.domain.User;
import com.jor.ebooklib.service.BooksService;
import com.jor.ebooklib.service.BorrowService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class BorrowAction extends ActionSupport implements ModelDriven<Borrow> {

	private Borrow borrow = new Borrow();
	public Borrow getModel() {
		// TODO Auto-generated method stub
		return borrow;
	}
	
	private BorrowService borrowService;
	public void setBorrowService(BorrowService borrowService) {
		this.borrowService = borrowService;
	}
	
	private BooksService booksService;
	public void setBooksService(BooksService booksService) {
		this.booksService = booksService;
	}
	
	// 使用set方法的方式接收数据:
	private Integer currPage = 1;
	public void setCurrPage(Integer currPage) {
		if (currPage == null) {
			currPage = 1;
		}
		this.currPage = currPage;
	}
	
	// 使用set方法接受每页显示记录数
	private Integer pageSize = 5;
	public void setPageSize(Integer pageSize) {
		if (pageSize == null) {
			pageSize = 5;
		}
		this.pageSize = pageSize;
	}
	
	/**
	 * 文件上传提供的三个属性:
	 */
	private String uploadFileName; // 文件名称
	private File upload; // 上传文件
	private String uploadContentType; // 文件类型

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	/**
	 * 归还书籍，在后台调用
	 * @return
	 */
	public String returnbook() {
		borrow = borrowService.findById(borrow.getBorrow_id());
		borrow.setIs_return("1");
		Date date_return = new Date();
		borrow.setDate_return(date_return);
		
		Date date_to_return = borrow.getDate_to_return();
		if(date_return.after(date_to_return)) {
			borrow.setIs_overtime("1");
		}
		borrow.getBooks().setIs_borrow("0");
		Long residue = borrow.getBooks().getBook().getBook_residue();
		borrow.getBooks().getBook().setBook_residue(++residue);

		Long borrowcount = borrow.getUser().getUser_borrowcount();
		borrow.getUser().setUser_borrowcount(--borrowcount);
		
		borrowService.update(borrow);
		return "returnSuccess";
	}
	
	public String returnbookUser() {
		borrow = borrowService.findById(borrow.getBorrow_id());
		borrow.setIs_return("1");
		Date date_return = new Date();
		borrow.setDate_return(date_return);
		
		Date date_to_return = borrow.getDate_to_return();
		if(date_return.after(date_to_return)) {
			borrow.setIs_overtime("1");
		}
		borrow.getBooks().setIs_borrow("0");
		Long residue = borrow.getBooks().getBook().getBook_residue();
		borrow.getBooks().getBook().setBook_residue(++residue);

		Long borrowcount = borrow.getUser().getUser_borrowcount();
		borrow.getUser().setUser_borrowcount(--borrowcount);
		
		borrowService.update(borrow);
		ActionContext.getContext().getSession().put("exisUser", borrow.getUser());
		return "returnbookUser";
	}
	
	/**
	 * 分页查找所有借书记录（未使用）
	 * @return
	 */
	public String findAll() {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Borrow.class);
		PageBean<Borrow> pageBean = borrowService.findByPage(detachedCriteria, currPage, pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "findAll";
	}

}
