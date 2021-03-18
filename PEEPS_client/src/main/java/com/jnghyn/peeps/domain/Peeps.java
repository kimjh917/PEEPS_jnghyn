package com.jnghyn.peeps.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Peeps {

	private int m_idx;
	private String name;
	private String id;
	private String m_photo;
	private String bio;

	public Peeps(int m_idx, String name, String id, String m_photo, String bio) {
		this.m_idx = m_idx;
		this.name = name;
		this.id = id;
		this.m_photo = m_photo;
		this.bio = bio;
	}

	@Override
	public String toString() {
		return "Peeps [m_idx=" + m_idx + ", name=" + name + ", id=" + id + ", m_photo=" + m_photo + ", bio=" + bio
				+ "]";
	}
	
}
