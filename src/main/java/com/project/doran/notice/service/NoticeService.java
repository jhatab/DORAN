package com.project.doran.notice.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.project.doran.notice.vo.NoticeVO;

public interface NoticeService {

	/* 알림 추가 */
	public void noticeAdd(NoticeVO noticeVO) throws Exception;
	
	/* 알림 목록 */
	public List<NoticeVO> noticeList(NoticeVO noticeVO, HttpServletRequest request) throws Exception;
	
	/* 알림 확인 */
	public void noticeRead(int noticeId) throws Exception;
	
	/* 유저별 안 읽은 알림 개수 */
	public int noticeCnt(String toUid, HttpServletRequest request) throws Exception;
	
}
