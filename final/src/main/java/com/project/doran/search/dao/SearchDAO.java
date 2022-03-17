package com.project.doran.search.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.doran.group.vo.GroupVO;
import com.project.doran.post.vo.PostVO;

@Mapper
@Repository("searchDAO")
public interface SearchDAO{

	/* 검색 그룹 목록 */
	public List<GroupVO> searchGroupList(GroupVO groupVO) throws Exception;
	
	/* 검색 게시물 목록 */
	public List<PostVO> searchPostList(PostVO postVO) throws Exception;


}