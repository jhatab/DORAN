package com.project.doran.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.doran.board.vo.BoardVO;
import com.project.doran.search.vo.SearchCriteriaVO;

@Mapper
@Repository("boardDAO")
public interface BoardDAO {

	public List<BoardVO> listBoard(SearchCriteriaVO scri) throws DataAccessException;
	public int listBoardCount(SearchCriteriaVO scri) throws DataAccessException;
	
	public int insertBoard(BoardVO boardVO) throws DataAccessException;
	public int updateBoard(BoardVO boardVO) throws DataAccessException;
	public int deleteBoard(int postId) throws DataAccessException;
	
}
