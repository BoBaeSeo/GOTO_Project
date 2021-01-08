package com.Hotel.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.Hotel.dto.H_InfoDTO;
import com.Hotel.dto.HeartDTO;
import com.Hotel.dto.HotelDTO;
import com.Hotel.dto.RoomDTO;

public interface HotelMapper {

	int getHotelListCnt();

	List<Map<String, Object>> c_HotelListNotCtname(Map map);
	
	List<Map<String, Object>> c_HotelListInCtname(Map map);

	List<Map<String, Object>> c_HotelList(Map map);

	H_InfoDTO getHotelInfo(String hocode);

	ArrayList<RoomDTO> c_RoomList(String hocode);

	HotelDTO gethotel(String hocode);

	int updateScore(String hocode);

	float getHoscroe(String hocode);

	ArrayList<HotelDTO> a_hotelList(String loginId);

	String getPw(String loginId);

	void deleteRoom(String hocode);

	int deleteHotel(String hocode);

	ArrayList<HeartDTO> getHeartList(String loginId);

	String getHtcode();

	int insertHeart(HeartDTO heartDTO);

	int deleteHeart(HeartDTO heartDTO);
}
