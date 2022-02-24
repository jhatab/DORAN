package com.project.doran.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.doran.reply.dao.ReplyDAO;
import com.project.doran.reply.vo.ReplyVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO replyDAO;

	/* 댓글 목록 */
	@Override
	public List<ReplyVO> replyList(int groupId) throws Exception {
		return replyDAO.replyList(groupId);
	}

	/* 댓글 작성 */
	@Override
	public int replyWrite(ReplyVO replyVO) throws Exception {
		return replyDAO.replyWrite(replyVO);
	}

	/* 댓글 수정 */
	@Override
	public int replyUpdate(ReplyVO replyVO) throws Exception {
		return replyDAO.replyUpdate(replyVO);
	}

	/* 댓글 삭제 */
	@Override
	public int replyDelete(ReplyVO replyVO) throws Exception {
		return replyDAO.replyDelete(replyVO);
	}
	
}
