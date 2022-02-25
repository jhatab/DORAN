package com.project.doran.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.doran.reply.vo.ReplyVO;

@Mapper
@Repository("replyDAO")
public interface ReplyDAO {
	
	/* 댓글 목록 */
	public List<ReplyVO> replyList(int groupId) throws Exception;
	
	/* 댓글 작성 */
	public int replyWrite(ReplyVO replyVO) throws Exception;
	
	/* 댓글 수정 */
	public int replyUpdate(ReplyVO replyVO) throws Exception;
	
	/* 댓글 삭제 */
	public int replyDelete(ReplyVO replyVO) throws Exception;
	
	/* 댓글 수 업데이트 */
	public void replyCountUpdate(int postId) throws Exception;

}
