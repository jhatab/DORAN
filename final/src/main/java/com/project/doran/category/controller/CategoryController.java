package com.project.doran.category.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.doran.category.service.CategoryService;
import com.project.doran.category.vo.CategoryVO;

@Controller("categoryController")
@RequestMapping(value = "/category")
public class CategoryController {

	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);

	@Autowired
	private CategoryService categoryService;

	/* 카테고리 목록 페이지 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void categoryListGET(Model model) throws Exception {
		logger.info("카테고리 목록 페이지입니다.");

		model.addAttribute("categoryList", categoryService.categoryList());
	}

	/* 카테고리 생성 페이지 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String categoryCreateGET(CategoryVO categoryVO) throws Exception {
		logger.info("카테고리 생성 페이지입니다.");

		return "category/create";
	}

	/* 카테고리 생성 */
	@RequestMapping(value = "/create.do", method = RequestMethod.POST)
	public String categoryCreatePost(CategoryVO categoryVO, RedirectAttributes rttr) throws Exception {
		logger.info("카테고리 생성");

		categoryService.categoryInsert(categoryVO);

		rttr.addFlashAttribute("result", "category create success");

		return "redirect:/category/list";
	}

	/* 카테고리 생성 페이지 */
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String categoryRemoveGET(CategoryVO categoryVO) throws Exception {
		logger.info("카테고리 삭제 페이지입니다.");

		return "category/remove";
	}

	/* 카테고리 삭제 */
	@RequestMapping(value = "/remove.do")
	public String categoryRemovePost(int categoryId, RedirectAttributes rttr) throws Exception {
		logger.info("카테고리 삭제");

		categoryService.categoryRemove(categoryId);

		rttr.addFlashAttribute("result", "category delete success");

		return "redirect:/category/list";
	}
}