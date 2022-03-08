package com.project.doran.chat.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ChatRoomVO {

	private String roomId;
	private String uid1;
	private String uid2;
	private Date createdDate;
	
}
