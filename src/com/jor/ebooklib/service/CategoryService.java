package com.jor.ebooklib.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.jor.ebooklib.domain.Category;
import com.jor.ebooklib.domain.PageBean;

public interface CategoryService {

	void save(Category category);

	Category findById(Long category_id);

	void delete(Category category);

	void update(Category category);

	PageBean<Category> findByPage(DetachedCriteria detachedCriteria, Integer currPage, Integer pageSize);

	List<Category> findAll();

}
