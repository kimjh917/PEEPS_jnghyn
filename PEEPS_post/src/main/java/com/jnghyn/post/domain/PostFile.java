package com.jnghyn.post.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PostFile {
	
	private int f_idx;
	private String f_name;
	private String f_path;
	private String f_type;
	private String f_size;
	private int post_idx;
	
	@Override
	public String toString() {
		return "File [f_idx=" + f_idx + ", f_name=" + f_name + ", f_path=" + f_path + ", f_type=" + f_type + ", f_size="
				+ f_size + ", post_idx=" + post_idx + "]";
	}
	
	
	
	
	

}
