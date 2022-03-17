package com.project.doran.search.service;

import java.util.List;

import com.project.doran.group.vo.GroupVO;
import com.project.doran.post.vo.PostVO;

public interface SearchService {
	
	/* 검색 그룹 목록 */
	public List<GroupVO> searchGroupList(GroupVO groupVO) throws Exception;
	
	/* 검색 게시물 목록 */
	public List<PostVO> searchPostList(PostVO postVO) throws Exception;
	
}