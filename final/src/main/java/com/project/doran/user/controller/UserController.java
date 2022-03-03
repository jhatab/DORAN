package com.project.doran.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.doran.group.controller.GroupController;
import com.project.doran.user.service.UserService;
import com.project.doran.user.vo.UserVO;

@Controller("userController")
@RequestMapping(value = "/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);

	@Autowired
	private UserService userService;
	
	/* 로그인 페이지 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void groupListGET() throws Exception {
		logger.info("로그인 페이지입니다.");
	}

	/* 로그인 */
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, UserVO userVO, RedirectAttributes rttr) throws Exception {
		logger.info("로그인");

		HttpSession session = request.getSession();
		UserVO uvo = userService.userLogin(userVO);

		if (uvo == null) {
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/user/login";
		}

		session.setAttribute("member", uvo);
		session.setAttribute("uid", uvo.getUid());	// 그룹 페이지에서 사용 (게시물 공개 수준)

		return "redirect:/main";
	}

	/* 로그아웃 */
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logoutGET(HttpServletRequest request) throws Exception {
		logger.info("로그아웃");
        
		HttpSession session = request.getSession();
		
		session.invalidate();
	    
		return "redirect:/user/login";
	}

	/* 정보 수정 */
	@RequestMapping(value = "update.do", method = RequestMethod.GET)
	public String userUpdateForm(HttpSession session, Model model) throws Exception {
		logger.info("정보 수정");
		
		model.addAttribute("member", userService.userInfo((String) session.getAttribute("uid")));
		
		return "/user/update";
	}
	
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public String userUpdate(UserVO userVO) throws Exception {
		
		userService.userUpdate(userVO);
		
		return "redirect:/main";
	}
}
