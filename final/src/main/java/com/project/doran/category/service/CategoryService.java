package com.project.doran.category.service;

import java.util.List;

import com.project.doran.category.vo.CategoryVO;

public interface CategoryService {
	
	/* 카테고리 목록 */
	public List<CategoryVO> categoryList() throws Exception;
	
	/* 카테고리 추가 */
	public void categoryInsert(CategoryVO categoryVO) throws Exception;
	
	/* 카테고리 삭제 */
	public void categoryRemove(int categoryId) throws Exception; 

}
