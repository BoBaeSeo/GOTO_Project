package com.Hotel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.BookingDTO;
import com.Hotel.dto.HotelDTO;
import com.Hotel.dto.PageDTO;
import com.Hotel.mapper.HotelMapper;

@Service
public class HotelService {

	ModelAndView mav;
	
	@Autowired
	private HotelMapper hotelMapper;
	
	// (고객페이지) 호텔리스트	
	public ModelAndView c_HotelList(BookingDTO bookingDTO, String ctname, int page) {
		mav = new ModelAndView();
		// 페이징 처리
		int pageLimit = 5;
		int pageNumLimit = 3;
		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;
		PageDTO pageDTO = new PageDTO();
		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);
		int hotelListCnt = hotelMapper.getHotelListCnt();
		int maxPage = (int)(Math.ceil((double)hotelListCnt / pageLimit));
		int startPage = ((int)(Math.ceil((double)page/pageNumLimit))-1) * pageNumLimit + 1;
		int endPage = startPage + pageNumLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		pageDTO.setPage(page);
		pageDTO.setStartpage(startPage);
		pageDTO.setEndpage(endPage);
		pageDTO.setMaxpage(maxPage);
		System.out.println("페이징 처리 완료");
		// 호텔 리스트 가져오기
		Map map = new HashMap();
		map.put("ctname", ctname);
		map.put("bookingDTO", bookingDTO);
		map.put("pageDTO", pageDTO);
		ArrayList<HotelDTO> hotelList;
		if(bookingDTO.getBcheckin() == null) {
			hotelList = hotelMapper.c_HotelList(map);
		} else if(ctname == null) {
			hotelList = hotelMapper.c_HotelListNotCtname(map);
		} else {
			hotelList = hotelMapper.c_HotelListInCtname(map);
		}
		System.out.println(hotelList);
		
		mav.addObject("hotelList", hotelList);
		mav.addObject("pageDTO", pageDTO);
		mav.setViewName("hotel/c_hotelList");
		return mav;
	}

}
