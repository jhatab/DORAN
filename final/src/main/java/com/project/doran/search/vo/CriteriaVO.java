package com.project.doran.search.vo;

import org.springframework.stereotype.Component;

@Component("criteriaVO")
public class CriteriaVO {

	private int page; 			// 현재 페이지 번호
	private int perPageNum; 	// 페이지당 보여줄 게시글 수

	public CriteriaVO() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public int getPageStart() {	// 특정 페이지의 범위를 정하는 구간, 현재 페이지의 게시글 시작 번호
		return (this.page - 1) * perPageNum;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}

	public int getPerPageNum() {// 페이지 당 보여줄 게시글의 개수
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		int cnt = this.perPageNum;

		if (perPageNum != cnt) {
			this.perPageNum = cnt;
		} else {
			this.perPageNum = perPageNum;
		}
	}

	@Override
	public String toString() {
		return "CriteriaVO [page=" + page + ", perPageNum=" + perPageNum + "]";
	}

}
