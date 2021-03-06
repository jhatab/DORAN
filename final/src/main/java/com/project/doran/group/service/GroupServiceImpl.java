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

@Service("groupService")
public class GroupServiceImpl implements GroupService {

	@Autowired
	private GroupDAO groupDAO;

	@Override
	public void groupInsert(GroupVO groupVO) throws Exception {
		groupDAO.groupInsert(groupVO);
	}
	
	/* 메인 그룹 목록 */
	@Override
	public List<GroupVO> mainGroupList() throws Exception {
		return groupDAO.mainGroupList();
	}

	/* 그룹 목록 */
	@Override
	public List<GroupVO> groupList() throws Exception {
		return groupDAO.groupList();
	}
	
	/* 그룹 목록 좋아요순 */
	public List<GroupVO> groupLikeList() throws Exception {
		return groupDAO.groupLikeList();
	}

	/* 그룹 생성 + 생성자-그룹 매핑 */
	@Override
	public void groupCreate(GroupVO groupVO, MultipartFile file) throws Exception {
		String groupImagePath = "/usr/local/tomcat/apache-tomcat-8.5.76/webapps/upload/images/group_image_file";

		if (!file.isEmpty()) {
			UUID uuid = UUID.randomUUID();

			String fileName = uuid + "_" + file.getOriginalFilename();

			File saveFile = new File(groupImagePath, fileName);

			file.transferTo(saveFile);

			groupVO.setGroupImagePath("http://101.101.216.127:8090/upload/images/group_image_file/" + fileName);
		}

		groupDAO.groupCreate(groupVO);

		groupVO.getGroupId();
		groupDAO.userGroupMapping(groupVO);
	}

	/* 그룹 페이지 */
	@Override
	public GroupVO groupHome(int groupId) throws Exception {
		return groupDAO.groupHome(groupId);
	}

	/* 그룹 수정 */
	@Override
	public void groupUpdate(GroupVO groupVO, MultipartFile file) throws Exception {
		String groupImagePath = System.getProperty("user.dir")
				+ "\\src\\main\\resources\\static\\images\\group_image_file";

		if (!file.isEmpty()) {
			UUID uuid = UUID.randomUUID();

			String fileName = uuid + "_" + file.getOriginalFilename();

			File saveFile = new File(groupImagePath, fileName);

			file.transferTo(saveFile);

			groupVO.setGroupImagePath("/images/group_image_file/" + fileName);
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
	public int groupJoinCheck(GroupVO groupVO) throws Exception {
		int groupJoinCheck = groupDAO.groupJoinCheck(groupVO);

		// 그룹 가입 신청을 안 했으면 가입 신청
		if (groupJoinCheck == 0) {
			return groupDAO.groupJoin(groupVO);
		}
		// 이미 가입 신청을 했으면
		else {
			return -1;
		}
	}

	/* 그룹 가입 승인 확인 */
	public int isApproval(GroupVO groupVO, HttpServletRequest request) throws Exception {

		// 로그인 유저 아이디
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("uid");
		groupVO.setUid(userId);

		int isApproval = groupDAO.isApproval(groupVO);

		// 가입 승인 X
		if (isApproval == 0) {
			return 0;
		}
		// 가입 승인 O & 그룹 생성자
		else {
			return 1;
		}
	}

	/* 그룹 가입 회원 리스트 */
	public List<GroupVO> groupMemberList(int groupId) throws Exception {
		return groupDAO.groupMemberList(groupId);
	}

	/* 그룹 가입 승인 */
	public void groupMemberApproval(GroupVO groupVO) throws Exception {
		groupDAO.groupMemberApproval(groupVO);
	}

	/* 그룹 가입 취소, 퇴출, 탈퇴 */
	public void groupMemberCancle(GroupVO groupVO) throws Exception {
		groupDAO.groupMemberCancle(groupVO);
	}
	
	/* 그룹원 수 (관리자) */
	@Override
	public int groupMemberCnt(int groupId) throws Exception {
		return groupDAO.groupMemberCnt(groupId);
	}
	
	/* 그룹원 수 (그룹원) */
	@Override
	public int groupMemberCntB(int groupId) throws Exception {
		return groupDAO.groupMemberCntB(groupId);
	}

}