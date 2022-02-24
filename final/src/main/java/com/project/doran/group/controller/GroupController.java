package com.project.doran.group.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.doran.attch.vo.AttchVO;
import com.project.doran.category.service.CategoryService;
import com.project.doran.group.service.GroupService;
import com.project.doran.group.vo.GroupVO;
import com.project.doran.post.service.PostService;
import com.project.doran.post.vo.PostVO;

@Controller("groupController")
@RequestMapping(value = "/group")
public class GroupController {
	
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private PostService postService;
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String groupInsertForm() throws Exception {
		return "group/insert";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String groupInsert(GroupVO groupVO) throws Exception {
		groupService.groupInsert(groupVO);
		return "redirect:/tagMain";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String groupDelete(GroupVO groupVO) throws Exception {
		groupService.groupDelete(groupVO);
		return "redirect:/tagMain";
	}
	
	/* 그룹 목록 페이지 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void groupListGET(Model model) throws Exception {
		logger.info("그룹 목록 페이지입니다.");
		
		model.addAttribute("categoryList", categoryService.categoryList());
		
		model.addAttribute("groupList", groupService.groupList());
	}
	
	/* 그룹 생성 페이지 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void groupCreateGET(Model model) throws Exception {
		logger.info("그룹 생성 페이지입니다.");
		
		model.addAttribute("categoryList", categoryService.categoryList());
	}
	
	/* 그룹 생성 */
	@RequestMapping(value = "/create.do", method = RequestMethod.POST)
	public String groupCreatePost(GroupVO groupVO, RedirectAttributes rttr, MultipartFile file) throws Exception {
		logger.info("그룹 생성");
		
		groupService.groupCreate(groupVO, file);
		
		rttr.addFlashAttribute("result", "group create success");

		return "redirect:/group/list";
	}
	
	/* 그룹 수정 페이지 */
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void groupUpdateGet(int groupId, Model model) throws Exception {
		logger.info("그룹 수정 페이지입니다.");

		model.addAttribute("categoryList", categoryService.categoryList());
		
		model.addAttribute("groupInfo", groupService.groupHome(groupId));
	}
	
	/* 그룹 수정 */
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String groupUpdatePost(GroupVO groupVO, RedirectAttributes rttr, MultipartFile file) throws Exception {
		logger.info("그룹 수정");
		
		groupService.groupUpdate(groupVO, file);
		
		rttr.addFlashAttribute("result", "group update success");
		
		return "redirect:/group/home?groupId=" + Integer.toString(groupVO.getGroupId());
	}
	
	/* 그룹 삭제 */
	@RequestMapping(value = "/remove.do", method = RequestMethod.POST)
	public String groupRemovePost(GroupVO groupVO, RedirectAttributes rttr) throws Exception {
		logger.info("그룹 삭제");
		
		groupService.groupRemove(groupVO);
		
		rttr.addFlashAttribute("result", "group delete success");
	
		return "redirect:/group/list";
	}
	
	/* 그룹 페이지 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public void groupHomeGet(int groupId, Model model, RedirectAttributes rttr) throws Exception {
		logger.info("그룹 페이지입니다. : " + groupId);
		
		// 그룹 정보
		model.addAttribute("groupInfo", groupService.groupHome(groupId));
		
		// 게시물 목록
		model.addAttribute("postList", postService.postList(groupId));
		
		// 이미지 파일 목록
		model.addAttribute("postImageList", postService.postImageList(groupId));
	}
	
	/* 게시물 작성 + 이미지 파일 등록 */
	@RequestMapping(value = "/postWrite.do", method = RequestMethod.POST)
	public String postWritePost(PostVO postVO, AttchVO attchVO, List<MultipartFile> files, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		logger.info("게시물 작성");
		
		postService.postWrite(postVO, attchVO, files);
		
		rttr.addFlashAttribute("result", "feed create success");

		String referer = request.getHeader("Referer");	// 헤더에서 이전 페이지를 읽는다.
		return "redirect:" + referer; 					// 이전 페이지
	}
}
