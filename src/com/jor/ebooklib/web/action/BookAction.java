package com.jor.ebooklib.web.action;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;

import com.google.gson.JsonArray;
import com.jor.ebooklib.domain.Book;
import com.jor.ebooklib.domain.Books;
import com.jor.ebooklib.domain.Category;
import com.jor.ebooklib.domain.PageBean;
import com.jor.ebooklib.domain.User;
import com.jor.ebooklib.service.BookService;
import com.jor.ebooklib.service.BooksService;
import com.jor.ebooklib.service.CategoryService;
import com.jor.ebooklib.utils.UploadUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

public class BookAction extends ActionSupport implements ModelDriven<Book>{
	private Book book = new Book();
	public Book getModel() {
		// TODO Auto-generated method stub
		return book;
	}
	
	private BookService bookService;
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	
	private BooksService booksService;
	public void setBooksService(BooksService booksService) {
		this.booksService = booksService;
	}
	
	private CategoryService categoryService;
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
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
	
	private Integer currPage = 1;
	public void setCurrPage(Integer currPage) {
		if (currPage == null) {
			currPage = 1;
		}
		this.currPage = currPage;
	}
	
	private Integer pageSize = 5;
	public void setPageSize(Integer pageSize) {
		if (pageSize == null) {
			pageSize = 5;
		}
		this.pageSize = pageSize;
	}
	private String books_id;
	public void setBooks_id(String books_id) {
		this.books_id = books_id;
	}
	
	private Long category_id;
	public void setCategory_id(Long category_id) {
		this.category_id = category_id;
	}
	
	private String search_option;
	public void setSearch_option(String search_option) {
		this.search_option = search_option;
	}

	private String search_keyword;
	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}
	/**
	 * 增加书籍 在后台调用
	 * @return
	 * @throws IOException
	 */
	public String regist() throws IOException{
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
			book.setBook_image(realPath + "/" + uuidFileName);
		}else {
			book.setBook_image(null);
		}
		if("".equals(book.getBook_isbn())) book.setBook_isbn(null);
		if("".equals(book.getBook_publishing())) book.setBook_publishing(null);
		if("".equals(book.getBook_synopsis())) book.setBook_synopsis(null);
		book.setBook_residue(Long.parseLong("0"));
		book.setBook_total(Long.parseLong("0"));
		book.setBook_state("1");
		bookService.save(book);
		return "registSuccess";
	}
	
	public String restart() {
		book = bookService.findById(book.getBook_id());
		book.setBook_state("1");
		bookService.update(book);
		return "restartSuccess";
	}
	
	/**
	 * 分页查找所有书籍 在后台调用
	 * @return
	 */
	public String findAll() {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Book.class);
		PageBean<Book> pageBean = bookService.findByPage(detachedCriteria, currPage, pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "findAll";
	}
	
	/**
	 * 分页查找所有书籍 在前台调用
	 * @return
	 */
	public String findAllBook() {
		
		String alias = "tempbook";
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Book.class,alias);
		detachedCriteria.add(Restrictions.eq("book_state", "1"));
		if(search_keyword != null) {
			switch (search_option) {
			case "bookName":
				detachedCriteria.add(Restrictions.like("book_name", "%"+search_keyword+"%"));
				break;
			case "authorName":
				detachedCriteria.add(Restrictions.like("book_author", "%"+search_keyword+"%"));
				break;
			case "isbnName":
				detachedCriteria.add(Restrictions.like("book_isbn", "%"+search_keyword+"%"));
				break;
			case "publishName":
				detachedCriteria.add(Restrictions.like("book_publishing", "%"+search_keyword+"%"));
				break;
			case "sortName":
				detachedCriteria.add(Restrictions.like("book_sortnumber", "%"+search_keyword+"%"));
				break;
			default:
				break;
			}
		}
		
