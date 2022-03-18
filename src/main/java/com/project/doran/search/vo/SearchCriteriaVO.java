package com.project.doran.search.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data // @Getter, @Setter, @RequiredArgsConstructor, @ToString, @EqualsAndHashCode
@Component("searchCriteriaVO")
public class SearchCriteriaVO extends CriteriaVO {

	private String keyword = ""; // 검색 필터

}
