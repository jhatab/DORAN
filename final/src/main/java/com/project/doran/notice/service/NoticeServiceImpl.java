package com.project.doran.notice.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.doran.notice.dao.NoticeDAO;
import com.project.doran.notice.vo.NoticeVO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;
	
	/* 알림 추가 */
	@Override
	public void noticeAdd(NoticeVO noticeVO) throws Exception {
		noticeDAO.noticeAdd(noticeVO);
	}
	
	/* 알림 목록 */
	@Override
	public List<NoticeVO> noticeList(NoticeVO noticeVO, HttpServletRequest request) throws Exception {
		// 로그인 유저 아이디
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("uid");
		noticeVO.setToUid(userId);
		
		return noticeDAO.noticeList(noticeVO);
	}
	
	/* 알림 확인 */
	@Override
	public void noticeRead(int noticeId) throws Exception {
		noticeDAO.noticeRead(noticeId);
	}
	
	/* 유저별 안 읽은 알림 개수 */
	@Override
	public int noticeCnt(String toUid, HttpServletRequest request) throws Exception {
		// 로그인 유저 아이디
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("uid");
		toUid = userId;
		
		return noticeDAO.noticeCnt(toUid);
	}
}
