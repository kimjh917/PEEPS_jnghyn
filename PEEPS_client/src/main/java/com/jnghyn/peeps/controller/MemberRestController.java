package com.jnghyn.peeps.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jnghyn.peeps.domain.Peeps;
import com.jnghyn.peeps.service.FindMemberService;

@RestController
@RequestMapping("rest")
public class MemberRestController {
	
	@Autowired
	private FindMemberService findMemberService;
	
	// 전체 회원 정보 조회
	@GetMapping("/memberList")
	public List<Peeps> MemberList(HttpServletRequest request){
		
		System.out.println("member rest controller 진입");
		
		return findMemberService.getMemberList();
	}
	
	// 인덱스로 특정 회원 정보 조회
	@GetMapping("/memberInfo")
	public Peeps MemberInfo(
			@RequestParam("mIdx") int mIdx
			){
		
		System.out.println("member rest controller 진입");
		
		return findMemberService.getMemberInfo(mIdx);
	}
	
	// 아이디로 특정 회원 정보 조회
	@GetMapping("/mbrInfo")
	public Peeps MbrInfo(
			@RequestParam("mId") String mId
			){
		
		System.out.println("member rest controller 진입");
		
		return findMemberService.getMbrInfo(mId);
	}

}
