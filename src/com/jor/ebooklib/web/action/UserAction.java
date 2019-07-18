package com.jor.ebooklib.web.action;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;

import com.jor.ebooklib.domain.PageBean;
import com.google.gson.Gson;
import com.jor.ebooklib.domain.Admin;
import com.jor.ebooklib.domain.Books;
import com.jor.ebooklib.domain.Borrow;
import com.jor.ebooklib.domain.User;
import com.jor.ebooklib.service.BooksService;
import com.jor.ebooklib.service.BorrowService;
import com.jor.ebooklib.service.UserService;
import com.jor.ebooklib.utils.UploadUtils;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

public class UserAction extends ActionSupport implements ModelDriven<User>{
	
	private User user = new User();
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	
	private BooksService booksService;
	public void setBooksService(BooksService booksService) {
		this.booksService = booksService;
	}
	
	private BorrowService borrowService;
	public void setBorrowService(BorrowService borrowService) {
		this.borrowService = borrowService;
	}

	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
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
	
	private String books_id;
	public void setBooks_id(String books_id) {
		this.books_id = books_id;
	}
	
	private int days;
	public void setDays(int days) {
		this.days = days;
	}
	
	private String password;
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * 用户登陆，在前台调用
	 * @return
	 */
	public String login() {
		User exisUser = userService.login(user);
		if(exisUser == null) {
			ActionContext.getContext().put(ERROR, "账号或密码错误");
			return LOGIN;
		}else {
			if(exisUser.getUser_state().equals("0")) {
				ActionContext.getContext().put(ERROR, "账号或密码错误");
				return LOGIN;
			}else {
				ActionContext.getContext().getSession().put("exisUser", exisUser);
				return "loginSuccess";
			}
		}
	}
	
	/**
	 * 用户退出，在前台调用
	 * @return
	 */
	public String logout() {
		ActionContext.getContext().getSession().remove("exisUser");
		return "logout";
	}
	
	/**
	 * 用户注册，在后台调用
	 * @return
	 * @throws IOException
	 */
	public String regist() throws IOException {
		if (upload != null) {
			// 文件上传：
			// 设置文件上传路径:
			String path = "C:/Users/Administrator/eclipse-J2EE-workspace/ebooklib/WebContent/images";
			// 一个目录下存放的相同文件名：随机文件名
			String uuidFileName = UploadUtils.getUuidFileName(uploadFileName);
			// 一个目录下存放的文件过多：目录分离
			String realPath = UploadUtils.getPath(uuidFileName);
			// 创建目录:
			String url = path + realPath;
			File file = new File(url);
			if (!file.exists()) {
				file.mkdirs();
			}
			// 文件上传:
			File dictFile = new File(url + "/" + uuidFileName);
			FileUtils.copyFile(upload, dictFile);
			
			// 设置image的属性的值:
			user.setUser_image(realPath + "/" + uuidFileName);
		}else {
			user.setUser_image(null);
		}
		if("".equals(user.getUser_email())) user.setUser_email(null);
		user.setUser_borrowcount(Long.parseLong("0"));
		user.setUser_birthday(new Date());
		user.setUser_state("1");
		userService.save(user);
		return "registSuccess";
	}
	
	/**
	 * 用户注册，在前台调用
	 * @return
	 */
	public String registUser() {
		user.setUser_gender("0");
		user.setUser_borrowcount(Long.parseLong("0"));
		user.setUser_birthday(new Date());
		user.setUser_state("1");
		userService.save(user);
		return "registUserSuccess";
	}
	
	/**
	 * 停用用户，在后台调用
	 * @return
	 */
	public String delete() {
		user = userService.findById(user.getUser_id());
//		if(user.getUser_image() != null) {
//			String path = "C:/Users/Administrator/eclipse-J2EE-workspace/ebooklib/WebContent/images";
//			System.out.println(path  + user.getUser_image());
//			File file = new File(path  + user.getUser_image());
//			if (file.exists()) {
//				file.delete();
//			}
//		}
		user.setUser_state("0");
		userService.update(user);
		return "deleteSuccess";
	}
	
	public String restart() {
		user = userService.findById(user.getUser_id());
		user.setUser_state("1");
		userService.update(user);
		return "restartSuccess";
	}
	
