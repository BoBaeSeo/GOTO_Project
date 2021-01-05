package com.Hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.service.MemberService;

@Controller
public class MemberController {

	private ModelAndView mav;
	
	@Autowired
	private MemberService memberService;
	//	(고객페이지) 내가 예약한 목록
	@RequestMapping(value = "c_myBookingList")
	public ModelAndView c_myBookingList(@RequestParam(value="page", defaultValue = "1")int page) {
		mav = memberService.c_myBookingList(page);
		return mav;
	}
//	내가 예약한 목록 foreach문으로 불러오기
//	호텔이름 누르면 호텔상세보기
//	호텔 예약취소(날짜가 현재랑 비교해 미래일 경우 삭제)
	
	
//	-- 회원 리스트 (관리자)
//	회원코드, 회원이름, 회원아이디, 회원이메일, 삭제

}
