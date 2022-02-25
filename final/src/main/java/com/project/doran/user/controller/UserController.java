package com.project.doran.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.doran.search.vo.CriteriaVO;
import com.project.doran.user.service.UserService;
import com.project.doran.user.vo.UserVO;

@Controller("userController")
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String userUpdateForm(UserVO userVO) throws Exception {
		return "user/update";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String userUpdate(UserVO userVO, HttpSession httpSession) throws Exception {
		userService.userUpdate(userVO);
		httpSession.invalidate();
		return "redirect:/";
	}
	
}
