package com.Hotel.mapper;

import java.util.List;
import java.util.Map;

public interface MemberMapper {

	int bookingListCnt(String loginId);

	List<Map<String, Object>> c_myBookingList(Map<String, Object> pageAndId);


}