	/**
	 * 分页查找所有用户信息，在后台调用
	 * @return
	 */
	public String findAll() {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(User.class);
		PageBean<User> pageBean = userService.findByPage(detachedCriteria, currPage, pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "findAll";
	}
	
	/**
	 * 编辑用户回显数据（未使用）
	 * @return
	 */
	public String edit() {
		user = userService.findById(user.getUser_id());
		return "editSuccess";
	}
	
	/**
	 * 更新用户，在后台调用
	 * @return
	 * @throws IOException
	 */
	public String update() throws IOException {
		User tempuser = userService.findById(user.getUser_id());
		
		if (upload != null) { 
			String path = "C:/Users/Administrator/eclipse-J2EE-workspace/ebooklib/WebContent/images";
			if(!"null".equals(tempuser.getUser_image())) {
				String user_image = tempuser.getUser_image();
				File file = new File(path + user_image);
				file.delete();
			}
			
			String uuidFileName = UploadUtils.getUuidFileName(uploadFileName);
			String realPath = UploadUtils.getPath(uuidFileName);
			String url = path + realPath;
			File file = new File(url);
			if (!file.exists()) {
				file.mkdirs();
			}
			// 文件上传:
			File dictFile = new File(url + "/" + uuidFileName);
			FileUtils.copyFile(upload, dictFile);
			// 设置image的属性的值:
			tempuser.setUser_image(realPath + "/" + uuidFileName);
		}
		
		if(user.getUser_email().equals("")) tempuser.setUser_email(null);
		
		tempuser.setUser_number(user.getUser_number());
		tempuser.setUser_account(user.getUser_account());
		tempuser.setUser_name(user.getUser_name());
		tempuser.setUser_password(user.getUser_password());
		tempuser.setUser_email(user.getUser_email());
		userService.update(tempuser);
		return "updateSuccess";
	}
	
	/**
	 * 更新用户信息，在前台调用
	 * @return
	 */
	public String editUser() {
		User tempuser = userService.findById(user.getUser_id());
		tempuser.setUser_account(user.getUser_account());
		tempuser.setUser_gender(user.getUser_gender());
		tempuser.setUser_name(user.getUser_name());
		tempuser.setUser_email(user.getUser_email());
		tempuser.setUser_birthday(user.getUser_birthday());
		userService.update(tempuser);
		ActionContext.getContext().getSession().put("exisUser", tempuser);
		return "editUserSuccess";
	}
	
	/**
	 * 查找用户信息，异步进行不刷新页面，后台调用
	 * @return
	 * @throws IOException
	 */
	public String findUser() throws IOException {
		user = userService.findById(user.getUser_id());
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.setExcludes(new String[]{"user","borrow_b","cate_books","bookss","book_cates"});
		JSONArray jsonArray = JSONArray.fromObject(user,jsonConfig);
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println(jsonArray.toString());
//		ActionContext.getContext().getValueStack().push(user);
//		ActionContext.getContext().put("borrows", user.getBorrows());
		System.out.println(jsonArray.toString());
		return NONE;
	}
	
	/**
	 * 查找用户所借图书（未使用）
	 * @return
	 * @throws IOException
	 */
	public String findUserBorrow() throws IOException {
		List list = userService.findUserBorrow(user.getUser_id());
		JsonConfig jsonConfig = new JsonConfig();
//		jsonConfig.setExcludes(new String[]{});
		JSONArray jsonArray = JSONArray.fromObject(list,jsonConfig);
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println(jsonArray.toString());
		System.out.println(jsonArray.toString());
		return NONE;
	}
	
	/**
	 * 查找所有用户信息(过滤级联)，后台调用
	 * @return
	 * @throws IOException
	 */
	public String findAllUser() throws IOException {
		List<User> allUserList = userService.findAll() ;
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.setExcludes(new String[]{"borrows"});
		JSONArray jsonArray = JSONArray.fromObject(allUserList,jsonConfig);
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println(jsonArray.toString());
		System.out.println(jsonArray.toString());
		return NONE;
	}
	
	/**
	 * 用户借书，在后台调用
	 * @return
	 */
	public String borrowBooks() {
		Books books = booksService.findById(books_id);
		books.setIs_borrow("1");
		
		Long book_residue = books.getBook().getBook_residue();
		books.getBook().setBook_residue(--book_residue);
		booksService.update(books);
		
		user = userService.findById(user.getUser_id());
		Long borrowcount = user.getUser_borrowcount();
		user.setUser_borrowcount(++borrowcount);
		userService.update(user);
		
		Borrow borrow = new Borrow();
		borrow.setBooks(books);
		borrow.setUser(user);
		
		Date borrow_date = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(borrow_date);
		calendar.add(Calendar.DATE , days);
		Date date_to_return = calendar.getTime();
		
		borrow.setBorrow_date(borrow_date);
		borrow.setDate_to_return(date_to_return);
		
		borrow.setIs_return("0");
		borrow.setIs_overtime("0");
		borrowService.save(borrow);
		
		return "borrowBooksSuccess";
	}
	
	/**
	 * 用户借书，在前台调用
	 * @return
	 */
	public String userBorrowBooks() {
		Books books = booksService.findById(books_id);
		books.setIs_borrow("1");
		
		Long book_residue = books.getBook().getBook_residue();
		books.getBook().setBook_residue(--book_residue);
		booksService.update(books);
		
		user = userService.findById(user.getUser_id());
		Long borrowcount = user.getUser_borrowcount();
		user.setUser_borrowcount(++borrowcount);
		userService.update(user);
		
		Borrow borrow = new Borrow();
		borrow.setBooks(books);
		borrow.setUser(user);
		
		Date borrow_date = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(borrow_date);
		setDays(90);
		calendar.add(Calendar.DATE , days);
		Date date_to_return = calendar.getTime();
		
		borrow.setBorrow_date(borrow_date);
		borrow.setDate_to_return(date_to_return);
		
		borrow.setIs_return("0");
		borrow.setIs_overtime("0");
		borrowService.save(borrow);
		
		ActionContext.getContext().getSession().put("exisUser", user);
		return "userBorrowBooksSuccess";
	}
	
	/**
	 * 修改用户密码，在前台调用
	 * @return
	 */
	public String changePassword() {
		User tempuser = userService.findById(user.getUser_id());
		System.out.println(user.getUser_password());
		System.out.println(tempuser.getUser_password());
		System.out.println(password);
		if(!tempuser.getUser_password().equals(user.getUser_password())) {
			ActionContext.getContext().put(ERROR, "旧密码错误！");
			return "changePassword";
		}else {
			tempuser.setUser_password(password);
			userService.update(tempuser);
			return "changePasswordSuccess";
		}
		
	}
}
