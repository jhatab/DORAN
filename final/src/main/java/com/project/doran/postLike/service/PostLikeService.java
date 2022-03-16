package com.project.doran.postLike.service;

import com.project.doran.notice.vo.NoticeVO;
import com.project.doran.postLike.vo.PostLikeVO;

public interface PostLikeService {

	/* 좋아요 체크 */
	public int likeCheck(PostLikeVO postLikeVO, NoticeVO noticeVO) throws Exception;
	
	/* 좋아요 수 업데이트 */
	public void likeCountUpdate(int postId) throws Exception;
	
}
