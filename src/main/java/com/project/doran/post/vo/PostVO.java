package com.project.doran.post.vo;

import java.sql.Date;

import lombok.Data;

@Data // @Getter, @Setter, @RequiredArgsConstructor, @ToString, @EqualsAndHashCode
public class PostVO {

	private int groupId; // 그룹 식별자
	private int postId; // 게시물 식별자
	private String uid; // 게시물 작성자 아이디
	private String content; // 게시물 내용
	private String tag; // 게시물 태그
	private String postedDate; // 게시물 작성일시
	private int isRevised; // 게시물 수정여부
	private Date revisedDate; // 게시물 수정일시
	private int isDeleted; // 게시물 삭제여부
	private Date deletedDate; // 게시물 삭제일시
	private int openness; // 게시물 공개수준 (0-전체 1-회원 2-그룹 3-자신)
	private int likeCount; // 게시물 좋아요 수
	private int replyCount; // 게시물 댓글 수

	/* UserVO */
	private String nickname; // 게시물 작성자 닉네임
	private String profileImg; // 게시물 작성자 프로필사진

	/* SearchCriteriaVO */
	private String keyword; // 검색 키워드
	private String search; // 전체 검색 키워드

	// category
	private int categoryId;			// 카테고리 식별자
	private String categoryName;	// 카테고리 명칭

	// group
	private String groupName; // 그룹 이름
	private String groupIntro; // 그룹 소개글
	private String groupImagePath; // 그룹 이미지 파일 경로
	private Date createdDate; // 그룹 생성일

}