package com.jnghyn.post.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnghyn.post.dao.PostDao;

@Service
public class PostDeleteService {
	
	private PostDao dao;
	
	@Autowired
	private SqlSessionTemplate template;

	public int deletePost(int pidx) {
		
		dao = template.getMapper(PostDao.class);
		
		return dao.deletePostByIdx(pidx);
	}
	
}
