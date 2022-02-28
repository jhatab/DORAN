package com.project.doran.group.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.doran.group.vo.GroupVO;
@Mapper
@Repository("groupDAO")
public interface GroupDAO{

	/* 그룹 목록 */
	public List<GroupVO> groupList() throws Exception;

	/* 그룹 생성 */
	public void groupCreate(GroupVO groupVO) throws Exception;

	/* 그룹 페이지 */
	public GroupVO groupHome(int groupId) throws Exception; 

	/* 그룹 추가 */
	public void groupInsert(GroupVO groupVO) throws Exception; 

	/* 그룹 수정 */
	public void groupUpdate(GroupVO groupVO) throws Exception; 

	/* 그룹 삭제 */
	public void groupRemove(GroupVO groupVO) throws Exception;

}