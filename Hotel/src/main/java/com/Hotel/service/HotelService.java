package com.Hotel.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.BookingDTO;
import com.Hotel.dto.CityDTO;
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


		// 호텔 리스트 가져오기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ctname", ctname);
		map.put("bookingDTO", bookingDTO);
		map.put("pageDTO", pageDTO);
		List<Map<String, Object>> hotelList = hotelMapper.c_HotelList(map);
		
		// 페이징 처리
		int hotelListCnt = hotelMapper.getHotelListCnt(map);
		int maxPage = (int)(Math.ceil((double)hotelListCnt / pageLimit));
		System.out.println(maxPage);
		int startPage = ((int)(Math.ceil((double)page/pageNumLimit))-1) * pageNumLimit + 1;
		int endPage = startPage + pageNumLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		pageDTO.setPage(page);
		pageDTO.setStartpage(startPage);
		pageDTO.setEndpage(endPage);
		pageDTO.setMaxpage(maxPage);
		
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
		String getHtcode = hotelMapper.getHtcode(); //가장 큰 htcode 가져오기
		int htcodeNum = Integer.parseInt(getHtcode.substring(2,5)) + 1; // htcode에서 숫자부분만 따로 뽑아서 1을 더해준다.
		if(htcodeNum < 10) {
			htcode = "HT00" + htcodeNum; // 더한 htcodeNum이 한자리 숫자면
		} else if(htcodeNum < 100) { // 더한 htcodeNum이 두자리 숫자면
			htcode = "HT0" + htcodeNum;
		} else { // 더한 htcodeNum이 세자리 숫자면
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
	
	public ModelAndView searchHotel(int page, String search) {
		mav = new ModelAndView();
		PageDTO pageDTO = new PageDTO();
		Map<String, Object> map = new HashMap<String, Object>();
//		페이징처리
		int pageLimit =5;
		int pageNumLimit = 3;
		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;

		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);
		
		map.put("search", search);
		map.put("startrow", pageDTO.getStartrow());
		map.put("endrow", pageDTO.getEndrow());
		
//		호텔 리스트
		List<Map<String, Object>> searchHotelList = hotelMapper.searchHotel(map);
		
		int hotelCount = hotelMapper.getHotelCount(search);
		int maxPage = (int)(Math.ceil((double)hotelCount/pageLimit));
		int startPage =	((int)(Math.ceil((double)page/pageNumLimit)) - 1) * pageNumLimit + 1;
		int endPage = startPage + pageNumLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		pageDTO.setPage(page);
		pageDTO.setStartpage(startPage);
		pageDTO.setEndpage(endPage);
		pageDTO.setMaxpage(maxPage);
		
		mav.addObject("pageDTO",pageDTO);
		mav.addObject("hotelList", searchHotelList);
		mav.setViewName("hotel/c_HotelList");
		
		return mav;
	}
	
	//호텔등록
		public ModelAndView hotelInfoForm(CityDTO cityDTO, HotelDTO hotelDTO, H_InfoDTO h_infoDTO) throws IllegalStateException, IOException {
			mav = new ModelAndView();
			
			System.out.println("service :: hotelInfoForm");
			
			//호텔 전체 주소
			hotelDTO.setHoaddr("(" + hotelDTO.getHopost() + ")"
										+ hotelDTO.getHoaddress()
										+ hotelDTO.getHoexaddr()
										+ hotelDTO.getHodetail());
			
			//city코드
			String ctcode;
			String ctMaxNum = hotelMapper.ctMaxNum();
			int ctNum = Integer.parseInt(ctMaxNum.substring(2,5))+1;
			if(ctNum < 10) {
				ctcode = "CT" + "00" + ctNum;
			} else if(ctNum < 100) {
				ctcode = "CT" + "0" + ctNum;
			} else {
				ctcode = "CT" + ctNum;
			}
			cityDTO.setCtcode(ctcode);
			
			//hotel코드
			String hocode;
			String hoMaxNum = hotelMapper.hoMaxNum();
			int hoNum = Integer.parseInt(hoMaxNum.substring(2,5))+1;
			if(hoNum < 10) {
				hocode = "HO" + "00" + hoNum;
			} else if(hoNum < 100) {
				hocode = "HO" + "0" + hoNum;
			} else {
				hocode = "HO" + hoNum;
			}
			hotelDTO.setHocode(hocode);
			String loginId = (String) session.getAttribute("ALoginId");	
			loginId = "GG";
			hotelDTO.setHo_cid(loginId);
			
			//h_info코드
			String incode;
			String inMaxNum = hotelMapper.inMaxNum();
			int inNum = Integer.parseInt(inMaxNum.substring(2,5))+1;
			if(inNum < 10) {
				incode = "IN" + "00" + inNum;
			} else if(inNum < 100) {
				incode = "IN" + "0" + inNum;
			} else {
				incode = "IN" + inNum;
			}
			h_infoDTO.setIncode(incode);
			
			//파일등록
			UUID uuid = UUID.randomUUID();
			System.out.println(uuid.toString());
			
			MultipartFile hophoto = hotelDTO.getHophoto();
			String hofilename = uuid.toString() + "_" + hophoto.getOriginalFilename();
			System.out.println("hofilename :: " + hofilename);
			
			String savePath = "C:\\Users\\seeth\\git\\Hotel\\Hotel\\src\\main\\webapp\\resources\\img\\hotelFile\\";
			if(!hophoto.isEmpty()) {
				hophoto.transferTo(new File(savePath+hofilename));
			}
			hotelDTO.setHofileName(hofilename);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("cityDTO", cityDTO);
			map.put("hotelDTO", hotelDTO);
			map.put("h_infoDTO", h_infoDTO);
			
			//호텔정보 insert
			int hotelInfo = hotelMapper.hotelInfoForm(map);
			System.out.println("hotelInfoForm :: " + hotelInfo);
			mav.setViewName("company/companyMain");
			return mav;
		}


		//호텔 상세보기
		public ModelAndView hotelView(String hocode) {
			mav = new ModelAndView();
			
			HotelDTO hotelDTO = hotelMapper.hotelView(hocode);
			H_InfoDTO h_infoDTO = hotelMapper.h_infoView(hocode);
			System.out.println(hotelDTO);
			System.out.println(h_infoDTO);
			
			mav.addObject("hotelDTO", hotelDTO);
			mav.addObject("h_infoDTO", h_infoDTO);
			mav.setViewName("company/a_hotelView");
			return mav;
		}


		public String updateIndetail(H_InfoDTO h_infoDTO) {
			int update = hotelMapper.updateIndetail(h_infoDTO);
			
			String updateResult = null;
			if(update>0) {
				updateResult = "OK";
			} else {
				updateResult = "NO";
			}
			return updateResult;
		}


		public ArrayList<String> getCtborough(CityDTO cityDTO) {
			ArrayList<String> cityList = hotelMapper.getCtborough(cityDTO);
			
			return cityList;
		}
	
		public String updateHit(String hocode) {
			int updateResult = hotelMapper.updateHit(hocode);
			String result = "NO";
			if(updateResult > 0) result = "OK";
			return result;
		}


}
