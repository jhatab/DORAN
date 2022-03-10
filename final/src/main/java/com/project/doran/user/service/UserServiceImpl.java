package com.project.doran.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.doran.search.vo.CriteriaVO;
import com.project.doran.search.vo.PagingVO;
import com.project.doran.user.dao.UserDAO;
import com.project.doran.user.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	// 검색
	public List<UserVO> getSearchList(CriteriaVO searchVO) throws Exception {
		return userDAO.getSearchList(searchVO);
	}

	// 전체 게시글 수
	public int getSearchListCnt(CriteriaVO searchVO) throws Exception {
		return userDAO.getSearchListCnt(searchVO);
	}

	// paging(페이지)
	public List<UserVO> getSearchList(PagingVO pagingVO) throws Exception {
		return userDAO.getSearchList(pagingVO);
	}

	// 로그인
	public UserVO userLogin(UserVO userVO) throws Exception {
		return userDAO.userLogin(userVO);
	}

	// 회원정보 보기
	@Override
	public UserVO userInfo(String uid) throws Exception {
		return userDAO.userInfo(uid);
	}

	// 회원정보 수정
	public void userUpdate(UserVO userVO) throws Exception {
		userDAO.userUpdate(userVO);
	}

}
