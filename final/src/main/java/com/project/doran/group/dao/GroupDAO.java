package com.project.doran.group.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.doran.group.vo.GroupVO;

@Mapper
@Repository("groupDAO")
public interface GroupDAO{
	
	public void groupInsert(GroupVO groupVO) throws DataAccessException; // 그룹 추가
	public void groupDelete(GroupVO groupVO) throws DataAccessException; // 그룹 삭제
	
	/* 그룹 목록 */
	public List<GroupVO> groupList() throws Exception;
}
