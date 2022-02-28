package com.project.doran.board.vo;

import java.sql.Date;
import java.time.LocalDateTime;

import org.springframework.stereotype.Component;

@Component("boardVO")
public class BoardVO {

	private int postId;
	private String uid;
	private LocalDateTime postedDate;
	private boolean isRevised;
	private LocalDateTime revisedDate;
	private boolean isDeleted;
	private LocalDateTime deletedDate;
	private int openness;
	private int viewCount;
	private int likeCount;

	public BoardVO() {
		postedDate = LocalDateTime.now();
		revisedDate = LocalDateTime.now();
	}

	public BoardVO(LocalDateTime postedDate, LocalDateTime revisedDate) {
		this.postedDate = postedDate;
		this.revisedDate = revisedDate;
	}



}
