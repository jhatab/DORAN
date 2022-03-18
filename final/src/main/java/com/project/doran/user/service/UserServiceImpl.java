package com.project.doran.user.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.doran.group.vo.GroupVO;
import com.project.doran.search.vo.CriteriaVO;
import com.project.doran.search.vo.PagingVO;
import com.project.doran.user.controller.UserController;
import com.project.doran.user.dao.UserDAO;
import com.project.doran.user.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

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

	/* 로그인 */
	@Override
	public UserVO userLogin(UserVO userVO) throws Exception {
		return userDAO.userLogin(userVO);
	}

	/* 회원가입 */
	@Override
	public void userJoin(UserVO userVO, MultipartFile file) throws Exception {
		String userImagePath = "/var/webapps/upload/images/user_image_file";

		if (!file.isEmpty()) {
			UUID uuid = UUID.randomUUID();

			String fileName = uuid + "_" + file.getOriginalFilename();

			File saveFile = new File(userImagePath, fileName);

			file.transferTo(saveFile);

			userVO.setProfileImg("/var/webapps/upload/images/user_image_file/" + fileName);
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

	/* 회원정보 수정 */
	@Override
	public void userUpdate(UserVO userVO, MultipartFile file) throws Exception {
		String userImagePath = "/usr/local/tomcat/apache-tomcat-8.5.76/webapps/upload/images/user_image_file";
		
		if (!file.isEmpty()) {
			UUID uuid = UUID.randomUUID();

			String fileName = uuid + "_" + file.getOriginalFilename();
			
			logger.info(userImagePath);
			
			logger.info(fileName);
			
			File saveFile = new File(userImagePath, fileName);

			file.transferTo(saveFile); 

			userVO.setProfileImg("http://101.101.216.127:8090/resource/upload/images/user_image_file/" + fileName);
			logger.info(userVO.getUid());
			logger.info(userVO.getUpass());
			logger.info(userVO.getName());
		} 

		userDAO.userUpdate(userVO);

		logger.info("회원 정보 수정");
	}

	/* 가입한 그룹 목록 */
	@Override
	public List<GroupVO> userGroupList(String uid) throws Exception {
		return userDAO.userGroupList(uid);
	}

	/* 관심 주제 설정 */
	@Override
	public void userCategoryMapping(UserVO userVO, String uid) throws Exception {
		userDAO.userCategoryDelete(uid);
		
		userDAO.userCategoryMapping(userVO);
	}

	/* 관심 주제 가져오기 */
	@Override
	public UserVO userCategoryList(String uid) throws Exception {
		return userDAO.userCategoryList(uid);
	}

}
