package com.project.doran.user.service;

import java.util.List;

import com.project.doran.search.vo.PagingVO;
import com.project.doran.search.vo.CriteriaVO;
import com.project.doran.user.vo.UserVO;

public interface UserService {

	// 회원정보
	public void userUpdate(UserVO userVO) throws Exception; // 회원정보 수정

	// 태그 리스트
	public List<UserVO> selectTagList() throws Exception;

	// 검색
	public List<UserVO> getSearchList(CriteriaVO searchVO) throws Exception;

	// 전체 게시글 수
	public int getSearchListCnt(CriteriaVO searchVO) throws Exception;

	// paging(페이지)
	public List<UserVO> getSearchList(PagingVO pagingVO) throws Exception;
}
