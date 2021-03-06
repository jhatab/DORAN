package com.project.doran.group.vo;

import java.sql.Date;

import lombok.Data;

@Data // @Getter, @Setter, @RequiredArgsConstructor, @ToString, @EqualsAndHashCode
public class GroupVO {
	
	// category
	private int categoryId;			// 카테고리 식별자
	
	// group
	private int groupId;			// 그룹 식별자
	private String groupName;		// 그룹 이름
	private String groupIntro;		// 그룹 소개글
	private String groupImagePath;	// 그룹 이미지 파일 경로
	private String uid;				// 그룹 생성자
	private Date createdDate;		// 그룹 생성일
	private boolean isRevised;		// 그룹 수정여부
	private Date revisedDate;		// 그룹 수정일
	private boolean isDeleted;		// 그룹 삭제여부
	private Date deletedDate;		// 그룹 삭제일
	
	/* userGroupMappingTbl */
	private String joinDate;	// 그룹 가입일
	private int isApproval;		// 그룹 가입 승인 여부 (0-승인X, 1-승인O, 2-생성자)
	
	/* userTbl */
	private String nickname;	// 닉네임
	private String profileImg;	// 프로필 이미지
	
	private int postCnt;		// 유저별 게시물 수
	private int replyCnt;		// 유저별 댓글 수
	
	/* 검색 */
	private String search;
	
}
