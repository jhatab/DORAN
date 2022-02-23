package com.project.doran.tag.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.doran.tag.dao.TagDAO;
import com.project.doran.tag.vo.TagVO;

@Service("tagService")
public class TagServiceImpl implements TagService {
	
	@Autowired
	private TagDAO tagDAO;

	@Override
	public void tagInsert(TagVO tagVO) throws Exception {
		tagDAO.tagInsert(tagVO);
		
	}

	@Override
	public void tagDelete(TagVO tagVO) throws Exception {
		tagDAO.tagDelete(tagVO);
		
	}


}
