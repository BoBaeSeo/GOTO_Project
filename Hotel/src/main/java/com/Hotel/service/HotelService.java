package com.Hotel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.BookingDTO;
import com.Hotel.dto.H_InfoDTO;
import com.Hotel.dto.HeartDTO;
import com.Hotel.dto.HistoryDTO;
import com.Hotel.dto.HotelDTO;
import com.Hotel.dto.PageDTO;
import com.Hotel.dto.ReviewDTO;
import com.Hotel.dto.RoomDTO;
import com.Hotel.mapper.HotelMapper;
import com.Hotel.mapper.ReviewMapper;

@Service
public class HotelService {

	ModelAndView mav;
	
	@Autowired
	private HotelMapper hotelMapper;
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	@Autowired
	private HttpSession session;
	
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

		// 호텔 리스트 가져오기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ctname", ctname);
		map.put("bookingDTO", bookingDTO);
		map.put("pageDTO", pageDTO);
		List<Map<String, Object>> hotelList;
		if(bookingDTO.getBcheckin() == null) {
			System.out.println("1");
			hotelList = hotelMapper.c_HotelList(map);
		} else if(ctname.equals("null")) {
			System.out.println("2");
			hotelList = hotelMapper.c_HotelListNotCtname(map);
		} else {
			System.out.println("3");
			hotelList = hotelMapper.c_HotelListInCtname(map);
		}
		System.out.println(hotelList);
		
		// 찜 리스트 가져오기
		String loginId = (String) session.getAttribute("MLoginId");
		ArrayList<HeartDTO> heartList = hotelMapper.getHeartList(loginId);
		
		mav.addObject("heartList", heartList);
		mav.addObject("ctname", ctname);
		mav.addObject("searchData", bookingDTO);
		mav.addObject("hotelList", hotelList);
		mav.addObject("pageDTO", pageDTO);
		mav.setViewName("hotel/c_HotelList");
		return mav;
	}

	//	(고객페이지) 룸리스트  
	public ModelAndView c_RoomList(String hocode) {
		mav = new ModelAndView();
		
		//호텔 정보 가져오기
		H_InfoDTO h_info = hotelMapper.getHotelInfo(hocode);
		HotelDTO hotelDTO = hotelMapper.gethotel(hocode);
		
		//룸 리스트 가져오기
		ArrayList<RoomDTO> roomList = hotelMapper.c_RoomList(hocode);
		
		//후기 리스트 & 개수 가져오기
		ArrayList<ReviewDTO> reviewList = reviewMapper.getReviewList(hocode);
		int reviewCnt = reviewMapper.getReviewCnt(hocode);
		
		// 좋아요
		String loginId = (String) session.getAttribute("MLoginId");
		ArrayList<HistoryDTO> likeList = reviewMapper.getlikeList(loginId);
		mav.addObject("h_info", h_info);
		mav.addObject("hotelDTO", hotelDTO);
		mav.addObject("roomList", roomList);
		mav.addObject("reviewList", reviewList);
		mav.addObject("reviewCnt", reviewCnt);
		mav.addObject("likeList", likeList);
		mav.setViewName("room/c_RoomList");
		return mav;
	}

	public ModelAndView a_hotelList() {
		mav = new ModelAndView();
		String loginId = (String) session.getAttribute("ALoginId");
		loginId = "AACM";
		// 업체 hotelList 불러오기
		ArrayList<HotelDTO> hotelList = hotelMapper.a_hotelList(loginId);
		String pw = hotelMapper.getPw(loginId);
		System.out.println(hotelList);
		mav.addObject("hotelList", hotelList);
		mav.addObject("password", pw);
		mav.setViewName("hotel/a_HotelList");
		return mav;
	}

	@Transactional(rollbackFor = {Exception.class})
	public String deleteHotel(String hocode) {
		// room & hotel delete
		hotelMapper.deleteRoom(hocode);
		int deleteResult = hotelMapper.deleteHotel(hocode);
		String result = "NO";
		if(deleteResult > 0) {
			result = "OK";
		}
		return result;
	}

	public String insertHeart(HeartDTO heartDTO) {
		// htcode 만들기
		String htcode = null;
		String getHtcode = hotelMapper.getHtcode();
		int htcodeNum = Integer.parseInt(getHtcode.substring(2,5)) + 1;
		if(htcodeNum < 10) {
			htcode = "HT00" + htcodeNum;
		} else if(htcodeNum < 100) {
			htcode = "HT0" + htcodeNum;
		} else {
			htcode = "HT" + htcodeNum;
		}
		heartDTO.setHtcode(htcode);
		// heart insert
		int insertResult = hotelMapper.insertHeart(heartDTO);
		String result = "NO";
		if(insertResult > 0) {
			result = "OK";
		}
		return result;
	}

	public String deleteHeart(HeartDTO heartDTO) {
		// heart delete
		int deleteResult = hotelMapper.deleteHeart(heartDTO);
		String result = "NO";
		if(deleteResult > 0) {
			result = "OK";
		}
		return result;
	}

}
