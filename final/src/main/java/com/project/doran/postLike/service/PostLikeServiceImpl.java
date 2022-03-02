package com.project.doran.postLike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.doran.postLike.dao.PostLikeDAO;
import com.project.doran.postLike.vo.PostLikeVO;

@Service("postLikeService")
public class PostLikeServiceImpl implements PostLikeService {
	
	@Autowired
	private PostLikeDAO postLikeDAO;
	
	/* 좋아요 체크 */
	@Override
	public int likeCheck(PostLikeVO postLikeVO) throws Exception {
		int likeCheck = postLikeDAO.likeCheck(postLikeVO);
		
		// 좋아요 추가
		if(likeCheck == 0) {
			return postLikeDAO.likeAdd(postLikeVO);
		}
		// 좋아요 취소
		else {
			return postLikeDAO.likeCancle(postLikeVO);
		}
	}
	
	/* 좋아요 수 업데이트 */
	public void likeCountUpdate(int postId) throws Exception {
		postLikeDAO.likeCountUpdate(postId);
	}

}
