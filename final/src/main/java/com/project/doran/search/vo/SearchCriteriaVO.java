package com.project.doran.search.vo;

import org.springframework.stereotype.Component;

@Component("searchCriteriaVO")
public class SearchCriteriaVO extends CriteriaVO {

	private String keyword; // 검색 필터
	
	public SearchCriteriaVO() {
		
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	

	
}
