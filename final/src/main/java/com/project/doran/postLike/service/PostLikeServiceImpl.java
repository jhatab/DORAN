package com.project.doran.postLike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.doran.postLike.dao.PostLikeDAO;
import com.project.doran.postLike.vo.PostLikeVO;

@Service("postLikeService")
public class PostLikeServiceImpl implements PostLikeService {
	
	@Autowired
	private PostLikeDAO postLikeDAO;

	/* 좋아요 추가 */
	@Override
	public int likeAdd(PostLikeVO postLikeVO) throws Exception {
		return postLikeDAO.likeAdd(postLikeVO);
	}

	/* 좋아요 취소 */
	@Override
	public int likeCancle(PostLikeVO postLikeVO) throws Exception {
		return postLikeDAO.likeCancle(postLikeVO);
	}

}
