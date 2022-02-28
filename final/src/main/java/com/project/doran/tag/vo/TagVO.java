package com.project.doran.tag.vo;

import org.springframework.stereotype.Component;

@Component("tagVO")
public class TagVO {

	private int tagId; // 태그 식별자
	private String tagName; // 태그 명칭
	
	/* postTagTbl에서 가져옴 */
	private int postId;
	
	public TagVO() {
		// TODO Auto-generated constructor stub
	}

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

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}
	
}
