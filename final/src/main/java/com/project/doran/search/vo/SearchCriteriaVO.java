package com.project.doran.search.vo;

import org.springframework.stereotype.Component;

@Component("searchCriteriaVO")
public class SearchCriteriaVO extends CriteriaVO {

	// 검색 필터
	private String keyword = "";

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchCriteriaVO [keyword=" + keyword + "]";
	}
	
	
}
