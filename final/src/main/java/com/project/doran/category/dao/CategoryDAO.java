package com.project.doran.category.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.doran.category.vo.CategoryVO;

@Mapper
@Repository("categoryDAO")
public interface CategoryDAO {
	
	/* 카테고리 목록 */
	public List<CategoryVO> categoryList() throws Exception;
	
	/* 카테고리 추가 */
	public void categoryInsert(CategoryVO categoryVO) throws Exception;
	
	/* 카테고리 삭제 */
	public void categoryRemove(int categoryId) throws Exception; 

}
