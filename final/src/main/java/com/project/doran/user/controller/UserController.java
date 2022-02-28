package com.project.doran.user.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.doran.user.service.UserService;
import com.project.doran.user.vo.UserVO;

@Controller("userController")
@RequestMapping(value = "/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	// 01 회원 목록
	@RequestMapping("/list")
	public String memberList(Model model) throws Exception {
		// controller => service => dao 요청
		List<UserVO> userList = userService.userList();
		model.addAttribute("userList", userList);
		return "user/list";
	}

	// 03 회원 상세정보 조회
	@RequestMapping("/view")
	public String memberView(String uid, Model model) throws Exception {
		// 회원 정보를 model에 저장
		model.addAttribute("user", userService.userInfo(uid));
		// System.out.println("클릭한 아이디 확인 : "+ uid);
		logger.info("클릭한 아이디 : " + uid);
		// mod.jsp로 포워드
		return "user/mod";
	}
	// 0

	// 04. 회원 정보 수정 처리
	@RequestMapping("/update")
	public String memberUpdate(@ModelAttribute UserVO userVO) throws Exception {
		userService.userUpdate(userVO);
		return "redirect:/user/list";
	}
}
