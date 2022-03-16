package com.project.doran.chat.vo;

import lombok.Data;

@Data
public class ChatMessageVO {

	private int roomId; // 채팅방 식별자
	private int messagId; // 채팅 메시지 식별자
	private String uid; // 계정 아이디
	private String message; // 채팅 메시지 내용
	private String msgTime; // 채팅일시
	private int msgRead; // 메시지 확인 여부 (0-확인X, 1-확인O)

	/* userTbl */
	private String nickname;
	private String profileImg;

}
