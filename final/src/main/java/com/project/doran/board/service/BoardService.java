package com.project.doran.board.service;

import java.util.List;

import com.project.doran.board.vo.BoardVO;
import com.project.doran.search.vo.SearchCriteriaVO;

public interface BoardService {
	
	public List<BoardVO> listBoard(SearchCriteriaVO scri) throws Exception;
	public int listBoardCount(SearchCriteriaVO scri) throws Exception;
	
	public int insertBoard(BoardVO boardVO) throws Exception;
	public int updateBoard(BoardVO boardVO) throws Exception;
	public int deleteBoard(int postId) throws Exception;

}
