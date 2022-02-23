package com.project.doran.tag.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.doran.category.vo.CategoryVO;
import com.project.doran.tag.service.TagService;
import com.project.doran.tag.vo.TagVO;

@Controller("tagController")
@RequestMapping(value = "/tag")
public class TagController {
	
	@Autowired
	private TagService tagService;
	
	// 태그
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String tagInsertForm(CategoryVO categoryVO) throws Exception {
		return "tag/insert";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String tagInsert(TagVO tagVO) throws Exception {
		tagService.tagInsert(tagVO);
		return "redirect:/tagMain";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String tagDelete(TagVO tagVO) throws Exception {
		tagService.tagDelete(tagVO);
		return "redirect:/tagMain";
	}
	
}
