package com.project.doran.reply.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data // @Getter, @Setter, @RequiredArgsConstructor, @ToString, @EqualsAndHashCode
@Component("replyVO")
public class ReplyVO {

	private int replyId;			// 그룹 식별자
	private int postId;				// 게시물 식별자
	private String uid;				// 게시물 작성자 아이디
	private String replyContent;	// 게시물 내용
	private String repliedDate;		// 게시물 작성일시
	private int isRevised;			// 게시물 수정여부
	private Date revisedDate;		// 게시물 수정일시
	private int isDeleted;			// 게시물 삭제여부
	private Date deletedDate;		// 게시물 삭제일시
	
	/* userTbl에서 가져옴 */
	private String nickname;		// 게시물 작성자 닉네임
	
}
