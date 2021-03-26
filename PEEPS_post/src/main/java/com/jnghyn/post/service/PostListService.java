package com.jnghyn.post.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnghyn.post.dao.FileDao;
import com.jnghyn.post.dao.LikeDao;
import com.jnghyn.post.dao.PostDao;
import com.jnghyn.post.domain.Post;
import com.jnghyn.post.domain.PostFile;
import com.jnghyn.post.domain.PostListView;

@Service
public class PostListService {

	private PostDao dao;
	private FileDao fDao;
	private LikeDao lDao;

	@Autowired
	private SqlSessionTemplate template;

	// 게시글 전체 리스트 불러오기
	public PostListView getPostListView(int pageNumber, int mIdx) {

		PostListView listView = null;

		try {
			// PostDao 구현체 생성
			dao = template.getMapper(PostDao.class);

			int cntPerPage = 9;

			int startRow = (pageNumber - 1) * cntPerPage;
			int endRow = startRow + cntPerPage - 1;

			int totalPostCount = dao.selectTotalPostCount(mIdx);

			List<Post> postList = dao.selectPostList(mIdx, startRow, cntPerPage);

			listView = new PostListView(pageNumber, totalPostCount, cntPerPage, postList, startRow, endRow);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return listView;
	}

	// 게시글 하나 내용 불러오기
	public Post getDetail(int idx) {

		dao = template.getMapper(PostDao.class);

		return dao.selectPostDetail(idx);
	}

	// 게시글 하나 이미지 불러오기
	public List<PostFile> getDetailImgs(int idx) {
		fDao = template.getMapper(FileDao.class);
		return fDao.selectPostImgs(idx);
	}

	// 위치 가져오기
	public List<Post> getMapListView(int mIdx) {

		List<Post> postList = null;

		try {
			dao = template.getMapper(PostDao.class);

			postList = dao.selectPostMapList(mIdx);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return postList;
	}

	// 주소로 게시글 가져오기
	public List<Post> getPostListByMapView(int mIdx, String pAddr) {

		List<Post> postList = null;

		try {
			// PostDao 구현체 생성
			dao = template.getMapper(PostDao.class);

			postList = dao.selectPostByAddrList(pAddr, mIdx);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return postList;
	}

	// 좋아요 여부
	public Post getLikes(int pIdx, HttpServletRequest request) {

		int mIdx = Integer.parseInt(request.getParameter("mIdx"));

		Post post = null;

		try {
			// 해당 게시글 정보 post에 바인딩
			dao = template.getMapper(PostDao.class);
			post = dao.selectPostDetail(pIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			lDao = template.getMapper(LikeDao.class);

			int likeChk = lDao.selectLike(pIdx, mIdx);

			if (likeChk == 0) {
				// 좋아요 한번도 누른적 없는 경우
				post.setLikeChk(0);
			} else {
				// 좋아요 누른적 있는 경우
				likeChk = lDao.selectLikeChk(pIdx, mIdx);
				post.setLikeChk(likeChk);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return post;
	}

	// 좋아요
	public Post updateLikes(int pIdx, int mIdx) {

		int result = 0;

		Post post = null;

		try {
			// 해당 게시글 정보 post에 바인딩
			dao = template.getMapper(PostDao.class);
			post = dao.selectPostDetail(pIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			lDao = template.getMapper(LikeDao.class);

			// 좋아요 행 없으면 0 있으면 1
			result = lDao.selectLike(pIdx, mIdx);

			// 좋아요 행 없는 경우(최초 좋아요 클릭) -> insert (chk = 1)
			if (result == 0) {
				result = lDao.insertLike(pIdx, mIdx, 1);
			} else {
				// 좋아요 행 있는 경우 -> chk 값 바꿔주기
				int likeChk = lDao.selectLikeChk(pIdx, mIdx);

				if (likeChk == 0) {
					result = lDao.updateLike(pIdx, mIdx, 1);
				} else {
					result = lDao.updateLike(pIdx, mIdx, 0);
				}

			}

			// 게시글의 좋아요 수 업데이트 과정 시작
			int likeCheck = 0;
			likeCheck = lDao.selectLikeChk(pIdx, mIdx);

			if (likeCheck == 1) {
				// 좋아요 1로 바꼈으면 -> 게시글 좋아요 개수 +1
				dao.updatePostLikes(pIdx, 1);
				post = dao.selectPostDetail(pIdx);
				post.setLikeChk(likeCheck);
			} else {
				// 좋아요 0으로 바꼈으면 -> 게시글 좋아요 개수 -1
				dao.updatePostLikes(pIdx, -1);
				post = dao.selectPostDetail(pIdx);
				post.setLikeChk(likeCheck);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return post;
	}

	public List<Post> getPostListByK(String keyword) {
		dao = template.getMapper(PostDao.class);

		System.out.println(keyword);

		List<Post> PostList = dao.selectPostByKeyword(keyword);

		return PostList;
	}

}
