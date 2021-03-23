package com.jnghyn.post.domain;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Reply {

	private int re_idx;
	private int comment_idx;
	private int member_idx;
	private String re_content;
	private Timestamp re_date;

	public Date getToDate() {
		
		return new Date(this.re_date.getTime());
	}
	
	@Override
	public String toString() {
		return "Reply [re_idx=" + re_idx + ", comment_idx=" + comment_idx + ", member_idx=" + member_idx
				+ ", re_content=" + re_content + ", re_date=" + re_date + "]";
	}

}
