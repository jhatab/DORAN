package com.project.doran.chat.vo;

import lombok.Data;

@Data
public class ChatMessageVO {

	private int roomId; // 채팅방 식별자
	private int messagId; // 채팅 메시지 식별자
	private String uid; // 계정 아이디
	private String message; // 채팅 메시지 내용
	private String msgTime; // 채팅일시

	private int unReadCount; // 안 읽은 메세지 수
	private int sessionCount; // 현재 세션 수

	/* userTbl */
	private String nickname;
	private String profileImg;

}
