package com.project.doran.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.doran.category.service.CategoryService;
import com.project.doran.group.controller.GroupController;
import com.project.doran.group.service.GroupService;
import com.project.doran.group.vo.GroupVO;
import com.project.doran.post.service.PostService;
import com.project.doran.post.vo.PostVO;
import com.project.doran.user.service.UserService;

@Controller("MainController")
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private GroupService groupService;

	@Autowired
	private PostService postService;

	@Autowired
	private UserService userService;

	/* 메인 페이지 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void groupListGET(Model model) throws Exception {
		logger.info("메인 페이지입니다.");

		model.addAttribute("categoryList", categoryService.categoryList());

		model.addAttribute("groupList", groupService.groupList());

		model.addAttribute("groupLikeList", groupService.groupLikeList());

		model.addAttribute("postList", postService.mainPostList());

		// 이미지 파일 목록
		model.addAttribute("mainPostImageList", postService.mainPostImageList());

	}

	/* 마이페이지 */
	@RequestMapping(value = "/mypage/{uid}", method = RequestMethod.GET)
	public String myPageGET(@PathVariable("uid") String uid, Model model, GroupVO groupVO, HttpServletRequest request)
			throws Exception {
		logger.info("마이 페이지입니다.");

		model.addAttribute("categoryList", categoryService.categoryList());

		model.addAttribute("userGroupList", userService.userGroupList(uid));

//		model.addAttribute("member", userService.userInfo((String) session.getAttribute("uid")));

		return "/mypage";
	}

}
