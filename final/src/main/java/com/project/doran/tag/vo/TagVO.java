package com.project.doran.tag.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component("tagVO")
public class TagVO {

	private int tagId; // 태그 식별자
	private String tagName; // 태그 명칭

	// 검색 필터
	private String keyword;

	public int getTagId() {
		return tagId;
	}

	public void setTagId(int tagId) {
		this.tagId = tagId;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
