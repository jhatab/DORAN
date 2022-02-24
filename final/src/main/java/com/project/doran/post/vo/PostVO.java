package com.project.doran.post.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data // @Getter, @Setter, @RequiredArgsConstructor, @ToString, @EqualsAndHashCode
@Component("postVO")
public class PostVO {
	
	private int groupId;		// 그룹 식별자
	private int postId;			// 게시물 식별자
	private String uid;			// 게시물 작성자 아이디
	private String content;		// 게시물 내용
	private String postedDate;	// 게시물 작성일시
	private int isRevised;		// 게시물 수정여부
	private Date revisedDate;	// 게시물 수정일시
	private int isDeleted;		// 게시물 삭제여부
	private Date deletedDate;	// 게시물 삭제일시
	private int openness;		// 게시물 공개수준 (0-전체 1-회원 2-그룹 3-자신)
	private int likeCount;		// 게시물 좋아요 수

	/* userTbl에서 가져옴 */
	private String nickname; // 게시물 작성자 닉네임

}
