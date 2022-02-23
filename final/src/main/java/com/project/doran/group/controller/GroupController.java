package com.project.doran.group.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.doran.group.service.GroupService;
import com.project.doran.group.vo.GroupVO;

@Controller("groupController")
@RequestMapping(value = "/group")
public class GroupController {
	
	@Autowired
	private GroupService groupService;
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String groupInsertForm() throws Exception {
		return "group/insert";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String groupInsert(GroupVO groupVO) throws Exception {
		groupService.groupInsert(groupVO);
		return "redirect:/tagMain";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String groupDelete(GroupVO groupVO) throws Exception {
		groupService.groupDelete(groupVO);
		return "redirect:/tagMain";
	}
	


}
