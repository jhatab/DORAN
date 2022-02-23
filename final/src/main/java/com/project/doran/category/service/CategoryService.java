package com.project.doran.category.service;

import com.project.doran.category.vo.CategoryVO;

public interface CategoryService {
	
	public void categoryInsert(CategoryVO categoryVO) throws Exception; // 카테고리 추가
	public void categoryDelete(CategoryVO categoryVO) throws Exception; // 카테고리 삭제

}
