package com.project.doran.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.doran.user.vo.UserVO;

@Mapper
@Repository("userDAO")
public interface UserDAO{
	
	// 회원리스트
	public List<UserVO> userList() throws DataAccessException;
	public UserVO userInfo(String uid) throws DataAccessException;// 회원정보 불러오기
	
	// 회원정보
	public int userUpdate(UserVO userVO) throws DataAccessException; // 회원정보 수정
	
	
}
