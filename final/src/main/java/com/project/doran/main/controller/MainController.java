package com.project.doran.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.doran.group.controller.GroupController;

@Controller("MainController")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	
	/* 메인 페이지 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void groupListGET(Model model) throws Exception {
		logger.info("메인 페이지입니다.");
	}

}
