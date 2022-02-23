package com.project.doran.group.service;

import com.project.doran.group.vo.GroupVO;

public interface GroupService {

	public void groupInsert(GroupVO groupVO) throws Exception; // 그룹 추가
	public void groupDelete(GroupVO groupVO) throws Exception; // 그룹 삭제
}
