package com.project.doran.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.doran.group.controller.GroupController;
import com.project.doran.user.service.UserService;
import com.project.doran.user.vo.UserVO;

@Controller("userController")
@RequestMapping(value = "/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	/* 로그인 페이지 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() throws Exception {
		logger.info("로그인 페이지입니다.");
	}

	/* 로그인 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, UserVO userVO, RedirectAttributes rttr) throws Exception {
		logger.info("로그인");

		HttpSession session = request.getSession();
		UserVO uvo = userService.userLogin(userVO);

		if (uvo == null) {
			System.out.println("sdafd");
			rttr.addFlashAttribute("result", "login fail");
			return "redirect:/user/login";
		}

		session.setAttribute("member", uvo);
		session.setAttribute("uid", uvo.getUid()); // 그룹 페이지에서 사용 (게시물 공개 수준)

		return "redirect:/main";
	}

	/* 로그아웃 */
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logoutGET(HttpServletRequest request) throws Exception {
		logger.info("로그아웃");

		HttpSession session = request.getSession();

		session.invalidate();

		return "redirect:/main";
	}

	/* 회원가입 페이지 */
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGET() throws Exception {
		logger.info("회원가입 페이지입니다.");
	}

	/* 회원가입 */
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(UserVO userVO, MultipartFile file, RedirectAttributes rttr) throws Exception {
		logger.info("회원가입");

		userService.userJoin(userVO, file);
		
		rttr.addFlashAttribute("result", "join success");

		return "redirect:/main";
	}

	/* 아이디 중복 검사 */
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String idCheckPOST(String uid) throws Exception {
		int result = userService.idCheck(uid);

		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}
	}

	/* 닉네임 중복 검사 */
	@ResponseBody
	@RequestMapping(value = "/nickCheck", method = RequestMethod.POST)
	public String nickCheckPOST(String nickname) throws Exception {
		int result = userService.nickCheck(nickname);

		if (result != 0) {
			return "fail"; // 중복 닉네임 존재
		} else {
			return "success"; // 중복 닉네임 x
		}
	}
	
	/* 회원 정보 수정 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String userUpdate(UserVO userVO, MultipartFile file, HttpSession session) throws Exception {
		
		logger.info("이미지 업로드");
		
		userService.userUpdate(userVO, file);
		
		session.invalidate();
		
		return "redirect:/user/login";
	}
	
	/* 관심 주제 설정 */
	@RequestMapping(value = "/interest.do", method = RequestMethod.POST)
	public String userInterestPOST(UserVO userVO, String uid, HttpServletRequest request) throws Exception {
		logger.info("관심 주제 설정");
		
		userService.userCategoryMapping(userVO, uid);

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}
	
}
