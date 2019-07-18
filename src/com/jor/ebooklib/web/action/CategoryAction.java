package com.jor.ebooklib.web.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;

import com.jor.ebooklib.domain.Book;
import com.jor.ebooklib.domain.Category;
import com.jor.ebooklib.domain.PageBean;
import com.jor.ebooklib.service.CategoryService;
import com.jor.ebooklib.utils.UploadUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

public class CategoryAction extends ActionSupport implements ModelDriven<Category>{
	private Category category = new Category();

	public Category getModel() {
		// TODO Auto-generated method stub
		return category;
	}
	
	private CategoryService categoryService;
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
	private Integer currPage = 1;
	public void setCurrPage(Integer currPage) {
		if (currPage == null) {
			currPage = 1;
		}
		this.currPage = currPage;
	}
	
	private Integer pageSize = 3;
	public void setPageSize(Integer pageSize) {
		if (pageSize == null) {
			pageSize = 3;
		}
		this.pageSize = pageSize;
	}
	
	/**
	 * 添加类型
	 * @return
	 * @throws IOException
	 */
	public String add() throws IOException{
		categoryService.save(category);
		return "addSuccess";
	}
	
	public String findAll() {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Category.class);
		PageBean<Category> pageBean = categoryService.findByPage(detachedCriteria, currPage, pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "findAll";
	}
	
	/**
	 * 删除类型
	 * @return
	 */
	public String delete() {
		category = categoryService.findById(category.getCategory_id());
		categoryService.delete(category);
		return "deleteSuccess";
	}
	
	/**
	 * 分页查找所有类型（未使用）
	 * @return
	 * @throws IOException
	 */
	public String findAllCategory() throws IOException {
		List<Category> allCategoryList = categoryService.findAll();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.setExcludes(new String[]{"cate_books"});
		JSONArray jsonArray = JSONArray.fromObject(allCategoryList,jsonConfig);
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println(jsonArray.toString());
		System.out.println(jsonArray.toString());
		return NONE;
	}
}
