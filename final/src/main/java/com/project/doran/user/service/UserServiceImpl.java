package com.project.doran.user.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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

	// 회원정보 보기
	@Override
	public UserVO userInfo(String uid) throws Exception {
		return userDAO.userInfo(uid);
	}

	// 회원정보 수정
	public void userUpdate(UserVO userVO) throws Exception {
		userDAO.userUpdate(userVO);
	}
	
	/* 로그인 */
	@Override
	public UserVO userLogin(UserVO userVO) throws Exception {
		return userDAO.userLogin(userVO);
	}
	
	/* 회원가입 */
	@Override
	public void userJoin(UserVO userVO, MultipartFile file) throws Exception {
		String userImagePath = System.getProperty("user.dir")
				+ "\\src\\main\\resources\\static\\images\\user_image_file";

		if (!file.isEmpty()) {
			UUID uuid = UUID.randomUUID();

			String fileName = uuid + "_" + file.getOriginalFilename();

			File saveFile = new File(userImagePath, fileName);

			file.transferTo(saveFile);
			
			System.out.println("/images/user_image_file/" + fileName);

			userVO.setProfileImg("/images/user_image_file/" + fileName);
		}
		
		userDAO.userJoin(userVO);
	}
	
	/* 아이디 중복 검사 */
	@Override
	public int idCheck(String uid) throws Exception {
		return userDAO.idCheck(uid);
	}

	/* 닉네임 중복 검사 */
	@Override
	public int nickCheck(String nickname) throws Exception {
		return userDAO.nickCheck(nickname);
	}

}
