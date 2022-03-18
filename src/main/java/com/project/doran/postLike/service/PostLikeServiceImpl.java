package com.project.doran.postLike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.doran.notice.dao.NoticeDAO;
import com.project.doran.notice.vo.NoticeVO;
import com.project.doran.postLike.dao.PostLikeDAO;
import com.project.doran.postLike.vo.PostLikeVO;

@Service("postLikeService")
public class PostLikeServiceImpl implements PostLikeService {
	
	@Autowired
	private PostLikeDAO postLikeDAO;
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	/* 좋아요 체크 */
	@Override
	public int likeCheck(PostLikeVO postLikeVO, NoticeVO noticeVO) throws Exception {
		int likeCheck = postLikeDAO.likeCheck(postLikeVO);
		
		if(likeCheck == 0) {
			// 알림 추가
			noticeDAO.noticeAdd(noticeVO);
			
			// 좋아요 추가
			return postLikeDAO.likeAdd(postLikeVO);
		}
		else {
			// 좋아요 취소
			return postLikeDAO.likeCancle(postLikeVO);
		}
	}
	
	/* 좋아요 수 업데이트 */
	public void likeCountUpdate(int postId) throws Exception {
		postLikeDAO.likeCountUpdate(postId);
	}

}
