package com.project.doran.chat.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.project.doran.chat.vo.ChatMessageVO;
import com.project.doran.chat.vo.ChatRoomVO;

public interface ChatService {

	/* 채팅방 목록 */
	public List<ChatRoomVO> roomList(String uid) throws Exception;
	
	/* 채팅방 유무 확인 + 채팅방 생성 */
	public int roomCheck(ChatRoomVO chatRoomVO) throws Exception;
	
	/* 채팅 메세지 목록 */
	public List<ChatMessageVO> messageList(int roomId) throws Exception;
	
	/* 채팅 메시지 저장 */
	public void messageInsert(ChatMessageVO chatMessageVO) throws Exception;
	
	/* 채팅방 정보 */
	public ChatRoomVO roomSelect(int roomId) throws Exception;
	
	/* 채팅 메시지 읽음 */
	public void msgRead(ChatMessageVO chatMessageVO, HttpServletRequest request) throws Exception;
	
	/* 유저별 안 읽은 메시지 총 개수 */
	public int totalUnReadMsg(String uid, HttpServletRequest request) throws Exception;
	
}
