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

	//	(고객페이지) 룸리스트  
	@RequestMapping(value = "c_RoomList")
	public ModelAndView c_RoomList(String hocode) {
		System.out.println("c_RoomList");
		mav = hotelService.c_RoomList(hocode);
		return mav;
	}
	
//	-- 호텔리스트(관리자)
//	각자 자기 등록한 호텔만 보이게 sessionScope.loginId)
//	지역코드, 업체코드, 호텔코드, 호텔이름, 삭제


}
