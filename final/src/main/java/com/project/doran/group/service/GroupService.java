package com.project.doran.group.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.project.doran.group.vo.GroupVO;

public interface GroupService {

	/* 그룹 목록 */
	public List<GroupVO> groupList() throws Exception;

	/* 그룹 생성 + 생성자-그룹 매핑 */
	public void groupCreate(GroupVO groupVO, MultipartFile file) throws Exception;

	/* 그룹 페이지 */
	public GroupVO groupHome(int groupId) throws Exception;

	/* 그룹 추가 */
	public void groupInsert(GroupVO groupVO) throws Exception; 

	/* 그룹 수정 */
	public void groupUpdate(GroupVO groupVO, MultipartFile file) throws Exception; 

	/* 그룹 삭제 */
	public void groupRemove(GroupVO groupVO) throws Exception;
	
	/* 그룹 가입 신청 여부 체크 */
	public int groupJoinCheck(GroupVO groupVO) throws Exception;
	
	/* 그룹 가입 승인 체크 */
	public int isApproval(GroupVO groupVO, HttpServletRequest request) throws Exception;

	/* 그룹 가입 회원 리스트 */
	public List<GroupVO> groupMemberList(int groupId) throws Exception;
	
	/* 그룹 가입 승인 */
	public void groupMemberApproval(GroupVO groupVO) throws Exception;
	
	/* 그룹 가입 취소, 퇴출, 탈퇴 */
	public void groupMemberCancle(GroupVO groupVO) throws Exception;
	
}