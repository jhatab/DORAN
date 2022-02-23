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

import com.project.doran.search.vo.SearchVO;
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
	
	@RequestMapping(value = "/tagList", method = RequestMethod.GET)
	public String selectTagList(Model model) throws Exception {
		List<UserVO> tagList = userService.selectTagList();
		model.addAttribute("tagList", tagList);
		return "user/index";

	}


	@RequestMapping(value = "/getSearchList", method = RequestMethod.GET)
	public String getBoardList(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			, @RequestParam(required = false) String keyword
			, @ModelAttribute("searchVO") SearchVO searchVO
	) throws Exception {

		//검색
		model.addAttribute("searchVO", searchVO);
		searchVO.setKeyword(keyword);

		//전체 게시글 개수
		int listCnt = userService.getSearchListCnt(searchVO);

		//검색 
		searchVO.pageInfo(page, range, listCnt);

		//페이징
		model.addAttribute("pagination", searchVO);
		
		//게시글 화면 출력
		model.addAttribute("searchList", userService.getSearchList(searchVO));
		
		return "user/(게시판)";
	}

}
