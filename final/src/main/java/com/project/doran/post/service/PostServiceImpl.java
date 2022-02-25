package com.project.doran.post.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.doran.attch.vo.AttchVO;
import com.project.doran.post.dao.PostDAO;
import com.project.doran.post.vo.PostVO;

@Service("postService")
public class PostServiceImpl implements PostService {

	@Autowired
	private PostDAO postDAO;
	
	/* 게시물 목록 */
	@Override
	public List<PostVO> postList(int groupId) throws Exception {
		return postDAO.postList(groupId);
	}
	
	/* 게시물 작성 + 이미지 파일 등록 */
	@Override
	public void postWrite(PostVO postVO, AttchVO attchVO, List<MultipartFile> files) throws Exception {
		postDAO.postWrite(postVO);
		
		// 이미지 파일 등록
		String filePath = System.getProperty("user.dir") + "\\\\src\\\\main\\\\webapp\\\\resources\\\\post_image_file";


		for(MultipartFile file : files) {
			
			if(!file.isEmpty()){
				UUID uuid = UUID.randomUUID();
				String fileName = uuid + "_" + file.getOriginalFilename();
				
				File saveFile = new File(filePath, fileName);
				
				file.transferTo(saveFile);
				
				attchVO.setSrvFileName(fileName);
				attchVO.setLocalFileName(file.getOriginalFilename());
				attchVO.setFilePath("/post_image_file/" + fileName);
				attchVO.setPostId(postVO.getPostId());
				
				postDAO.postImageUpload(attchVO);
			}
		}
	}
	
	/* 이미지 파일 목록*/
	@Override
	public List<AttchVO> postImageList(int groupId) throws Exception {
		return postDAO.postImageList(groupId);
	}
	
	/* 게시물 수정 */
	@Override
	public void postUpdate(PostVO postVO) throws Exception {
		postDAO.postUpdate(postVO);
	}
	
	/* 게시물 삭제 */
	@Override
	public void postDelete(PostVO postVO) throws Exception {
		postDAO.postDelete(postVO);
	}

}