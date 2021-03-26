package com.jnghyn.post.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnghyn.post.dao.CommentDao;
import com.jnghyn.post.dao.PostDao;
import com.jnghyn.post.domain.Comment;
import com.jnghyn.post.domain.CommentListView;
import com.jnghyn.post.domain.CommentRequest;
import com.jnghyn.post.domain.Post;

@Service
public class CommentService {

	private CommentDao dao;
	private PostDao pDao;

	@Autowired
	private SqlSessionTemplate template;

	// 댓글 조회
	// 인덱스로 아이디 검사해서 list.add
	public CommentListView cmtSelect(int post_idx) {
		
		dao = template.getMapper(CommentDao.class);
		
		List<Comment> cmtList = dao.selectCmtList(post_idx);
		
		pDao = template.getMapper(PostDao.class);
		
		Post post = pDao.selectPostDetail(post_idx);
		
		int allReplyCnt = dao.countAllReply(post_idx);
		int allCmtCnt = dao.countAllCmt(post_idx);
		int allCandR = allReplyCnt + allCmtCnt;
				
 		CommentListView clistView = new CommentListView(cmtList, post, allCandR);
		
		return clistView;
	}

	// 댓글 작성
	public int cmtInsert(CommentRequest request) {

		dao = template.getMapper(CommentDao.class);
		int result = 0;
		Comment comment = request.GetCmt();
		result = dao.insertCmt(comment);
		
		return result;
	}

	// 댓글 수정
	public int cmtEdit(int cmt_idx, String cmt_content) {

		dao = template.getMapper(CommentDao.class);
		int result = 0;
		result = dao.updateCmt(cmt_idx, cmt_content);
		
		return result;
	}

	// 댓글 삭제
	public int cmtDel(int cmt_idx) {

		dao = template.getMapper(CommentDao.class);
		int result = 0;
		result = dao.deleteCmt(cmt_idx);

		return result;
	}

	// 댓글 수 조회
	public int CountCmt(int post_idx) {

		dao = template.getMapper(CommentDao.class);
		int result = 0;
		result = dao.CountCmt(post_idx);

		return result;
	}

}
