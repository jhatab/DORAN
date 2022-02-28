package com.project.doran.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.doran.board.dao.BoardDAO;
import com.project.doran.board.vo.BoardVO;
import com.project.doran.search.vo.SearchCriteriaVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<BoardVO> listBoard(SearchCriteriaVO scri) throws Exception {
		return boardDAO.listBoard(scri);
	}
	
	@Override
	public int listBoardCount(SearchCriteriaVO scri) throws Exception {
		return boardDAO.listBoardCount(scri);
	}

	@Override
	public int insertBoard(BoardVO boardVO) throws Exception {
		return boardDAO.insertBoard(boardVO);
	}

	@Override
	public int updateBoard(BoardVO boardVO) throws Exception {
		return boardDAO.updateBoard(boardVO);
	}

	@Override
	public int deleteBoard(int postId) throws Exception {
		return boardDAO.deleteBoard(postId);
	}

	
}
