package com.Hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.MemberDTO;
import com.Hotel.service.MemberService;

@Controller
public class MemberController {

	private ModelAndView mav;
	
	@Autowired
	private MemberService memberService;
	//	(고객페이지) 내가 예약한 목록
	@RequestMapping(value = "c_myBookingList")
	public ModelAndView c_myBookingList(@RequestParam(value="page", defaultValue = "1")int page) {
		System.out.println("c_myBookingList");
		mav = memberService.c_myBookingList(page);
		return mav;
	}
	
	// (고객페이지) 예약 삭제
	@RequestMapping(value = "deleteBooking")
	public @ResponseBody String deleteBooking(String bcode) {
		System.out.println("deleteBooking");
		String result = memberService.deleteBooking(bcode);
		return result;
	}
	
	// (관리자페이지) 회원 리스트
	@RequestMapping(value = "a_memberList")
	public ModelAndView a_memberList() {
		System.out.println("a_memberList");
		mav = memberService.a_memberList();
		return mav;
	}
	
	// 회원 삭제
	@RequestMapping(value = "a_memberDelete")
	public @ResponseBody String a_memberDelete(MemberDTO memberDTO) {
		System.err.println("a_memberDelete");
		String result = memberService.a_memberDelete(memberDTO);
		return result;
	}
	
	// 회원로그인 페이지
	@RequestMapping(value = "/MemberLoginForm")
	public String MemberLoginForm() {
		System.out.println("회원로그인 폼!!");
		return "member/MemberLoginForm";
	}
	
	// 회원로그인부분
	@RequestMapping(value = "/MemberLogin")
	public ModelAndView MemberLogin(MemberDTO memberDTO) {
		System.out.println("/MemberLogin");
		System.out.println("회원로그인 넘어가는..");
		mav = memberService.MemberLogin(memberDTO);
		System.out.println(memberDTO);
		return mav;
	}

}
