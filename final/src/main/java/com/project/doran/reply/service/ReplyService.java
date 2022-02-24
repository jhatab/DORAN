package com.project.doran.reply.service;

import java.util.List;

import com.project.doran.reply.vo.ReplyVO;

public interface ReplyService {

	/* 댓글 목록 */
	public List<ReplyVO> replyList(int groupId) throws Exception;
	
	/* 댓글 작성 */
	public int replyWrite(ReplyVO replyVO) throws Exception;
	
	/* 댓글 수정 */
	public int replyUpdate(ReplyVO replyVO) throws Exception;
	
	/* 댓글 삭제 */
	public int replyDelete(ReplyVO replyVO) throws Exception;
	
}
