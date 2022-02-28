package com.project.doran.category.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.doran.category.vo.CategoryVO;

@Mapper
@Repository("categoryDAO")
public interface CategoryDAO {
	
	public void categoryInsert(CategoryVO categoryVO) throws DataAccessException; // 카테고리 추가
	public void categoryDelete(CategoryVO categoryVO) throws DataAccessException; // 카테고리 삭제
	
	/* 카테고리 목록 */
	public List<CategoryVO> categoryList() throws Exception;

}
