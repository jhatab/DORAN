package com.project.doran.search.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.doran.group.vo.GroupVO;
import com.project.doran.post.vo.PostVO;
import com.project.doran.search.dao.SearchDAO;

@Service("searchService")
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchDAO searchDAO;

	/* 검색 그룹 목록 */
	@Override
	public List<GroupVO> searchGroupList(GroupVO groupVO) throws Exception {
		return searchDAO.searchGroupList(groupVO);
	}
	
	/* 검색 게시물 목록 */
	@Override
	public List<PostVO> searchPostList(PostVO postVO) throws Exception {
		return searchDAO.searchPostList(postVO);
	}
	
	/* 검색 태그 목록 */
	@Override
	public List<PostVO> searchTagList(PostVO postVO) throws Exception {
		return searchDAO.searchTagList(postVO);
	}
	
	/* 태그 목록 */
	@Override
	public List<PostVO> tagList(PostVO postVO) throws Exception {
		return searchDAO.tagList(postVO);
	}
	
}