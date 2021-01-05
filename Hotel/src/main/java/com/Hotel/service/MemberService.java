package com.Hotel.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

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
		String loginId = "AAAA";
		
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


}
