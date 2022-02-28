package com.project.doran.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.doran.attch.vo.AttchVO;
import com.project.doran.post.vo.PostVO;
import com.project.doran.tag.vo.PostTagVO;
import com.project.doran.tag.vo.TagVO;

@Mapper
@Repository("postDAO")
public interface PostDAO {
	
	/* 게시물 목록 */
	public List<PostVO> postList(PostVO postVO) throws Exception;
	
	/* 이미지 파일 목록 */
	public List<AttchVO> postImageList(int groupId) throws Exception;
	
	/* 태그 목록 */
	public List<TagVO> tagList(int groupId) throws Exception;
	
	/* 게시물 작성 */
	public void postWrite(PostVO postVO) throws Exception;
	
	/* 이미지 파일 등록 */
	public void postImageUpload(AttchVO attchVO) throws Exception;
	
	/* 태그 등록 */
	public void tagUpload(TagVO tagVO) throws Exception;
	
	/* 게시물-태그 매핑 */
	public void postTagMapping(PostTagVO postTagVO) throws Exception;
	
	/* 태그 중복 체크 */
	public Integer tagCheck(TagVO tagVO) throws Exception;
	
	/* 게시물 수정 */
	public void postUpdate(PostVO postVO) throws Exception;
	
	/* 게시물 삭제 */
	public void postDelete(PostVO postVO) throws Exception;
	
	/* 인기 게시물 목록 */
	public List<PostVO> hotPostList(int groupId) throws Exception;
	
}
