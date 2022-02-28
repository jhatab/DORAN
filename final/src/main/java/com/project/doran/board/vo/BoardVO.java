package com.project.doran.board.vo;

import java.sql.Date;

import lombok.Data;

@Data // @Getter, @Setter, @RequiredArgsConstructor, @ToString, @EqualsAndHashCode
public class BoardVO {

	private int postId;
	private String uid;
	private Date postedDate;
	private boolean isRevised;
	private Date revisedDate;
	private boolean isDeleted;
	private Date deletedDate;
	private int openness;
	private int viewCount;
	private int likeCount;

}
