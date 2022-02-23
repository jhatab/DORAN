package com.project.doran.category.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.doran.category.service.CategoryService;
import com.project.doran.category.vo.CategoryVO;

@Controller("categoryController")
@RequestMapping(value = "/category")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String categoryInsertForm(CategoryVO categoryVO) throws Exception {
		return "category/insert";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String categoryInsert(CategoryVO categoryVO) throws Exception {
		categoryService.categoryInsert(categoryVO);
		return "redirect:/categoryMain";
	}
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String categoryDelete(CategoryVO categoryVO) throws Exception {
		categoryService.categoryDelete(categoryVO);
		return "redirect:/categoryMain";
	}
}
