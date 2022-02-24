package com.project.doran.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.doran.attch.vo.AttchVO;
import com.project.doran.post.vo.PostVO;

@Mapper
@Repository("postDAO")
public interface PostDAO {

	/* 게시물 목록 */
	public List<PostVO> postList(int groupId) throws Exception;
	
	/* 게시물 작성 */
	public void postWrite(PostVO postVO) throws Exception;
	
	/* 이미지 파일 목록 */
	public List<AttchVO> postImageList(int groupId) throws Exception;
	
	/* 이미지 파일 등록 */
	public void postImageUpload(AttchVO attchVO) throws Exception;
	
}
