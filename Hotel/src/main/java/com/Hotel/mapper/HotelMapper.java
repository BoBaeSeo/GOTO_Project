package com.Hotel.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.Hotel.dto.CityDTO;
import com.Hotel.dto.H_InfoDTO;
import com.Hotel.dto.HeartDTO;
import com.Hotel.dto.HotelDTO;
import com.Hotel.dto.RoomDTO;

public interface HotelMapper {

	int getHotelListCnt(Map<String, Object> map);

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
	
	public HotelDTO bookingCheck(String hocode);

	List<Map<String, Object>> searchHotel(Map<String, Object> map);

	int getHotelCount(String search);

	public String ctMaxNum();

	public int hotelInfoForm(Map<String, Object> map);

	public String hoMaxNum();

	public String inMaxNum();

	public HotelDTO hotelView(String hocode);

	public H_InfoDTO h_infoView(String hocode);

	public int updateIndetail(H_InfoDTO h_infoDTO);

	public ArrayList<String> getCtborough(CityDTO cityDTO);

	
	int updateHitZero();

	int updateHit(String hocode);

	ArrayList<HotelDTO> gethitList(String loginId);

	
}
