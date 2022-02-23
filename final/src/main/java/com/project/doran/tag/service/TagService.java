package com.project.doran.tag.service;

import java.util.List;

import com.project.doran.tag.vo.TagVO;

public interface TagService {

	// 태그
	public void tagInsert(TagVO tagVO) throws Exception; // 태그 추가
	public void tagDelete(TagVO tagVO) throws Exception; // 태그 삭제
	
}
