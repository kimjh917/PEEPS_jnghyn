package com.jnghyn.peeps.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jnghyn.peeps.domain.Peeps;

@Controller
public class MainViewController {
	
	// 마이 페이지
	@RequestMapping("/")
	public String startMypage(
			@RequestParam(value = "p", defaultValue = "1") int p,
			HttpSession session
			) {
		
		// 임시 로그인 정보 session
		Peeps peeps = new Peeps(1, "쩡", "jnghyn", "profilephoto.jpg", "#일상기록 #핍스");
		session.setAttribute("peeps", peeps);
		
		return "post/myPage";
	}
	
	// 마이페이지 (회원아이디를 통해 각 계정 마이페이지 방문)
	@RequestMapping("/{mid}")
	public String goMyPage(
			@RequestParam(value = "p", defaultValue = "1") int p,
			@PathVariable("mid") String mid,
			HttpSession session
			) {
		
		// 임시 로그인 정보 session
		Peeps peeps = new Peeps(1, "쩡", "jnghyn", "profilephoto.jpg", "#일상기록 #핍스");
		session.setAttribute("peeps", peeps);
		
		return "post/myPage";
	}
	
	// 게시글 작성 폼
	@RequestMapping("/upload")
	public String goWriteForm() {
		return "post/postWriteForm";
	}
	
	// 마이페이지의 지도 리스트
	@RequestMapping("/{mid}/map") 
	public String goMapMypage(
			@PathVariable("mid") String mid
			) {
		return "post/myPageMap";
	}
	
	// 게시글 상세보기
	@RequestMapping("/detail")
	public String goDetailView(
			@RequestParam("idx") int postIdx
			) {
		return "post/postDetailView";
	}
	
	// 게시글 수정 폼
	@RequestMapping("/edit")
	public String goEditForm(
			@RequestParam("idx") int postIdx
			) {
		return "post/postEditForm";
	}
	
	// 게시글 검색 
	@RequestMapping("/search")
	public String searchPost(
			Model model,
			HttpServletRequest request
			) throws UnsupportedEncodingException {
		String keyword = request.getParameter("keyword");
		String PostKeyword = URLDecoder.decode(keyword, "UTF-8");
		model.addAttribute("PostKeyword", PostKeyword);
		return "post/postSearch";
	}
	


}
