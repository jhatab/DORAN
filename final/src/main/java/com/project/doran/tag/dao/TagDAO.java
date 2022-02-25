package com.project.doran.tag.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.doran.search.vo.SearchCriteriaVO;
import com.project.doran.tag.vo.TagVO;

@Mapper
@Repository("tagDAO")
public interface TagDAO {

	// 태그 추가
	public void tagInsert(TagVO tagVO) throws DataAccessException;

	// 태그 삭제
	public void tagDelete(TagVO tagVO) throws DataAccessException;

	// 태그 총 갯수
//	public int tagListCount() throws DataAccessException;
	public int tagListCount(SearchCriteriaVO scri) throws DataAccessException;

	// 태그 목록
//	public List<TagVO> tagList(CriteriaVO cri) throws DataAccessException;
	public List<TagVO> tagList(SearchCriteriaVO scri) throws DataAccessException;
	
}
