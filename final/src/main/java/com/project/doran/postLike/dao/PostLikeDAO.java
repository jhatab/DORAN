package com.project.doran.postLike.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.doran.postLike.vo.PostLikeVO;

@Mapper
@Repository("postLikeDAO")
public interface PostLikeDAO {
	
	/* 좋아요 추가 */
	public int likeAdd(PostLikeVO postLikeVO) throws Exception;
	
	/* 좋아요 취소 */
	public int likeCancle(PostLikeVO postLikeVO) throws Exception;
	
}
