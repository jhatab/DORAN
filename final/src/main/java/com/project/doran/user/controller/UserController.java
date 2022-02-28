package com.project.doran.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.doran.user.service.UserService;

@Controller("userController")
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;

	
}
