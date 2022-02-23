package com.project.doran.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.project.doran.search.vo.PagingVO;
import com.project.doran.search.vo.SearchVO;
import com.project.doran.user.dao.UserDAO;
import com.project.doran.user.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;

	// User(회원정보)
	@Override
	public void userUpdate(UserVO userVO) throws Exception {
		userDAO.userUpdate(userVO);
	}
	
	@Override
	public List<UserVO> selectTagList() throws Exception {
		return userDAO.selectTagList();
	}
	
	// SearchList
	@Override
	public List<UserVO> getSearchList(SearchVO searchVO) throws Exception {
		return userDAO.getSearchList(searchVO);
	}
	
	// SearchListCnt
	@Override
	public int getSearchListCnt(SearchVO searchVO) throws Exception {
		return userDAO.getSearchListCnt(searchVO);
	}
	
	// Paging
	@Override
	public List<UserVO> getSearchList(PagingVO pagingVO) throws Exception {
		return userDAO.getSearchList(pagingVO);
	}


}
