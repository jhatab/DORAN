package com.project.doran.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.doran.category.service.CategoryService;
import com.project.doran.group.controller.GroupController;
import com.project.doran.group.service.GroupService;
import com.project.doran.group.vo.GroupVO;
import com.project.doran.user.service.UserService;

@Controller("MainController")
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private GroupService groupService;

	@Autowired
	private UserService userService;

	/* 메인 페이지 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void groupListGET(Model model) throws Exception {
		logger.info("메인 페이지입니다.");
	}

	/* 마이페이지 */
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void myPageGET(HttpSession session, Model model, GroupVO groupVO, HttpServletRequest request) throws Exception {
		logger.info("마이 페이지");
		
		model.addAttribute("categoryList", categoryService.categoryList());
		
		model.addAttribute("groupList", groupService.userGroupMappingList(groupVO, request));
		
		model.addAttribute("member", userService.userInfo((String) session.getAttribute("uid")));
	}
}
