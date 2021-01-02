package com.Hotel.mapper;

import java.util.ArrayList;
import java.util.Map;

import com.Hotel.dto.HotelDTO;

public interface HotelMapper {

	int getHotelListCnt();

	ArrayList<HotelDTO> c_HotelListNotCtname(Map map);
	
	ArrayList<HotelDTO> c_HotelListInCtname(Map map);

	ArrayList<HotelDTO> c_HotelList(Map map);
}
