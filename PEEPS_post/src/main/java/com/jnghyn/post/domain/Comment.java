package com.jnghyn.post.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Comment {

	private int cmt_idx;
	private int post_idx;
	private int member_idx;
	private Timestamp cmt_date;
	private String cmt_content;
	private int postmemberidx;
	
	@Override
	public String toString() {
		return "Comment [cmt_idx=" + cmt_idx + ", post_idx=" + post_idx + ", member_idx=" + member_idx + ", cmt_date="
				+ cmt_date + ", cmt_content=" + cmt_content + "]";
	}

}
