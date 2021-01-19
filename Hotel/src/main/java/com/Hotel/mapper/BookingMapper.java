package com.Hotel.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;

import com.Hotel.dto.BookingDTO;

public interface BookingMapper {
	@Delete("DELETE FROM WHERE B_ROCODE=#{b_rocode}")
	public int BookingDel(String b_rocode);

	
	public String bcodeCheck(String inputBcode);

	public int bookingCheck(BookingDTO bookingDTO);

	public String getbocode();
}
