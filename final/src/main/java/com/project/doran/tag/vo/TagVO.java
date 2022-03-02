package com.project.doran.tag.vo;

import lombok.Data;

@Data // @Getter, @Setter, @RequiredArgsConstructor, @ToString, @EqualsAndHashCode
public class TagVO {

	private int tagId; // 태그 식별자
	private String tagName; // 태그 명칭

	/* PostVO */
	private int postId; // 게시물 식별자

}
