package com.project.doran.tag.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.doran.search.vo.SearchCriteriaVO;
import com.project.doran.tag.dao.TagDAO;
import com.project.doran.tag.vo.TagVO;

@Service("tagService")
public class TagServiceImpl implements TagService {

	@Autowired
	private TagDAO tagDAO;

	@Autowired
	private TagVO tagVO;

	@Override
	public void tagInsert(TagVO tagVO) throws Exception {
		tagDAO.tagInsert(tagVO);

	}

	@Override
	public void tagDelete(TagVO tagVO) throws Exception {
		tagDAO.tagDelete(tagVO);

	}

	// 태그 총 갯수
	@Override
	public int tagListCount(SearchCriteriaVO scri) throws Exception {
		return tagDAO.tagListCount(scri);
	}

	// 태그 목록
	@Override
	public List<TagVO> tagList(SearchCriteriaVO scri) throws Exception {
		return tagDAO.tagList(scri);
	}

}
