package com.project.doran.group.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data // @Getter, @Setter, @RequiredArgsConstructor, @ToString, @EqualsAndHashCode
@Component("groupVO")
public class GroupVO {
	
	// category
	private int categoryId;
	
	// group
	private int groupId;
	private String groupName;
	
}
