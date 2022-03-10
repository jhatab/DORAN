package com.project.doran.tag.service;

import java.util.List;

import com.project.doran.search.vo.SearchCriteriaVO;
import com.project.doran.tag.vo.TagVO;

public interface TagService {

	// 태그 목록
		public List<TagVO> tagList(SearchCriteriaVO scri) throws Exception;

		// 태그 총 갯수
		public int tagListCount(SearchCriteriaVO scri) throws Exception;

		// 태그 추가
		public void tagInsert(TagVO tagVO) throws Exception;

		// 태그 삭제
		public void tagDelete(TagVO tagVO) throws Exception;


}
