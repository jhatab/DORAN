package com.project.doran.search.vo;

import org.springframework.stereotype.Component;

@Component("searchVO")
public class SearchVO extends PagingVO {

	private String keyword;	// 검색 단어

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
}
