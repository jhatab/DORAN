package com.project.doran.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.doran.chat.dao.ChatDAO;
import com.project.doran.chat.vo.ChatMessageVO;
import com.project.doran.chat.vo.ChatRoomVO;

@Service("chatService")
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDAO chatDAO;
	
	/* 채팅방 목록 */
	@Override
	public List<ChatRoomVO> roomList(String uid) throws Exception {
		return chatDAO.roomList(uid);
	}
	
	/* 채팅방 유무 확인 + 채팅방 생성 */
	@Override
	public int roomCheck(ChatRoomVO chatRoomVO) throws Exception {
		int roomCheck = chatDAO.roomCheck(chatRoomVO);
		
		// 채팅방이 없으면 채팅방 생성
		if(roomCheck == 0) {
			return chatDAO.roomCreate(chatRoomVO);
		}
		// 채팅방이 있으면
		else {
			return -1;
		}
	}
	
	/* 채팅 메세지 목록 */
	@Override
	public List<ChatMessageVO> messageList(int roomId) throws Exception {
		return chatDAO.messageList(roomId);
	}
	
	/* 채팅 메시지 저장 */
	@Override
	public void messageInsert(ChatMessageVO chatMessageVO) throws Exception {
		chatDAO.messageInsert(chatMessageVO);
	}
	
	/* 채팅방 정보 */
	@Override
	public ChatRoomVO roomSelect(int roomId) throws Exception {
		return chatDAO.roomSelect(roomId);
	}
	
}
