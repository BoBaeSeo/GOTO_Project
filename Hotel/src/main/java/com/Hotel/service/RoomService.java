package com.Hotel.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.HotelDTO;
import com.Hotel.dto.RoomDTO;
import com.Hotel.mapper.BookingMapper;
import com.Hotel.mapper.RoomMapper;

@Service
public class RoomService {

	@Autowired
	private RoomMapper roomMapper;

	@Autowired
	private BookingMapper bookingMapper;
	
	@Autowired
	private HttpSession session;
	
	private ModelAndView mav;

	//룸등록 insert부분
	public ModelAndView RoomWrite(RoomDTO roomDTO) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		
		// 파일이름을 랜덤으로 생성하는부분
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		
		MultipartFile rophoto = roomDTO.getRophoto();
		String rofilename = uuid.toString()+"_"+rophoto.getOriginalFilename();
		System.out.println("rofilename::"+rofilename);
		
		roomDTO.setRofilename(rofilename);
		
		//경로값
		String savePath = "C:\\Users\\seeth\\git\\Hotel\\Hotel\\src\\main\\webapp\\resources\\img\\roomFile\\";
		
		//rophoto가 비어있지 않으면 새로운파일 적용가능한 조건문 
		if (!rophoto.isEmpty()) {
			rophoto.transferTo(new File(savePath+rofilename));
		}
		
		//룸등록 insert부분
		int insertResult = roomMapper.RoomWrite(roomDTO);
		System.out.println(roomDTO);
		if (insertResult>0) {
			System.out.println("룸등록성공!");
		}else {
			System.out.println("룸등록실패!");
		}
		mav.setViewName("redirect:/RoomList");
		return mav;
	}

	//룸리스트 ArrayList로 불러오는 부분
	public ModelAndView RoomList(RoomDTO roomDTO) {
		mav = new ModelAndView();
		String ALoginId = (String) session.getAttribute("ALoginId");
		
		ArrayList<RoomDTO> RoomList = roomMapper.RoomList(ALoginId);
		System.out.println("RoomList:::"+RoomList);
		
		mav.addObject("RoomList", RoomList);
		mav.setViewName("room/RoomListForm");
		return mav;
	}
	
	//룸리스트 rocode로 삭제
	@Transactional(rollbackFor = Exception.class)
	public ModelAndView RoomListDel(String rocode, String b_rocode) {
		mav = new ModelAndView();
		//부킹 룸코드삭제
		int BookingDel = bookingMapper.BookingDel(b_rocode);
		//룸코드 삭제
		int RoomListDel = roomMapper.RoomListDel(rocode);
		System.out.println("RoomListDel::"+RoomListDel);
		System.out.println("BookingDel::"+BookingDel);
		mav.setViewName("redirect:/RoomList");
		return mav;
	}

	//룸디테일 select부분
	public ModelAndView RoomDetail(String rocode) {
		mav = new ModelAndView();
		RoomDTO roomDTO = roomMapper.RoomDetail(rocode);
		HotelDTO hotelDTO = roomMapper.getHotelName(rocode);
		
		mav.addObject("roomDTO",roomDTO);
		mav.addObject("hotelDTO", hotelDTO);
		mav.setViewName("room/RoomDetail");
		return mav;
	}
	
//	관리자 룸 디테일 select
	public ModelAndView SelectRoom(String rocode) {
	mav = new ModelAndView();
	RoomDTO roomDTO = roomMapper.RoomDetail(rocode);
	System.out.println(roomDTO);
	mav.addObject("roomDTO", roomDTO);
	mav.setViewName("admin/a_roomDetail");
	return mav;
}

//	룸 수정
	public String RoomModify(RoomDTO roomDTO) throws IllegalStateException, IOException {
		
		// 파일이름을 랜덤으로 생성하는부분
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		
		MultipartFile rophoto = roomDTO.getRophoto();
		String rofilename = uuid.toString()+"_"+rophoto.getOriginalFilename();
		System.out.println("rofilename::"+rofilename);
		
		roomDTO.setRofilename(rofilename);
		
		//경로값
		String savePath = "C:\\Users\\user\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\Hotel\\src\\main\\webapp\\resources\\roomFile\\";
		
		//rophoto가 비어있지 않으면 새로운파일 적용가능한 조건문 
		if (!rophoto.isEmpty()) {
			rophoto.transferTo(new File(savePath+rofilename));
		}
		
	int result = roomMapper.RoomModify(roomDTO);
	String resultSet;
	if(result > 0) {
		resultSet = "redirect:/RoomList";
	}else {
		System.out.println("룸 수정 실패");
		resultSet = "redirect:/RoomList";
	}
	return resultSet;
}

}