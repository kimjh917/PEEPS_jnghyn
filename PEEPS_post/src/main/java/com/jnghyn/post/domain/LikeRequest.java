package com.jnghyn.post.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LikeRequest {

   private int m_idx;
   private String id;
   private String m_photo;
   
	@Override
	public String toString() {
		return "LikeRequest [m_idx=" + m_idx + ", id=" + id + ", m_photo=" + m_photo + "]";
	}


}
