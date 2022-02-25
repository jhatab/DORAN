package com.project.doran.tag.vo;

import org.springframework.stereotype.Component;

@Component("tagVO")
public class TagVO {

	private int tagId; // 태그 식별자
	private String tagName; // 태그 명칭

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

}
