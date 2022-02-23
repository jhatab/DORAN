package com.project.doran.group.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

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

	@Override
	public void groupDelete(GroupVO groupVO) throws Exception {
		groupDAO.groupDelete(groupVO);
	}  

	/* 그룹 목록 */
	@Override
	public List<GroupVO> groupList() throws Exception {
		return groupDAO.groupList();
	}
	
	/* 그룹 생성 */
	@Override
	public void groupCreate(GroupVO groupVO, MultipartFile file) throws Exception {
		String groupImagePath = System.getProperty("user.dir") + "\\src\\main\\webapp\\resources\\group_image_file";
		
		if(!file.isEmpty()){
			UUID uuid = UUID.randomUUID();
			
			String fileName = uuid + "_" + file.getOriginalFilename();
			
			File saveFile = new File(groupImagePath, fileName);
			
			file.transferTo(saveFile);
			
			groupVO.setGroupImagePath("/group_image_file/" + fileName);
		}
		
		groupDAO.groupCreate(groupVO);
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
	
}
