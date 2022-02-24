package com.project.doran.attch.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data // @Getter, @Setter, @RequiredArgsConstructor, @ToString, @EqualsAndHashCode
@Component("attchVO")
public class AttchVO {
	
	private int attchId;			// 파일 식별자
	private int postId;				// 게시물 식별자
	private String srvFileName;		// 서버 파일명
	private String localFileName;	// 원본 파일명
	private String filePath;		// 파일 경로

}
