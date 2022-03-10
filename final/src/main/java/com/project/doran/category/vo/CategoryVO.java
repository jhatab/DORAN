package com.project.doran.category.vo;

import lombok.Data;

@Data // @Getter, @Setter, @RequiredArgsConstructor, @ToString, @EqualsAndHashCode
public class CategoryVO {

	private int categoryId;			// 카테고리 식별자
	private String categoryName;	// 카테고리 명칭

}
