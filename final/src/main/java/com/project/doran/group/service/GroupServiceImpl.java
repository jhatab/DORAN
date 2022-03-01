package com.project.doran.group.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.doran.group.dao.GroupDAO;
import com.project.doran.group.vo.GroupVO;
import com.project.doran.group.vo.UserGroupVO;
@Service("groupService")
public class GroupServiceImpl implements GroupService {
	
	@Autowired
	private GroupDAO groupDAO;
	@Override
	public void groupInsert(GroupVO groupVO) throws Exception {
		groupDAO.groupInsert(groupVO);
	}

	/* 그룹 목록 */
	@Override
	public List<GroupVO> groupList() throws Exception {
		return groupDAO.groupList();
	}

	/* 그룹 생성 + 생성자-그룹 매핑 */
	@Override
	public void groupCreate(GroupVO groupVO, UserGroupVO userGroupVO, MultipartFile file) throws Exception {
		String groupImagePath = System.getProperty("user.dir") + "\\src\\main\\webapp\\resources\\group_image_file";

		if(!file.isEmpty()){
			UUID uuid = UUID.randomUUID();

			String fileName = uuid + "_" + file.getOriginalFilename();

			File saveFile = new File(groupImagePath, fileName);

			file.transferTo(saveFile);

			groupVO.setGroupImagePath("/group_image_file/" + fileName);
		}

		groupDAO.groupCreate(groupVO);
		
		userGroupVO.setGroupId(groupVO.getGroupId());
		groupDAO.userGroupMapping(userGroupVO);
	}

	/* 그룹 페이지 */
	@Override
	public GroupVO groupHome(int groupId) throws Exception {
		return groupDAO.groupHome(groupId);
	}

	/* 그룹 수정 */
	@Override
	public void groupUpdate(GroupVO groupVO, MultipartFile file) throws Exception {
		String groupImagePath = System.getProperty("user.dir") + "\\src\\main\\webapp\\resources\\group_image_file";

		if(!file.isEmpty()){
			UUID uuid = UUID.randomUUID();

			String fileName = uuid + "_" + file.getOriginalFilename();

			File saveFile = new File(groupImagePath, fileName);

			file.transferTo(saveFile);

			groupVO.setGroupImagePath("/group_image_file/" + fileName);
		}

		groupDAO.groupUpdate(groupVO);
	}

	/* 그룹 삭제 */
	@Override
	public void groupRemove(GroupVO groupVO) throws Exception {
		groupDAO.groupRemove(groupVO);
	}
	
	/* 그룹 가입 신청 여부 체크 */
	@Override
	public int groupJoinCheck(UserGroupVO userGroupVO) throws Exception {
		int groupJoinCheck = groupDAO.groupJoinCheck(userGroupVO);
		
		// 그룹 가입 신청을 안 했으면 가입 신청
		if(groupJoinCheck == 0) {
			return groupDAO.groupJoin(userGroupVO);
		}
		// 이미 가입 신청을 했으면
		else {
			return -1;
		}
	}
	
	/* 그룹 가입 승인 확인 */
	public int isApproval(UserGroupVO userGroupVO, HttpServletRequest request) throws Exception {
		
		// 로그인 유저 아이디
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("uid");
		userGroupVO.setUid(userId);
		
		int isApproval = groupDAO.isApproval(userGroupVO);
		
		// 가입 승인 X
		if(isApproval == 0) {
			return 0;
		}
		// 가입 승인 O & 그룹 생성자
		else {
			return 1;
		}
	}

}