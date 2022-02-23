package com.project.doran.category.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.doran.category.dao.CategoryDAO;
import com.project.doran.category.vo.CategoryVO;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired 
	private CategoryDAO categoryDAO;

	@Override
	public void categoryInsert(CategoryVO categoryVO) throws Exception {
		categoryDAO.categoryInsert(categoryVO);
		
	}

	@Override
	public void categoryDelete(CategoryVO categoryVO) throws Exception {
		categoryDAO.categoryDelete(categoryVO);
	}



	

}
