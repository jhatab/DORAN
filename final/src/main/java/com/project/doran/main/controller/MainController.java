package com.project.doran.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.doran.category.service.CategoryService;
import com.project.doran.chat.service.ChatService;
import com.project.doran.group.service.GroupService;
import com.project.doran.group.vo.GroupVO;
import com.project.doran.notice.service.NoticeService;
import com.project.doran.notice.vo.NoticeVO;
import com.project.doran.post.service.PostService;
import com.project.doran.post.vo.PostVO;
import com.project.doran.search.service.SearchService;
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
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private SearchService searchService;

	/* 메인 페이지 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void groupListGET(Model model) throws Exception {
		logger.info("메인 페이지입니다.");

		model.addAttribute("categoryList", categoryService.categoryList());

		model.addAttribute("groupList", groupService.mainGroupList());

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
		
		model.addAttribute("userCategoryList", userService.userCategoryList(uid));

		return "/mypage";
	}
	
	/* 검색 결과 페이지 */
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void searchGET(Model model, GroupVO groupVO, PostVO postVO) throws Exception {
		logger.info("검색 결과 페이지입니다.");
		
		model.addAttribute("searchGroupList", searchService.searchGroupList(groupVO));
		
		model.addAttribute("searchPostList", searchService.searchPostList(postVO));
		
		model.addAttribute("searchPostImageList", postService.mainPostImageList());
		
		model.addAttribute("searchTagList", searchService.searchTagList(postVO));
		
		model.addAttribute("tagList", searchService.tagList(postVO));
	}
	
	/* 유저별 안 읽은 메시지 총 개수 */
	@ModelAttribute("unReadCnt")
	public void unReadCnt(String uid, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("unReadCnt", chatService.totalUnReadMsg(uid, request));
	}
	
	/* 알림 목록 */
	@ModelAttribute("noticeList")
	public void noticeList(NoticeVO noticeVO, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("noticeList", noticeService.noticeList(noticeVO, request));
	}
	
	/* 알림 확인 */
	@ResponseBody
	@RequestMapping(value = "/noticeRead.do", method = RequestMethod.POST)
	public void noticeReadPost(int noticeId) throws Exception {
		logger.info("알림 확인");
		
		noticeService.noticeRead(noticeId);
	}
	
	/* 유저별 안 읽은 알림 개수 */
	@ModelAttribute("unNoticeCnt")
	public void unNoticeCnt(String toUid, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("unNoticeCnt", noticeService.noticeCnt(toUid, request));
	}
	
}
