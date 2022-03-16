package com.project.doran.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.doran.chat.vo.ChatMessageVO;
import com.project.doran.chat.vo.ChatRoomVO;

@Mapper
@Repository("chatDAO")
public interface ChatDAO {

	/* 채팅방 목록 */
	public List<ChatRoomVO> roomList(String uid) throws Exception;
	
	/* 채팅방 유무 확인 */
	public int roomCheck(ChatRoomVO chatRoomVO) throws Exception;
	
	/* 채팅방 생성 */
	public int roomCreate(ChatRoomVO chatRoomVO) throws Exception;
	
	/* 채팅 메시지 목록 */
	public List<ChatMessageVO> messageList(int roomId) throws Exception;
	
	/* 채팅 메시지 저장 */
	public void messageInsert(ChatMessageVO chatMessageVO) throws Exception;
	
	/* 채팅방 정보 */
	public ChatRoomVO roomSelect(int roomId) throws Exception;
	
	/* 채팅 메시지 읽음 */
	public void msgRead(ChatMessageVO chatMessageVO) throws Exception;
	
	/* 유저별 안 읽은 메시지 총 개수 */
	public int totalUnReadMsg(String uid) throws Exception;
	
}
