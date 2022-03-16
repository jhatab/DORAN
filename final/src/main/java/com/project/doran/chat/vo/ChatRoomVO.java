package com.project.doran.chat.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ChatRoomVO {

	private String roomId;
	private String uid1;
	private String uid2;
	private Date createdDate;
	
	/* userTbl */
	private String nickname1;
	private String nickname2;
	private String profileImg1;
	private String profileImg2;
	
	private String recentMsg;	// 방 별 최근 메시지
	private String recentTime;	// 방 별 최근 메시지 시간
	private String unMsgRead;	// 유저&방 별 안 읽은 메시지 수
	
}
