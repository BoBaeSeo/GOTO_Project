package com.Hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.BookingDTO;
import com.Hotel.service.HotelService;

@Controller
public class HotelController {

	ModelAndView mav;
	
	@Autowired
	private HotelService hotelService;
	
	//	(고객페이지) 호텔리스트
	@RequestMapping(value="c_HotelList")
	public ModelAndView c_HotelList(BookingDTO bookingDTO, String ctname ,@RequestParam(value="page", defaultValue = "1") int page) {
		System.out.println("c_HotelList");
		mav = hotelService.c_HotelList(bookingDTO, ctname ,page);
		return mav;
	}
//	페이징처리
//	왼쪽 카테고리 바뀌면 호텔리스트도 바뀌도록
//	호텔사진이랑 이름 클릭하면 룸리스트로 가도록
//	지도대신 일본사진

	
	
//	-- 룸리스트   
//	호텔정보, 세부사항 불러오기
//	호텔후기 등록,수정,삭제,좋아요
//	방리스트 불러오기
//	방리스트랑 호텔후기는 스크롤
	
	
//	-- 호텔리스트(관리자)
//	각자 자기 등록한 호텔만 보이게 sessionScope.loginId)
//	지역코드, 업체코드, 호텔코드, 호텔이름, 삭제


}
