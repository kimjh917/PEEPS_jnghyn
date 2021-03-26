package com.jnghyn.post.domain;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Post {
	
	private int p_idx;
	private int member_idx;
	private Timestamp p_date;
	private String p_title;
	private String p_content;
	private String p_thumbnail;
	private String p_loc;
	private int p_likes;	// 게시글 좋아요 총 합
	private int likeChk;	// 로그인 회원의 해당 게시글 좋아요 여부
	
	public Date getToDate() {
		return new Date(this.p_date.getTime());
	}
	
	@Override
	public String toString() {
		return "Post [p_idx=" + p_idx + ", member_idx=" + member_idx + ", p_date=" + p_date + ", p_title=" + p_title
				+ ", p_content=" + p_content + ", p_thumbnail=" + p_thumbnail + ", p_loc=" + p_loc + ", p_likes="
				+ p_likes + ", likeChk=" + likeChk + "]";
	}
	
	

}
