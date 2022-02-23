package com.project.doran.group.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.doran.category.service.CategoryService;
import com.project.doran.group.service.GroupService;
import com.project.doran.group.vo.GroupVO;

@Controller("groupController")
@RequestMapping(value = "/group")
public class GroupController {
	
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	
	@Autowired
	private CategoryService categoryService;
	
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
	
	/* 그룹 목록 페이지 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void groupListGET(Model model) throws Exception {
		logger.info("그룹 목록 페이지입니다.");
		
		model.addAttribute("categoryList", categoryService.categoryList());
//		model.addAttribute("cList", groupService.categoryList());
//		model.addAttribute("gList", groupService.groupList());
	}


}
