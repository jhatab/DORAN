package com.project.doran.postLike.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data // @Getter, @Setter, @RequiredArgsConstructor, @ToString, @EqualsAndHashCode
@Component("postLikeVO")
public class PostLikeVO {
	
	private int postLikeId;		// 좋아요 식별자
	private int postId;			// 좋아요 게시물 식별자
	private String uid;			// 좋아요 사용자 아이디
	private int likeCheck;		// 좋아요 체크
	
}
