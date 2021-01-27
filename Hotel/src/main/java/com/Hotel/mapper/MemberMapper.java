package com.Hotel.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.Hotel.dto.MemberDTO;
import com.Hotel.dto.PageDTO;
import com.Hotel.dto.ReviewDTO;

public interface MemberMapper {

	public String MemberLogin(MemberDTO memberDTO);

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

	public MemberDTO bookingCheck(String mcode);

	public int joinMember(MemberDTO memberDTO);

	public String idCheck(String mid);

	public String getMcode();

//	회원정보 가져오기
	MemberDTO selectMembers(String loginId);

//	회원정보 수정
	int updateMembers(Map<String, Object> memberMap);

	int c_memberDelete(MemberDTO memberDTO);

	void c_delHistory(MemberDTO memberDTO);

	void c_delReview(MemberDTO memberDTO);

	void c_delHistoryVcode(String vcode);

	void c_delBooking(MemberDTO memberDTO);

	void c_delHeart(MemberDTO memberDTO);

	void c_delHelp(MemberDTO memberDTO);

	// 찜목록 출력
	public List<Map<String, Object>> heartList(Map<String, Object> map);

	// 찜삭제
	public int heartDelete(String htcode);

	// 찜목록 페이징
	public int getHeartListCnt(String htid);

	
	public String findLogin(MemberDTO memberDTO);

	public String findPassword(MemberDTO memberDTO);

	public ArrayList<String> getReviewList(String loginId);

	// 추가추가추가
	// 로그인 api 가입확인
	public String checkKakaoJoin(String userId);

	// kakao 회원가입
	public int kakaoJoin(MemberDTO memberDTO);

	// 비밀번호 select
	public String getMpassword(String userId);
}
