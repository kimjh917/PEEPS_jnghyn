package com.jnghyn.post.domain;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PostEditRequest {
	
	private int userIdx;	// 회원idx
	private int postIdx;	// 게시글idx
	private String ptitle;	// 게시글 제목
	private String pcontent;	// 게시글 내용
	private String ploc;	// 게시글 위치정보
	private MultipartFile postformfile[];	// 게시글 이미지
	private String deleteImage[];  // 삭제할 기존 이미지
	private String oldImage[]; // 기존 원본 이미지 
	
	// editRequest -> post
	public Post toPost() {
		Post post = new Post();
		post.setMember_idx(userIdx);
		post.setP_idx(postIdx);
		post.setP_title(ptitle);
		post.setP_content(pcontent);
		post.setP_loc(ploc);
		
		return post;
	}
	
	@Override
	public String toString() {
		return "PostEditRequest [userIdx=" + userIdx + ", postIdx=" + postIdx + ", ptitle=" + ptitle + ", pcontent="
				+ pcontent + ", ploc=" + ploc + ", postformfile=" + Arrays.toString(postformfile) + ", deleteImage="
				+ Arrays.toString(deleteImage) + "]";
	}
	
	

}
