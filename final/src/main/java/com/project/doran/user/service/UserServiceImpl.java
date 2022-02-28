package com.project.doran.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.project.doran.search.vo.PagingVO;
import com.project.doran.search.vo.CriteriaVO;
import com.project.doran.user.dao.UserDAO;
import com.project.doran.user.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;

	@Override
	public List<UserVO> userList() throws Exception {
		return userDAO.userList();
	}
	
	// User(회원정보)
	@Override
	public int userUpdate(UserVO userVO) throws Exception {
		return userDAO.userUpdate(userVO);
	}

	@Override
	public UserVO userInfo(String uid) throws Exception {
		return userDAO.userInfo(uid);
	}

	
	

}
