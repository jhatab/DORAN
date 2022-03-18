package com.project.doran.reply.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data // @Getter, @Setter, @RequiredArgsConstructor, @ToString, @EqualsAndHashCode
@Component("replyVO")
public class ReplyVO {

	private int replyId;			// 그룹 식별자
	
	/* postTbl */
	private int postId;				// 게시물 식별자
	
	/* userTbl */
	private String uid;				// 댓글 작성자 아이디
	private String replyContent;	// 댓글 내용
	private String repliedDate;		// 댓글 작성일시
	private int isRevised;			// 댓글 수정여부
	private Date revisedDate;		// 댓글 수정일시
	private int isDeleted;			// 댓글 삭제여부
	private Date deletedDate;		// 댓글 삭제일시
	
	/* userTbl에서 가져옴 */
	private String nickname;		// 댓글 작성자 닉네임
	private String profileImg;		// 댓글 작성자 프로필사진
	
}
