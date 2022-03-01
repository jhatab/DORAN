package com.project.doran.group.vo;

import lombok.Data;

@Data
public class UserGroupVO {

	private int groupId;	// 그룹 식별자
	private String uid;		// 계정 아이디
	private int isApproval;	// 그룹 가입 승인 여부 (0-승인X, 1-승인O, 2-생성자)
	
}
