package com.project.doran.chat.controller;

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

import com.project.doran.chat.service.ChatService;
import com.project.doran.chat.vo.ChatMessageVO;
import com.project.doran.chat.vo.ChatRoomVO;
import com.project.doran.group.controller.GroupController;

@Controller("chatController")
@RequestMapping(value = "/chat")
public class ChatController {

	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);

	@Autowired
	private ChatService chatService;

	/* 채팅방 페이지 */
	@RequestMapping(value = "/room", method = RequestMethod.GET)
	public void chatRoomGET(@RequestParam("uid") String uid, Model model) throws Exception {
		logger.info("채팅방 페이지입니다. " + uid);

		// 채팅방 목록
		model.addAttribute("chatRoomList", chatService.roomList(uid));
	}

	/* 채팅 페이지 */
	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public void chattingGET(@RequestParam("roomId") int roomId, ChatMessageVO chatMessageVO, Model model, HttpServletRequest request) throws Exception {
		logger.info("채팅 페이지입니다. : " + roomId);
		
		// 채팅 메시지 읽음
		chatService.msgRead(chatMessageVO, request);

		// 채팅방 정보
		model.addAttribute("roomInfo", chatService.roomSelect(roomId));

		// 채팅 메시지 목록
		model.addAttribute("chatMsgList", chatService.messageList(roomId));
	}

	/* 채팅방 생성 */
	@ResponseBody
	@RequestMapping(value = "/roomCreate.do", method = RequestMethod.POST)
	public void roomCreatePost(ChatRoomVO chatRoomVO) throws Exception {
		logger.info("채팅방 생성");

		chatService.roomCheck(chatRoomVO);
	}

	/* 채팅 메시지 저장 */
	@ResponseBody
	@RequestMapping(value = "/msgInsert.do", method = RequestMethod.POST)
	public void msgInsert(ChatMessageVO chatMessageVO) throws Exception {
		logger.info("채팅 메시지 저장");

		chatService.messageInsert(chatMessageVO);
	}
	
}
