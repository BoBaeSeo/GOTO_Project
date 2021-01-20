package com.Hotel.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.Hotel.dto.HotelDTO;
import com.Hotel.dto.RoomDTO;

public interface RoomMapper {

	public int RoomWrite(RoomDTO roomDTO);
	
	public ArrayList<RoomDTO> RoomList(String ALoginId);

	@Delete("DELETE FROM ROOM WHERE ROCODE=#{rocode}")
	public int RoomListDel(String rocode);
	
	@Select("SELECT * FROM ROOM WHERE ROCODE=#{rocode}")
	public RoomDTO RoomDetail(String rocode);
	
	public RoomDTO bookingCheck(String rocode);

	public HotelDTO getHotelName(String rocode);
	
	int RoomModify(RoomDTO roomDTO);

	public String getrocode();
}
