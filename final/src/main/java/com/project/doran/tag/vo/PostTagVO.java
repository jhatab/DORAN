package com.project.doran.tag.vo;

import lombok.Data;

@Data // @Getter, @Setter, @RequiredArgsConstructor, @ToString, @EqualsAndHashCode
public class PostTagVO {

	// 게시물 식별자
	private int postId; 

	// 태그 식별자
	private int tagId; 

}