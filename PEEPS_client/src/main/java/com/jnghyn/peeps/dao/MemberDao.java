package com.jnghyn.peeps.dao;

import java.util.List;

import com.jnghyn.peeps.domain.Peeps;

public interface MemberDao {
	
	// 전체 회원정보 조회
	List<Peeps> selectMemberlist();

	// 특정 회원정보 조회
	Peeps selectMemberInfo(int m_idx);
}
