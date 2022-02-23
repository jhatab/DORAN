package com.project.doran.tag.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.doran.tag.vo.TagVO;

@Mapper
@Repository("tagDAO")
public interface TagDAO{
	
	// 태그
	public void tagInsert(TagVO tagVO) throws DataAccessException; // 태그 추가
	public void tagDelete(TagVO tagVO) throws DataAccessException; // 태그 삭제
	
}
