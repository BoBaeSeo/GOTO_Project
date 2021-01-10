package com.Hotel.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.Hotel.dto.MemberDTO;

public interface MemberMapper {

	int bookingListCnt(String loginId);

	List<Map<String, Object>> c_myBookingList(Map<String, Object> pageAndId);

	int deleteBooking(String bcode);

	ArrayList<MemberDTO> a_memberList();

	int a_memberDelete(MemberDTO memberDTO);

	void a_delHistory(MemberDTO memberDTO);

	ArrayList<String> getvcode(MemberDTO memberDTO);

	void a_delReview(MemberDTO memberDTO);

	void a_delHistoryVcode(String vcode);

	void a_delBooking(MemberDTO memberDTO);

	void a_delHeart(MemberDTO memberDTO);

	void a_delHelp(MemberDTO memberDTO);
	
	public String MemberLogin(MemberDTO memberDTO);

}
