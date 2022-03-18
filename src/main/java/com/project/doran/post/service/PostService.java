package com.project.doran.post.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.project.doran.attch.vo.AttchVO;
import com.project.doran.post.vo.PostVO;

public interface PostService {
	
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
	
	/* 게시물 작성 + 이미지 파일 등록 */
	public void postWrite(PostVO postVO, AttchVO attchVO, List<MultipartFile> files) throws Exception;
	
	/* 게시물 수정 */
	public void postUpdate(PostVO postVO) throws Exception;
	
	/* 게시물 삭제 */
	public void postDelete(PostVO postVO) throws Exception;
	
	/* 인기 게시물 목록 */
	public List<PostVO> hotPostList(int groupId) throws Exception;
	
}