//		if(category_id != null) {
//			ProjectionList pList = Projections.projectionList();
//			pList.add(Projections.property(alias + "." + "book_id").as("book_id"));
//			pList.add(Projections.property(alias + "." + "book_name").as("book_name"));
//			pList.add(Projections.property(alias + "." + "book_author").as("book_author"));
//			pList.add(Projections.property(alias + "." + "book_isbn").as("book_isbn"));
//			pList.add(Projections.property(alias + "." + "book_publishing").as("book_publishing"));
//			pList.add(Projections.property(alias + "." + "book_synopsis").as("book_synopsis"));
//			pList.add(Projections.property(alias + "." + "book_image").as("book_image"));
//			pList.add(Projections.property(alias + "." + "book_total").as("book_total"));
//			pList.add(Projections.property(alias + "." + "book_residue").as("book_residue"));
//			detachedCriteria.setProjection(pList);
//			detachedCriteria.setResultTransformer(Transformers.aliasToBean(Book.class));
//			detachedCriteria.createCriteria("book_cates","ca").add(Restrictions.eq("ca.category_id", category_id));
//		}
		
		PageBean<Book> pageBean = bookService.findByPage(detachedCriteria, currPage, pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "findAllBook";
	}
	
	/**
	 * 删除书籍 在后台调用
	 * @return
	 */
	public String delete() {
		book = bookService.findById(book.getBook_id());
//		if(book.getBook_image() != null) {
//			File file = new File(book.getBook_image());
//			if (file.exists()) {
//				file.delete();
//			}
//		}
		book.setBook_state("0");
		bookService.update(book);
		return "deleteSuccess";
	}
	
	/**
	 * 修改书籍信息 在后台调用
	 * @return
	 */
	public String edit() {
		book = bookService.findById(book.getBook_id());
		return "editSuccess";
	}
	
	/**
	 * 更新书籍信息 在后台调用
	 * @return
	 * @throws IOException
	 */
	public String update() throws IOException {
		Book tempbook = bookService.findById(book.getBook_id());
		
		if (upload != null) {
			String path = "C:/Users/Administrator/eclipse-J2EE-workspace/ebooklib/WebContent/images";
			if (!"null".equals(tempbook.getBook_image())) {
				String book_image = tempbook.getBook_image();
				File file = new File(path + book_image);
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
			tempbook.setBook_image(realPath + "/" + uuidFileName);
		}
		
		if("".equals(book.getBook_isbn())) tempbook.setBook_isbn(null);
		if("".equals(book.getBook_publishing())) tempbook.setBook_publishing(null);
		if("".equals(book.getBook_synopsis())) tempbook.setBook_synopsis(null);
		
		tempbook.setBook_name(book.getBook_name());
		tempbook.setBook_author(book.getBook_author());
		tempbook.setBook_isbn(book.getBook_isbn());
		tempbook.setBook_publishing(book.getBook_publishing());
		tempbook.setBook_synopsis(book.getBook_synopsis());
		bookService.update(tempbook);
		return "updateSuccess";
	}
	
	/**
	 * 查找书籍信息 前台后台均有调用
	 * @return
	 * @throws IOException
	 */
	public String findBook() throws IOException {
		book = bookService.findById(book.getBook_id());
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false);;
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.setExcludes(new String[]{"cate_books","book","books","borrows"});
		JSONArray jsonArray = JSONArray.fromObject(book,jsonConfig);
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println(jsonArray.toString());
		System.out.println(jsonArray.toString());
		return NONE;
	}
	
	/**
	 * 查找书本详细信息，前台调用
	 * @return
	 */
	public String bookDetails() {
		book = bookService.findById(book.getBook_id());
		ActionContext.getContext().getSession().put("exisBook", book);
		return "bookDetails";
	}
	
	/**
	 * 增加库存 在后台调用
	 * @return
	 */
	public String addBooks() {
		Book tempbook = bookService.findById(book.getBook_id());
		Books books = new Books();
		books.setBooks_id(books_id);
		books.setIs_borrow("0");
		books.setBook(tempbook);
		booksService.save(books);
		
		tempbook.getBookss().add(books);
		Long total = tempbook.getBook_total() + 1;
		tempbook.setBook_total(total);
		Long residue = tempbook.getBook_residue() + 1;
		tempbook.setBook_residue(residue);
		
		bookService.update(tempbook);
		return "addBooksSuccess";
	}
	
	/**
	 * 书本添加类型 在后台调用
	 * @return
	 */
	public String addcategory() {
		Category category = categoryService.findById(category_id);
		book = bookService.findById(book.getBook_id());
		book.getBook_cates().add(category);
		bookService.update(book);
		return "addcategorySuccess";
	}
	
	/**
	 * 书本删除类型 在后台调用
	 * @return
	 */
	public String delcategory() {
		Category category = categoryService.findById(category_id);
		book = bookService.findById(book.getBook_id());
		book.getBook_cates().remove(category);
		bookService.update(book);
		return "delcategorySuccess";
	}
}
