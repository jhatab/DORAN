package com.project.doran.user.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.project.doran.user.vo.UserVO;

public interface UserService {

	// 회원리스트
	public List<UserVO> userList() throws Exception;
	public UserVO userInfo(String uid) throws Exception;// 회원정보 불러오기

	// 회원정보
	public int userUpdate(UserVO userVO) throws Exception; // 회원정보 수정
	

}
