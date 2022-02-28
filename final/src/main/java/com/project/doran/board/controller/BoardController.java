package com.project.doran.board.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.doran.board.service.BoardService;
import com.project.doran.board.vo.BoardVO;
import com.project.doran.search.vo.PagingVO;
import com.project.doran.search.vo.SearchCriteriaVO;

@Controller("boardController")
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/listBoard", method = RequestMethod.GET)
	public String tagList(@ModelAttribute("scri") SearchCriteriaVO scri, Model model) throws Exception {

		model.addAttribute("listBoard", boardService.listBoard(scri));

		// 페이징 객체
		PagingVO paging = new PagingVO();
		paging.setCri(scri);
		paging.setTotalCount(boardService.listBoardCount(scri));

		model.addAttribute("paging", paging);
		model.addAttribute("listBoardCount", boardService.listBoardCount(scri));

		return "board/list";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeForm() throws Exception {
		return "board/writeForm";
	}

	/*	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertBoard(BoardVO boardVO, HttpServletResponse resp, HttpSession session) throws Exception {
		String uid = (String) session.getAttribute("uid");
		boardVO.setUid(uid);
		int result = boardService.insertBoard(boardVO);
		String pageURL = "/board/listBoard";
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = resp.getWriter();
		if (result >= 1) {
			writer.println("<script>alert('게시글이 등록 되었습니다.');");
			writer.println("location.href='" + pageURL + "';</script>");
			writer.flush();
			writer.close();
		} else {
			writer.println("<script>alert('게시글이 등록에 실패했습니다. 다시 시도해주세요.');");
			writer.println("history.back();</script>");
			writer.flush();
			writer.close();
		}
		return "board/list";
	}*/
	
	
	

}
