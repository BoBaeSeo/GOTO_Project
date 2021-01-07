package com.Hotel.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.MemberDTO;
import com.Hotel.dto.PageDTO;
import com.Hotel.mapper.MemberMapper;

@Service
public class MemberService {

	private ModelAndView mav;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private HttpSession session;
	
	public ModelAndView c_myBookingList(int page) {
		mav = new ModelAndView();
		String loginId = (String) session.getAttribute("MLoginId");
		
		//페이징 처리
		PageDTO pageDTO = new PageDTO();
		int pageLimit = 5;
		int pageNumLimit = 3;
		int startRow = (page - 1)* pageLimit + 1;
		int endRow = page * pageLimit;
		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);
		int bookingListCnt = memberMapper.bookingListCnt(loginId);
		int maxPage = (int)(Math.ceil((double) bookingListCnt/pageLimit));
		int startPage = (int)((Math.ceil((double) page/pageNumLimit))-1) * pageNumLimit + 1;
		int endPage = startPage + pageNumLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		pageDTO.setPage(page);
		pageDTO.setStartpage(startPage);
		pageDTO.setEndpage(endPage);
		pageDTO.setMaxpage(maxPage);
		
		// bookingList select
		Map<String, Object> pageAndId = new HashMap<String, Object>();
		pageAndId.put("pageDTO", pageDTO);
		pageAndId.put("loginId", loginId);
		List<Map<String, Object>> bookingList = memberMapper.c_myBookingList(pageAndId);
		System.out.println(bookingList);
		mav.addObject("pageDTO", pageDTO);
		mav.addObject("bookingList", bookingList);
		mav.setViewName("member/c_myBookingList");
		return mav;
	}

	public String deleteBooking(String bcode) {
		// 예약 취소
		int deleteResult = memberMapper.deleteBooking(bcode);
		String result = "NO";
		if(deleteResult > 0) {
			result = "OK";
		}
		return result;
	}

	public ModelAndView a_memberList() {
		mav = new ModelAndView();
		// 회원리스트
		ArrayList<MemberDTO> memberList = memberMapper.a_memberList();
		mav.addObject("memberList", memberList);
		mav.setViewName("member/a_memberList");
		return mav;
	}

	@Transactional(rollbackFor = {Exception.class})
	public String a_memberDelete(MemberDTO memberDTO) {
		// member에 연결된 테이블에서 정보 삭제
		memberMapper.a_delHistory(memberDTO);
		String vcode = memberMapper.getvcode(memberDTO);
		memberMapper.a_delHistoryVcode(vcode);
		memberMapper.a_delReview(memberDTO);
		memberMapper.a_delBooking(memberDTO);
		memberMapper.a_delHeart(memberDTO);
		memberMapper.a_delHelp(memberDTO);
		
		// member 삭제 
		int deleteResult = memberMapper.a_memberDelete(memberDTO);
		String result = "NO";
		if(deleteResult > 0) {
			result = "OK";
		}
		return result;
	}
	
	//회원로그인부분
	public ModelAndView MemberLogin(MemberDTO memberDTO) {
		mav = new ModelAndView();
		
		//회원로그인 session값 MLoginId
		String MLoginId = memberMapper.MemberLogin(memberDTO);
		System.out.println("MLoginId:::" + MLoginId);
		session.setAttribute("MLoginId", MLoginId);
		
		//회원아이디 값이 null이 아니면 메인으로
		if (MLoginId!=null) {
			mav.setViewName("redirect:/");
		}else {
			mav.setViewName("member/MemberLoginForm");
		}
		return mav;
	}


}
