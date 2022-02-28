package com.project.doran.postLike.service;

import com.project.doran.postLike.vo.PostLikeVO;

public interface PostLikeService {

	/* 좋아요 추가 */
	public int likeAdd(PostLikeVO postLikeVO) throws Exception;
	
	/* 좋아요 취소 */
	public int likeCancle(PostLikeVO postLikeVO) throws Exception;
	
}
