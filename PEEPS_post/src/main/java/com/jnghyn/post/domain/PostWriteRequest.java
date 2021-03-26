package com.jnghyn.post.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PostWriteRequest {
	
	private int userIdx;	// 회원 idx
	private String ptitle;	// 게시글 제목
	private String pcontent;	// 게시글 내용
	private String ploc;	// 게시글 위치정보
	private String pthumbnail; // 썸네일
	private MultipartFile postformfile[];	// 게시글 이미지
	
	// 게시글 저장 
	public Post toPost() {
		Post post = new Post();
		post.setMember_idx(userIdx);
		post.setP_title(ptitle);
		post.setP_content(pcontent);
		post.setP_loc(ploc);
		return post;
	}


}
