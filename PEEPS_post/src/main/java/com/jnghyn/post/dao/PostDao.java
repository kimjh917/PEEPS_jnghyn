package com.jnghyn.post.dao;

import java.util.List;

import com.jnghyn.post.domain.Post;
import com.jnghyn.post.domain.PostFile;

public interface PostDao {
	
	// public abstract 
	
	// 게시글 등록
	int insertPost(Post post);
	
	// 게시글 썸네일 update
	int updatePostThumbnail(int pidx, String pthumbnailFilename);
	
	// 게시글의 총 수
	int selectTotalPostCount(int memberidx); 
	// 게시글의 총 수(주소)
	int selectTotalPostByAddrCount(int memberidx, String addr);
	
	// 게시글 리스트(페이지 번호에 맞는)
	List<Post> selectPostList(int memberidx, int startRow, int cntPerPage);
	// 게시글 리스트(위치 조회)
	List<Post> selectPostMapList(int memberidx);
	// 게시글 리스트(주소)
	List<Post> selectPostByAddrList(String addr, int memberidx);
	
	// 게시글 하나 조회
	Post selectPostDetail(int pidx);
	
	// 게시글 파일 조회
	List<PostFile> selectPostFileList(int pidx);
	
	// 게시글 삭제
	int deletePostByIdx(int pidx);
	
	// 게시글 update
	int updatePost(Post post);
	
	// 게시글 좋아요 개수 update
	int updatePostLikes(int pIdx, int pm);

	

}
