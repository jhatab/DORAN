package com.project.doran.notice.vo;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int noticeId;		// 알림 식별자
	private String toUid;		// 알림을 받는 회원
	private String fromUid;		// 알림을 보내는 회원
	private String noticeType;	// 알림 종류 (feed, reply, ...)
	private int groupId;		// 알림 대상 그룹
	private int postId;			// 알림 대상 피드
	private String noticeMsg;	// 알림 내용
	private String noticeDate;	// 알림 생성 일시
	private int noticeRead;		// 알림 확인 여부
	
}
