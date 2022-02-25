package com.project.doran.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.doran.search.vo.PagingVO;
import com.project.doran.search.vo.CriteriaVO;
import com.project.doran.user.vo.UserVO;

@Mapper
@Repository("userDAO")
public interface UserDAO{
	
	// 회원정보
	public void userUpdate(UserVO userVO) throws DataAccessException; // 회원정보 수정
	
	// 태그 리스트
	public List<UserVO> selectTagList() throws DataAccessException;
	
	// 검색
	public List<UserVO> getSearchList(CriteriaVO searchVO) throws DataAccessException; 
	
	// 전체 게시글 수
	public int getSearchListCnt(CriteriaVO searchVO) throws DataAccessException; 
	
	// paging(페이지)
	public List<UserVO> getSearchList(PagingVO pagingVO) throws DataAccessException;

}
