package com.project.doran.user.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data // @Getter, @Setter, @RequiredArgsConstructor, @ToString, @EqualsAndHashCode
@Component("userVO")
public class UserVO {
	
	// user
	private String uid;				// 계정 아이디
	private String upass;			// 계정 암호
	private String name;			// 회원 성명
	private Date birthDate;			// 회원 생년월일
	private int gender;				// 회원 성별: 0-선택 안 함, 1-여성, 2-남성
	private String nickname;		// 계정 닉네임
	private String email;			// 계정 이메일 주소
	private String address;			// 회원 거주지 주소
	private int authority;			// 0-회원, 1-관리자
	
	// postTbl(게시물 테이블)
	private String content;			// 게시물 내용
	private Date postedDate;		// 작성일시
	
	// categoryTbl(카테고리 테이블)
	private String categoryName;	// 카테고리 명칭
	
	// tagTbl(태그 테이블)
	private String tagName;			// 태그 명칭

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUpass() {
		return upass;
	}

	public void setUpass(String upass) {
		this.upass = upass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPostedDate() {
		return postedDate;
	}

	public void setPostedDate(Date postedDate) {
		this.postedDate = postedDate;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	
	
	
}
