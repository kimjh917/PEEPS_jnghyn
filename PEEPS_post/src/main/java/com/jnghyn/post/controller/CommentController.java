package com.jnghyn.post.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jnghyn.post.domain.CommentListView;
import com.jnghyn.post.domain.CommentRequest;
import com.jnghyn.post.domain.Reply;
import com.jnghyn.post.domain.ReplyRequest;
import com.jnghyn.post.service.CommentService;
import com.jnghyn.post.service.PostListService;
import com.jnghyn.post.service.ReplyService;

@RestController
@RequestMapping("rest/cmt")
@CrossOrigin
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private PostListService listService;
	
	// 댓글 목록 조회
	@GetMapping(value = "/select")
	public CommentListView cmtList(int postIdx) {
		return commentService.cmtSelect(postIdx);
	}
	
	// 댓글 달기
	@PostMapping(value = "/insert")
	public int cmtInsert(CommentRequest request) {
		return commentService.cmtInsert(request);
	}

	// 댓글 수정
	@PostMapping(value = "/edit")
	public int cmtEdit(int cmt_idx, String cmt_content) {
		return commentService.cmtEdit(cmt_idx, cmt_content);
	}

	// 댓글 삭제
	@PostMapping(value = "/del")
	public int cmtDel(int cmt_idx) {
		return commentService.cmtDel(cmt_idx);
	}

	// 대댓글 조회
	@GetMapping(value = "/reply/select")
	public List<Reply> reList(int cmt_idx) {
		return replyService.selectReList(cmt_idx);
	}
	
	// 대댓글 달기
	@PostMapping(value = "/reply/insert")
	public int cmtInsert(ReplyRequest request) {
		return replyService.InsertReply(request);
	}

	// 대댓글 수정
	@PostMapping(value = "/reply/edit")
	public int EditReply(int re_idx, String re_content) {
		return replyService.EditReply(re_idx, re_content);
	}

	// 대댓글 삭제
	@PostMapping(value = "/reply/del")
	public int DelReply(int re_idx) {
		return replyService.DelReply(re_idx);
	}
	

}
