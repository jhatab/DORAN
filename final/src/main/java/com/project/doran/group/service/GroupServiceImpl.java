package com.project.doran.group.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	@Override
	public void groupDelete(GroupVO groupVO) throws Exception {
		groupDAO.groupDelete(groupVO);
	}  

	/* 그룹 목록 */
	@Override
	public List<GroupVO> groupList() throws Exception {
		return groupDAO.groupList();
	}

}
