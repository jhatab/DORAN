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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.doran.attch.vo.AttchVO;
import com.project.doran.category.service.CategoryService;
import com.project.doran.group.service.GroupService;
import com.project.doran.group.vo.GroupVO;
import com.project.doran.post.service.PostService;
import com.project.doran.post.vo.PostVO;
import com.project.doran.postLike.service.PostLikeService;
import com.project.doran.postLike.vo.PostLikeVO;
import com.project.doran.reply.service.ReplyService;
import com.project.doran.reply.vo.ReplyVO;

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
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private PostLikeService postLikeService;
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String groupInsertForm() throws Exception {
		return "group/insert";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String groupInsert(GroupVO groupVO) throws Exception {
		groupService.groupInsert(groupVO);
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
	
	/* 그룹 가입 신청 */
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String groupJoinPost(GroupVO groupVO, RedirectAttributes rttr) throws Exception {
		logger.info("그룹 가입 신청");
		
		int groupJoinCheck = groupService.groupJoinCheck(groupVO);

		if(groupJoinCheck == -1) {
			rttr.addFlashAttribute("result", "group join done");
		} else {
			rttr.addFlashAttribute("result", "group join success");
		}
		
	
		return "redirect:/group/home?groupId=" + Integer.toString(groupVO.getGroupId());
	}
	
	/* 그룹 페이지 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public void groupHomeGet(@RequestParam("groupId") int groupId, PostVO postVO, GroupVO groupVO, Model model, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		logger.info("그룹 페이지입니다. : " + groupId);
		
		// 그룹 정보
		model.addAttribute("groupInfo", groupService.groupHome(groupId));
		
		// 게시물 목록
		model.addAttribute("postList", postService.postList(postVO));
		
		// 이미지 파일 목록
		model.addAttribute("postImageList", postService.postImageList(groupId));
		
		// 태그 목록
		model.addAttribute("tagList", postService.tagList(groupId));
		
		// 댓글 목록
		model.addAttribute("replyList", replyService.replyList(groupId));
		
		// 인기 게시물 목록
		model.addAttribute("hotList", postService.hotPostList(groupId));
		
		// 그룹 가입 확인
		int isApproval = groupService.isApproval(groupVO, request);

		if(isApproval == 0) {	// 가입X
			model.addAttribute("isApproval", "0");
		} else {	// 가입O
			model.addAttribute("isApproval", "1");
		}
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
	
	/* 게시물 수정 */
	@ResponseBody
	@RequestMapping(value = "/postUpdate.do", method = RequestMethod.POST)
	public void postUpdatePost(PostVO postVO) throws Exception {
		logger.info("게시물 수정");
		
		postService.postUpdate(postVO);
	}
	
	/* 게시물 삭제 */
	@ResponseBody
	@RequestMapping(value = "/postDelete.do", method = RequestMethod.POST)
	public void postDeletePost(PostVO postVO) throws Exception {
		logger.info("게시물 삭제");
		
		postService.postDelete(postVO);
	}
	
	/* 댓글 작성 */
	@ResponseBody
	@RequestMapping(value = "/replyWrite.do", method = RequestMethod.POST)
	public void replyWritePost(ReplyVO replyVO, int postId) throws Exception {
		logger.info("댓글 작성");
		
		replyService.replyWrite(replyVO);
		
		// 댓글 수 업데이트
		replyService.replyCountUpdate(postId);
	}
	
	/* 댓글 수정 */
	@ResponseBody
	@RequestMapping(value = "/replyUpdate.do", method = RequestMethod.POST)
	public void replyUpdatePost(ReplyVO replyVO) throws Exception {
		logger.info("댓글 수정");
		
		replyService.replyUpdate(replyVO);
	}
	
	/* 댓글 삭제 */
	@ResponseBody
	@RequestMapping(value = "/replyDelete.do", method = RequestMethod.POST)
	public void replyDeletePost(ReplyVO replyVO, int postId) throws Exception {
		logger.info("댓글 삭제");
		
		replyService.replyDelete(replyVO);
		
		// 댓글 수 업데이트
		replyService.replyCountUpdate(postId);
	}
	
	/* 게시물 좋아요 추가/취소 */
	@ResponseBody
	@RequestMapping(value = "/postLike.do", method = RequestMethod.POST)
	public void postLikePost(PostLikeVO postLikeVO, int postId) throws Exception {
		logger.info("게시물 좋아요 추가/취소");
		
		postLikeService.likeCheck(postLikeVO);
		
		// 좋아요 수 업데이트
		postLikeService.likeCountUpdate(postId);
	}
	
}
