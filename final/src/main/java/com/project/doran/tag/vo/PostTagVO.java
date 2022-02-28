package com.project.doran.tag.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data // @Getter, @Setter, @RequiredArgsConstructor, @ToString, @EqualsAndHashCode
@Component("PostTagVO")
public class PostTagVO {
	
	private int postId; // 게시물 식별자
	private int tagId; // 태그 식별자
	
}
