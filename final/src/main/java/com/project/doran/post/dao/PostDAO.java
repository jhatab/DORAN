package com.project.doran.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.doran.attch.vo.AttchVO;
import com.project.doran.post.vo.PostVO;

@Mapper
@Repository("postDAO")
public interface PostDAO {
	
	/* 메인 게시물 목록 */
	public List<PostVO> mainPostList() throws Exception;
	
	/* 게시물 목록 */
	public List<PostVO> postList(PostVO postVO) throws Exception;
	
	/* 메인 이미지 파일 목록 */
	public List<AttchVO> mainPostImageList() throws Exception;
	
	/* 이미지 파일 목록 */
	public List<AttchVO> postImageList(int groupId) throws Exception;
	
	/* 태그 목록 */
	public List<PostVO> tagList(int groupId) throws Exception;
	
	/* 게시물 작성 */
	public void postWrite(PostVO postVO) throws Exception;
	
	/* 이미지 파일 등록 */
	public void postImageUpload(AttchVO attchVO) throws Exception;
	
	/* 게시물 수정 */
	public void postUpdate(PostVO postVO) throws Exception;
	
	/* 게시물 삭제 */
	public void postDelete(PostVO postVO) throws Exception;
	
	/* 인기 게시물 목록 */
	public List<PostVO> hotPostList(int groupId) throws Exception;
	
}
