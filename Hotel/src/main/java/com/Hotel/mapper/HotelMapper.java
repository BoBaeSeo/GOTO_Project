package com.Hotel.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.Hotel.dto.H_InfoDTO;
import com.Hotel.dto.HotelDTO;
import com.Hotel.dto.ReviewDTO;
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
}
