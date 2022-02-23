package com.project.doran.group.service;

import java.util.List;

import com.project.doran.group.vo.GroupVO;

public interface GroupService {

	public void groupInsert(GroupVO groupVO) throws Exception; // 그룹 추가
	public void groupDelete(GroupVO groupVO) throws Exception; // 그룹 삭제
	
	/* 그룹 목록 */
	public List<GroupVO> groupList() throws Exception;
	
}
