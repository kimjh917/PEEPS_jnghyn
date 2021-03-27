package com.jnghyn.peeps.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnghyn.peeps.dao.MemberDao;
import com.jnghyn.peeps.domain.Peeps;

@Service
public class FindMemberService {
	
	private MemberDao dao;
	
	@Autowired
	private SqlSessionTemplate template;

	public List<Peeps> getMemberList() {
		
		List<Peeps> midList = null;
		dao = template.getMapper(MemberDao.class);
		midList = dao.selectMemberlist();

		return midList;
	}

	public Peeps getMemberInfo(int mIdx) {
		
		Peeps peeps = null;
		dao = template.getMapper(MemberDao.class);
		peeps = dao.selectMemberInfo(mIdx);

		return peeps;
	}

	public Peeps getMbrInfo(String mId) {
		Peeps peeps = null;
		dao = template.getMapper(MemberDao.class);
		peeps = dao.selectMbrInfo(mId);
		
		return peeps;
	}


	
	

}
