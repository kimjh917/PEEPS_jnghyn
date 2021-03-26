package com.jnghyn.post.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jnghyn.post.domain.Post;
import com.jnghyn.post.domain.PostEditRequest;
import com.jnghyn.post.domain.PostFile;
import com.jnghyn.post.domain.PostListView;
import com.jnghyn.post.domain.PostWriteRequest;
import com.jnghyn.post.service.PostDeleteService;
import com.jnghyn.post.service.PostEditService;
import com.jnghyn.post.service.PostListService;
import com.jnghyn.post.service.PostUploadService;

@RestController
@RequestMapping("rest")
@CrossOrigin
public class PostController {

	@Autowired
	private PostListService listService;
	@Autowired
	private PostUploadService uploadService;
	@Autowired
	private PostDeleteService deleteService;
	@Autowired
	private PostEditService editService;

	// 게시글 업로드
	@PostMapping("/upload")
	public int uploadPost(PostWriteRequest writeRequest, HttpServletRequest request) {
		return uploadService.uploadPost(writeRequest, request);
	}

	// 게시글 리스트 출력
	@GetMapping("/list")
	public PostListView getPostList(HttpServletRequest request, @RequestParam(value = "p", defaultValue = "1") int page,
			@RequestParam("mId") String mId, @RequestParam("mIdx") int mIdx) {
		return listService.getPostListView(page, request, mIdx);
	}

	// 게시글 하나 출력
	@GetMapping("/detail")
	public Post getPostDetail(@RequestParam("idx") int postIdx, HttpServletRequest request) {
		return listService.getDetail(postIdx);
	}

	// 게시글의 이미지 출력
	@PostMapping("/detail/image")
	public List<PostFile> getPostDetailImgs(@RequestParam("idx") int postIdx) {
		return listService.getDetailImgs(postIdx);
	}

	// 게시글 삭제
	@GetMapping("/delete")
	public int deletePost(@RequestParam("idx") int postIdx) {
		return deleteService.deletePost(postIdx);
	}

	// 수정한 게시글 업데이트
	@PostMapping("/edit")
	public int updatePost(PostEditRequest editRequest, HttpServletRequest request) {
		return editService.editPost(editRequest, request);
	}

	// 지도 리스트 출력
	@GetMapping("/map")
	public List<Post> getMapList(@RequestParam("mId") String mId, @RequestParam("mIdx") int mIdx,
			HttpServletRequest request) {
		return listService.getMapListView(mIdx);
	}

	// 마커 클릭 시 해당 주소가 추가된 게시글 리스트 출력
	@PostMapping("/postmaplist")
	public List<Post> getMapPostList(@RequestParam("postAdd") String pAddr, @RequestParam("mIdx") int mIdx,
			HttpServletRequest request) {
		return listService.getPostListByMapView(mIdx, pAddr);
	}

	// 좋아요 여부
	@GetMapping("/likeChk")
	public Post getLikes(HttpServletRequest request) {
		int postIdx = Integer.parseInt(request.getParameter("pIdx"));
		return listService.getLikes(postIdx, request);
	}

	// 좋아요
	@GetMapping("/likes")
	public Post updateLikes(HttpServletRequest request) {
		int postIdx = Integer.parseInt(request.getParameter("pIdx"));
		int mIdx = Integer.parseInt(request.getParameter("mIdx"));
		return listService.updateLikes(postIdx, mIdx);
	}

	// 게시글 검색
	@PostMapping("/searchPost")
	public List<Post> PostList(@RequestParam("keyword") String keyword) {

		return listService.getPostListByK(keyword);
	}

}
