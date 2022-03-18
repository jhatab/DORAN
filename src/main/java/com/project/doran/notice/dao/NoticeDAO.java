package com.project.doran.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.doran.notice.vo.NoticeVO;

@Mapper
@Repository("noticeDAO")
public interface NoticeDAO {

	/* 알림 추가 */
	public void noticeAdd(NoticeVO noticeVO) throws Exception;
	
	/* 알림 목록 */
	public List<NoticeVO> noticeList(NoticeVO noticeVO) throws Exception;
	
	/* 알림 확인 */
	public void noticeRead(int noticeId) throws Exception;
	
	/* 유저별 안 읽은 알림 개수 */
	public int noticeCnt(String toUid) throws Exception;
	
}
