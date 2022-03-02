package com.project.doran.tag.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.doran.search.vo.PagingVO;
import com.project.doran.search.vo.SearchCriteriaVO;
import com.project.doran.tag.service.TagService;
import com.project.doran.tag.vo.TagVO;

@Controller("tagController")
@RequestMapping(value = "/tag")
public class TagController {

	@Autowired
	private TagService tagService;

	// 태그 리스트(검색, 페이징)
	@RequestMapping(value = "/tagList", method = RequestMethod.GET)
	public String tagList(@ModelAttribute("scri") SearchCriteriaVO scri, Model model) throws Exception {

		model.addAttribute("tagList", tagService.tagList(scri));

		// 페이징 객체
		PagingVO paging = new PagingVO();
		paging.setCri(scri);
		paging.setTotalCount(tagService.tagListCount(scri));

		model.addAttribute("paging", paging);
		model.addAttribute("tagListCount", tagService.tagListCount(scri));

		return "tag/index";
	}

	// 태그 입력폼
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String tagInsertForm(TagVO tagVO) throws Exception {
		return "tag/insert";
	}

	// 태그 입력
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String tagInsert(TagVO tagVO) throws Exception {
		tagService.tagInsert(tagVO);
		return "redirect:/tagMain";
	}

	// 태그 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String tagDelete(TagVO tagVO) throws Exception {
		tagService.tagDelete(tagVO);
		return "redirect:/tagMain";
	}

}
